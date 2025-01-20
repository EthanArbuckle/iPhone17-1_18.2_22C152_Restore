@interface SiriPresentationViewController
+ (id)_applicationStateHelper;
+ (id)extractTestingInputsFromContext:(id)a3;
+ (void)_failTestWithName:(id)a3 andFailure:(id)a4;
- (AFConnection)unownedConnection;
- (AFQueue)_testInputQueue;
- (AFUISiriLanguage)_language;
- (AFUISiriSAEEffectsViewController)siriEffectsViewController;
- (AFUISiriSetupViewController)siriSetupViewController;
- (AFUISiriViewController)siriViewController;
- (AFWatchdogTimer)animationDismissalTimer;
- (BOOL)_AFPreferencesAlwaysEyesFreeEnabled;
- (BOOL)_activeTCCHasContentAtPoint:(CGPoint)a3;
- (BOOL)_buttonDownEventDidOccur;
- (BOOL)_buttonIdentifierIsHoldToTalkTrigger:(int64_t)a3;
- (BOOL)_canPresentSiriEffectsViewControllerWithRequestOptions:(id)a3;
- (BOOL)_canShowHintGlow;
- (BOOL)_canShowWhileLocked;
- (BOOL)_cancelPendingPhoneCall;
- (BOOL)_handleTapButtonBehavior:(int64_t)a3;
- (BOOL)_handleTapDismissal:(int64_t)a3;
- (BOOL)_hasTestingInput;
- (BOOL)_isDeviceButton:(int64_t)a3;
- (BOOL)_isSpringBoardIdleTimerDisabled;
- (BOOL)_isSpringBoardMainScreenPresentation;
- (BOOL)_isVoiceActivationMaskShown;
- (BOOL)_isWaitingForTelephonyToStart;
- (BOOL)_releaseExistingTrigger;
- (BOOL)_shouldAllowResizingBetweenModesForViewMode:(int64_t)a3;
- (BOOL)_shouldDeferWake;
- (BOOL)_shouldHandleNewRequestWithOptions:(id)a3 currentRequest:(id)a4;
- (BOOL)_shouldKeepPonging;
- (BOOL)_shouldProceedPresentingSiriViewController;
- (BOOL)_shouldRequestPresentationForState:(int64_t)a3 forNewRequest:(id)a4 currentRequest:(id)a5;
- (BOOL)_shouldShowSetupViewControllerForRequestSource:(int64_t)a3;
- (BOOL)_startGuidedAccessOnDismissal;
- (BOOL)_wasScreenOffDuringActivation;
- (BOOL)headphonesAuthenticated;
- (BOOL)isAmbientPresented;
- (BOOL)isEnabled;
- (BOOL)predictedRecordRouteIsZLL;
- (BOOL)presentationHostedInSpringBoard;
- (BOOL)presentationisIdleAndQuiet;
- (BOOL)siriSetupViewController:(id)a3 openURL:(id)a4;
- (BOOL)siriSetupViewControllerPresented;
- (BOOL)siriViewController:(id)a3 attemptUnlockWithPassword:(id)a4;
- (BOOL)siriViewControllerConfigured;
- (BOOL)siriViewControllerShouldEndSession:(id)a3;
- (BSInvalidatable)edgeLightWindowLevelInvalidable;
- (BSServiceConnection)connection;
- (CGRect)_fallbackFrameForScreen:(id)a3 withIdentifier:(int64_t)a4;
- (CGRect)hostedPresentationFrame;
- (NSArray)contextAppInfosForSiriViewController;
- (NSArray)currentCarPlaySupportedOEMAppIdList;
- (NSArray)starkAppBundleIdentifierContext;
- (NSDate)_lastAppUpdateTimestamp;
- (NSMutableDictionary)deviceEngagementTimeStamps;
- (NSTimer)_carSiriButtonHoldToTalkTimer;
- (NSTimer)clearSiriViewControllerTimer;
- (NSTimer)pongTimer;
- (SASHeadphonesAuthenticationManager)headphonesAuthenticationManager;
- (SASUIDeviceScreenEngagementController)_deviceScreenEngagementController;
- (SBSHardwareButtonSystemGlowStyleControlling)hintGlowAssertion;
- (SRUIFTrialManager)trialManager;
- (SUICApplicationStateHelper)applicationStateHelper;
- (SiriPresentationControllerDelegate)siriPresentationControllerDelegate;
- (SiriPresentationIntentUsageDelegate)intentUsageDelegate;
- (SiriPresentationOptions)currentPresentationOptions;
- (SiriPresentationStateProvider)presentationStateProvider;
- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3;
- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4;
- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4 displayConfiguration:(id)a5;
- (UIEdgeInsets)safeAreaInsetsForSceneCreationInSiriViewController:(id)a3;
- (UINavigationController)siriSetupNavigationController;
- (double)_buttonDownTimestamp;
- (double)_carSiriButtonTimeInterval;
- (double)hintGlowPresentedDelayIntervalInMs;
- (id)_analytics;
- (id)_createPatternFromAHAP:(id)a3;
- (id)_createPresentationPropertiesWithRequestOptions:(id)a3;
- (id)_createSiriViewControllerWithRequestOptions:(id)a3;
- (id)_dequeueTestingInput;
- (id)_fallbackScreenForIdentifier:(int64_t)a3;
- (id)_foregroundAppInfosForUIPresentationIdentifier:(id)a3;
- (id)_uiPresentationIdentifier;
- (id)_updateDismissalOptionsIfNecessary:(id)a3;
- (id)_updateRequestOptionsWithTestingInput:(id)a3;
- (id)_viewHostingInstrumentationHandler;
- (id)bulletinsForSiriViewController:(id)a3;
- (id)getDeviceEngagementEvents:(id)a3 forDeviceEngagementTimeWindow:(double)a4;
- (id)requestCachedSceneHostedView;
- (id)siriViewController:(id)a3 bulletinWithIdentifier:(id)a4;
- (id)siriViewController:(id)a3 didStopRequestWithOptions:(id)a4;
- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4;
- (int64_t)_dismissalReasonForDismissalWithOptions:(id)a3;
- (int64_t)_impliedDismissalReasonFromState;
- (int64_t)_presentationIdentifierFromUIPresentationIdentifier:(id)a3;
- (int64_t)_viewModeForRequestOptions:(id)a3;
- (int64_t)currentGlowState;
- (int64_t)currentViewMode;
- (int64_t)identifier;
- (int64_t)preferredFlamesViewFidelity;
- (int64_t)presentationState;
- (os_unfair_lock_s)lock;
- (unint64_t)currentLockState;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateOutSiriEffectsView;
- (void)_applicationsDidChange;
- (void)_callIsActiveDidChangeNotification:(id)a3;
- (void)_cancelPendingActivationWithReason:(unint64_t)a3;
- (void)_carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:(int64_t)a3;
- (void)_checkForGuideUpdatesIfNecessary;
- (void)_cleanupUnownedConnection;
- (void)_clearAllTestingInputs;
- (void)_clearSiriViewControllerWithCompletion:(id)a3;
- (void)_dismissDueToUnexpectedError:(id)a3;
- (void)_dismissSiriSetup;
- (void)_emitInstrumentationDismissalStateWithReason:(int64_t)a3;
- (void)_enableAudioInjection:(BOOL)a3 audioFiles:(id)a4;
- (void)_enableSpringBoardIdleTimer;
- (void)_enqueueTestInput:(id)a3;
- (void)_failedToPresentSiriWithError:(id)a3;
- (void)_finishClearingSiriViewController:(id)a3;
- (void)_handleButtonDownWhileListeningFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5;
- (void)_handleContextClearForRequestOptions:(id)a3;
- (void)_instrumentSuccessfulAppLaunchIfNecessary;
- (void)_invalidateCarSiriButtonHoldToTalkTimer;
- (void)_invalidateHintGlowAssertion;
- (void)_logDismissalRequestedForViewMode:(int64_t)a3 withDismissalReason:(int64_t)a4;
- (void)_logDismissalToPowerLogWithReason:(int64_t)a3;
- (void)_logSignatureWithType:(id)a3 subType:(id)a4 context:(id)a5;
- (void)_playTamaleHaptic;
- (void)_prepareSiriViewControllerWithRequestOptions:(id)a3;
- (void)_presentAndBeginAnimatingEffectsForInvocationType:(int64_t)a3;
- (void)_presentSiriEffectsWithRequestOptions:(id)a3;
- (void)_presentSiriViewControllerWithPresentationOptions:(id)a3 requestOptions:(id)a4;
- (void)_presentationDismissalRequestedWithOptions:(id)a3 withCompletion:(id)a4;
- (void)_presentationRequestedHandlerWithRequestOptions:(id)a3;
- (void)_presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4;
- (void)_prewarmEdgeLightMetalLayers;
- (void)_processConnectionHouseKeeping;
- (void)_processIncomingRequestOptionsForTestingPayload:(id)a3;
- (void)_punchout:(id)a3 completion:(id)a4;
- (void)_removePreviousConversationIfNeededWithTestName:(id)a3 testOptions:(id)a4;
- (void)_removePreviousInjectAudioSettings;
- (void)_removeSetupViewControllerIfNecessary;
- (void)_removeSiriEffectsViewControllerIfNeededUsingBlock:(id)a3;
- (void)_requestDismissal;
- (void)_requestDismissalWithOptions:(id)a3;
- (void)_requestHomeAffordanceSuppression:(int64_t)a3;
- (void)_requestPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)_resetStateForInstrumentation;
- (void)_restartVisualIntelligenceIfNeededForRequestOptions:(id)a3;
- (void)_runSyntheticButtonActivationTest;
- (void)_scheduleConnectionHouseKeepingAfterDelay:(double)a3;
- (void)_sendTelephonyHasStartedAfterDelay:(double)a3;
- (void)_setButtonDownEventDidOccur:(BOOL)a3;
- (void)_setButtonDownTimestamp:(double)a3;
- (void)_setCarSiriButtonHoldToTalkTimer:(id)a3;
- (void)_setCarSiriButtonTimeInterval:(double)a3;
- (void)_setDeviceScreenEngagementController:(id)a3;
- (void)_setEngagementStatus:(id)a3 forType:(int64_t)a4;
- (void)_setLastAppUpdateTimestamp:(id)a3;
- (void)_setScreenOffDuringActivation:(BOOL)a3;
- (void)_setShouldDeferWake:(BOOL)a3;
- (void)_setSpringBoardIdleTimerDisabled:(BOOL)a3;
- (void)_setStartGuidedAccessOnDismissal:(BOOL)a3;
- (void)_setUpUnownedConnectionIfNecessary;
- (void)_setVoiceActivationMaskShown:(BOOL)a3;
- (void)_setWaitingForTelephonyToStart:(BOOL)a3;
- (void)_setupPongTimer;
- (void)_setupSiriViewControllerPresentedSuccessHandler;
- (void)_setupTamaleHaptic;
- (void)_shouldProceedPresentingSiriViewController;
- (void)_showPresentationAndActivateWithRequestOptions:(id)a3;
- (void)_showSetupViewControllerIfNecessary;
- (void)_siriDidOpenURL:(id)a3;
- (void)_startDeviceScreenEngagementController;
- (void)_startRequestWithOptions:(id)a3;
- (void)_startUIRequestWithText:(id)a3 testName:(id)a4;
- (void)_stopDeviceScreenEngagement;
- (void)_tearDownSiriEffectsViewController;
- (void)_teardownPongTimer;
- (void)_telephonyHasStarted;
- (void)_terminateVisualIntelligenceCamera;
- (void)_updateAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3;
- (void)_updateCurrentPresentationOptions:(id)a3 withCompletion:(id)a4;
- (void)_updateHostedPresentationFrame;
- (void)_updateLanguageCode;
- (void)_viewHostingInstrumentationHandler;
- (void)_waitForPing;
- (void)_wasDismissedWithCompletion:(id)a3;
- (void)_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4;
- (void)_watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4;
- (void)activateHintGlow;
- (void)activateWithPresentationOptionsUpdate:(id)a3 requestOptions:(id)a4;
- (void)activateWithRequestOptions:(id)a3;
- (void)activateWithSource:(int64_t)a3 requestOptions:(id)a4 timestamp:(id)a5;
- (void)activateWithSource:(int64_t)a3 timestamp:(id)a4;
- (void)activationDeterminedShouldDeferWake:(id)a3;
- (void)aggregateLockStateDidChange;
- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4;
- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4;
- (void)bulletinManagerDidChangeBulletins;
- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4;
- (void)cancelActivatedHintGlow;
- (void)cancelPendingActivationEventWithReason:(id)a3;
- (void)cancelPreheat;
- (void)dealloc;
- (void)deviceScreenEngagementController:(id)a3 didGainAttentionWithEvent:(int64_t)a4;
- (void)deviceScreenEngagementController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4;
- (void)deviceWonMyriadElection;
- (void)didDismissLocationTCC:(id)a3;
- (void)didPresentLocationTCC:(id)a3;
- (void)disableSiriActivationRequestedBySiriSetupViewController:(id)a3;
- (void)dismiss;
- (void)dismissSiriViewController:(id)a3 withReason:(int64_t)a4;
- (void)dismissWithOptions:(id)a3;
- (void)handleButtonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5;
- (void)handleButtonLongPressFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6;
- (void)handleButtonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5;
- (void)handleButtonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6;
- (void)handleRequestWithOptions:(id)a3;
- (void)handleRequestWithPresentationOptionsUpdate:(id)a3 requestOptions:(id)a4;
- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4;
- (void)invalidate;
- (void)invalidateSystemApertureAssertion;
- (void)notePanBeganAtPoint:(CGPoint)a3;
- (void)noteTapAtPoint:(CGPoint)a3;
- (void)openSiriRequestedBySiriSetupViewController:(id)a3;
- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6;
- (void)ping;
- (void)preheatWithOptions:(id)a3;
- (void)presentationDismissalRequestedWithOptions:(id)a3;
- (void)presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4;
- (void)presentationStateProvider:(id)a3 presentationStateDidChange:(id)a4;
- (void)presentationWithIdentifier:(id)a3 didUpdatePresentationState:(id)a4;
- (void)prewarmMetalLayers;
- (void)prewarmOrbViewShaders;
- (void)requestSystemApertureCollapse;
- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3;
- (void)setAnimationDismissalTimer:(id)a3;
- (void)setApplicationStateHelper:(id)a3;
- (void)setClearSiriViewControllerTimer:(id)a3;
- (void)setConnection:(id)a3;
- (void)setContextAppInfosForSiriViewController:(id)a3;
- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3;
- (void)setCurrentGlowState:(int64_t)a3;
- (void)setCurrentLockState:(unint64_t)a3;
- (void)setCurrentViewMode:(int64_t)a3;
- (void)setDeviceEngagementTimeStamps:(id)a3;
- (void)setEdgeLightWindowLevelInvalidable:(id)a3;
- (void)setHeadphonesAuthenticationManager:(id)a3;
- (void)setHintGlowAssertion:(id)a3;
- (void)setHostedPresentationFrame:(CGRect)a3;
- (void)setIntentUsageDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPongTimer:(id)a3;
- (void)setPredictedRecordRouteIsZLL:(BOOL)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPresentationStateProvider:(id)a3;
- (void)setSiriEffectsViewController:(id)a3;
- (void)setSiriPresentationControllerDelegate:(id)a3;
- (void)setSiriSetupNavigationController:(id)a3;
- (void)setSiriSetupViewController:(id)a3;
- (void)setSiriSetupViewControllerPresented:(BOOL)a3;
- (void)setSiriViewController:(id)a3;
- (void)setStarkAppBundleIdentifierContext:(id)a3;
- (void)setTestInputQueue:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setUnownedConnection:(id)a3;
- (void)siriEffectsViewController;
- (void)siriSAEEffectsViewController:(id)a3 requestsDismissalWithHandler:(id)a4;
- (void)siriSAEEffectsViewController:(id)a3 requestsPresentationWithHandler:(id)a4;
- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall;
- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall;
- (void)siriViewController;
- (void)siriViewController:(id)a3 cacheSceneHostedView:(id)a4;
- (void)siriViewController:(id)a3 didCompleteRequestWithError:(id)a4;
- (void)siriViewController:(id)a3 didEncounterUnexpectedError:(id)a4;
- (void)siriViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4;
- (void)siriViewController:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4;
- (void)siriViewController:(id)a3 onboardingScreenContinueButtonTappedWithRequestOptions:(id)a4;
- (void)siriViewController:(id)a3 presentedIntentWithBundleId:(id)a4;
- (void)siriViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5;
- (void)siriViewController:(id)a3 requestsPresentation:(id)a4;
- (void)siriViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4;
- (void)siriViewController:(id)a3 updateHomeAffordanceForBlurVisibilty:(BOOL)a4;
- (void)siriViewController:(id)a3 voiceActivationMaskViewIsVisible:(BOOL)a4;
- (void)siriViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)siriViewController:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4;
- (void)siriViewController:(id)a3 willStartHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (void)siriViewController:(id)a3 willStopHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (void)siriViewControllerDidFinishDismissing:(id)a3;
- (void)siriViewControllerDidReactivateFromFlexibleFollowups;
- (void)siriViewControllerSpeechRequestCancelledFromSiriOrb;
- (void)siriViewControllerSpeechRequestStartedFromSiriOrb;
- (void)startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4;
- (void)startGuidedAccessForSiriViewController:(id)a3;
- (void)stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3;
- (void)updateCurrentLockState:(id)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)viewWillLayoutSubviews;
- (void)wakeScreenAfterActivationWithReason:(id)a3;
@end

@implementation SiriPresentationViewController

- (void)deviceScreenEngagementController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x263EFF910], "now", a3);
  [(SiriPresentationViewController *)self _setEngagementStatus:v6 forType:a4];

  siriViewController = self->_siriViewController;
  [(AFUISiriViewController *)siriViewController didGainAttentionWithEvent:a4];
}

- (void)_setEngagementStatus:(id)a3 forType:(int64_t)a4
{
  deviceEngagementTimeStamps = self->_deviceEngagementTimeStamps;
  if (deviceEngagementTimeStamps)
  {
    v8 = deviceEngagementTimeStamps;
    v9 = self->_deviceEngagementTimeStamps;
    self->_deviceEngagementTimeStamps = v8;
    id v10 = a3;
  }
  else
  {
    v11 = (void *)MEMORY[0x263EFF9A0];
    id v12 = a3;
    v13 = [v11 dictionary];
    v9 = self->_deviceEngagementTimeStamps;
    self->_deviceEngagementTimeStamps = v13;
  }

  v14 = self->_deviceEngagementTimeStamps;
  id v15 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v14 setObject:a3 forKey:v15];
}

- (void)prewarmOrbViewShaders
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F286B8] isSAEEnabled] & 1) == 0)
  {
    id v2 = objc_alloc(MEMORY[0x263F75438]);
    v3 = objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, *MEMORY[0x263F28850], *(double *)(MEMORY[0x263F28850] + 8));
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SiriPresentationViewController(SUIC) prewarmOrbViewShaders]";
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #orbView Creating temporary orbView for prewarming", buf, 0xCu);
    }
    v5 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SiriPresentationViewController_SUIC__prewarmOrbViewShaders__block_invoke;
    block[3] = &unk_2645BCD30;
    id v8 = v3;
    id v6 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __61__SiriPresentationViewController_SUIC__prewarmOrbViewShaders__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [*(id *)(a1 + 32) prewarmOrb];
  [*(id *)(a1 + 32) invalidate];
  id v2 = (void *)MEMORY[0x263F158F8];
  return [v2 commit];
}

- (void)prewarmMetalLayers
{
  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    [(SiriPresentationViewController *)self _prewarmEdgeLightMetalLayers];
  }
  else
  {
    [(SiriPresentationViewController *)self prewarmOrbViewShaders];
  }
}

- (void)_prewarmEdgeLightMetalLayers
{
  id v2 = (id *)MEMORY[0x263F28378];
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)*MEMORY[0x263F28378]);
  v4 = *v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_221664000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SiriPresentationController+SUIC._prewarmEdgeLightMaskMetalLayers", "", buf, 2u);
  }

  [MEMORY[0x263F75420] prewarm];
  [MEMORY[0x263F75430] prewarm];
  id v6 = *v2;
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_221664000, v7, OS_SIGNPOST_INTERVAL_END, v3, "SiriPresentationController+SUIC._prewarmEdgeLightMaskMetalLayers", "", v8, 2u);
  }
}

- (int64_t)preferredFlamesViewFidelity
{
  if (MGGetBoolAnswer()) {
    return 0;
  }
  MGGetProductType();
  return 2;
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3
{
  return -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](self, "initWithIdentifier:hostedPresentationFrame:", a3, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  return -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:](self, "initWithIdentifier:hostedPresentationFrame:displayConfiguration:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4 displayConfiguration:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v12 = a5;
  kdebug_trace();
  v51.receiver = self;
  v51.super_class = (Class)SiriPresentationViewController;
  v13 = [(SiriPresentationViewController *)&v51 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F28818]) initWithDelegate:v13];
    language = v13->_language;
    v13->_language = (AFUISiriLanguage *)v14;

    [(SiriPresentationViewController *)v13 _updateLanguageCode];
    v13->_presentationStateProcessingLock._os_unfair_lock_opaque = 0;
    if (a3 == 1 || a3 == 4)
    {
      v16 = [[SiriPresentationStateProvider alloc] initWithSiriPresentationIdentifier:a3 delegate:v13];
      presentationStateProvider = v13->_presentationStateProvider;
      v13->_presentationStateProvider = v16;

      if (((a3 == 1) & _os_feature_enabled_impl()) == 1)
      {
        v18 = (SASHeadphonesAuthenticationManager *)objc_alloc_init(MEMORY[0x263F6C718]);
        headphonesAuthenticationManager = v13->_headphonesAuthenticationManager;
        v13->_headphonesAuthenticationManager = v18;

        v20 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          v21 = v13->_headphonesAuthenticationManager;
          *(_DWORD *)buf = 136315394;
          v53 = "-[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:]";
          __int16 v54 = 2112;
          v55 = v21;
          _os_log_impl(&dword_221664000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation using 🎧 SASHeadphonesAuthenticationManager: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      _os_feature_enabled_impl();
    }
    -[SiriPresentationViewController setHostedPresentationFrame:](v13, "setHostedPresentationFrame:", x, y, width, height);
    objc_storeStrong((id *)&v13->_displayConfiguration, a5);
    v13->_identifier = a3;
    [(SiriPresentationViewController *)v13 setLock:0];
    uint64_t v22 = [MEMORY[0x263EFF910] date];
    lastAppUpdateTimestamp = v13->_lastAppUpdateTimestamp;
    v13->_lastAppUpdateTimestamp = (NSDate *)v22;

    [(SiriPresentationViewController *)v13 _setShouldDeferWake:0];
    v24 = (AFQueue *)objc_alloc_init(MEMORY[0x263F285A8]);
    testInputQueue = v13->_testInputQueue;
    v13->_testInputQueue = v24;

    v26 = [MEMORY[0x263F6C740] sharedSystemState];
    [v26 addStateChangeListener:v13];

    v27 = +[SiriPresentationViewController _applicationStateHelper];
    [(SiriPresentationViewController *)v13 setApplicationStateHelper:v27];

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v13, (CFNotificationCallback)_AppDataDidChange, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DistributedCenter, v13, (CFNotificationCallback)_AppDataDidChange, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorDrop);
    v29 = (void *)MEMORY[0x263F2B9C0];
    v30 = [MEMORY[0x263F6C710] configuration];
    v31 = [v30 machServiceIdentifier];
    v32 = [MEMORY[0x263F6C710] configuration];
    v33 = [v32 identifierForService:0];
    v34 = [v29 endpointForMachName:v31 service:v33 instance:0];

    v35 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v34];
    [(SiriPresentationViewController *)v13 setConnection:v35];

    objc_initWeak((id *)buf, v13);
    v36 = [(SiriPresentationViewController *)v13 connection];
    uint64_t v45 = MEMORY[0x263EF8330];
    uint64_t v46 = 3221225472;
    v47 = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke;
    v48 = &unk_2645BCFF0;
    v37 = v13;
    v49 = v37;
    objc_copyWeak(&v50, (id *)buf);
    [v36 configureConnection:&v45];

    v38 = [(SiriPresentationViewController *)v37 connection];
    [v38 activate];

    dispatch_queue_t v39 = dispatch_queue_create("Animation Dismissal watchdog queue", 0);
    watchdogQueue = v37->_watchdogQueue;
    v37->_watchdogQueue = (OS_dispatch_queue *)v39;

    v41 = dispatch_get_global_queue(-2, 0);
    dispatch_async(v41, &__block_literal_global_100);

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);
  }
  if (a3 != 2)
  {
    v42 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:]";
      _os_log_impl(&dword_221664000, v42, OS_LOG_TYPE_DEFAULT, "%s #userAttention Setting up userAttentionController", buf, 0xCu);
    }
    v43 = [[SASUIDeviceScreenEngagementController alloc] initWithSamplingInterval:1.0 attentionLostTimeout:5.0];
    [(SASUIDeviceScreenEngagementController *)v43 setDelegate:v13];
    [(SiriPresentationViewController *)v13 _setDeviceScreenEngagementController:v43];
  }
  [(SiriPresentationViewController *)v13 _startDeviceScreenEngagementController];
  kdebug_trace();

  return v13;
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F6C720] serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = [MEMORY[0x263F6C720] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2;
  v8[3] = &unk_2645BCFA8;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInvalidationHandler:v8];
  [v3 setInterruptionHandler:&__block_literal_global_2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_94;
  v6[3] = &unk_2645BCFA8;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setActivationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v13 = [v3 remoteTarget];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F6C780]), "initWithSiriPresentationIdentifier:", objc_msgSend(WeakRetained, "identifier"));
    [v13 unregisterPresentationIdentifier:v14];

    id v15 = [WeakRetained presentationStateProvider];
    [v15 stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:1];
  }
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_93(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_93_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [v2 activate];
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_94(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 289);
    uint64_t v5 = [v7 remoteTarget];
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F6C780]), "initWithSiriPresentationIdentifier:", -[os_unfair_lock_s identifier](v4, "identifier"));
    [v5 registerPresentationIdentifier:v6];

    os_unfair_lock_unlock(v4 + 289);
    [*(id *)&v4[330]._os_unfair_lock_opaque beginProvidingPresentationStateUpdates];
  }
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_97()
{
  id v1 = [MEMORY[0x263F351B8] userContext];
  v0 = [MEMORY[0x263F351D0] keyPathForSiriActiveStatus];
  [v1 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v0];
}

- (void)dealloc
{
  [(SiriPresentationViewController *)self _invalidateCarSiriButtonHoldToTalkTimer];
  id v3 = [MEMORY[0x263F6C740] sharedSystemState];
  [v3 removeStateChangeListener:self];

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationRegistered", 0);
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationUnregistered", 0);
  [(SiriPresentationViewController *)self _stopDeviceScreenEngagement];
  [(SiriPresentationViewController *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SiriPresentationViewController;
  [(SiriPresentationViewController *)&v5 dealloc];
}

- (void)invalidate
{
  kdebug_trace();
  id v3 = [(SiriPresentationViewController *)self connection];
  uint64_t v4 = [v3 remoteTarget];
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x263F6C780]), "initWithSiriPresentationIdentifier:", -[SiriPresentationViewController identifier](self, "identifier"));
  [v4 unregisterPresentationIdentifier:v5];

  uint64_t v6 = [(SiriPresentationViewController *)self connection];
  [v6 invalidate];

  id v7 = [(SiriPresentationViewController *)self presentationStateProvider];
  [v7 stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:1];

  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    id v8 = [(SiriPresentationViewController *)self siriViewController];
    [v8 invalidate];
  }
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)dismiss
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1];
  [(SiriPresentationViewController *)self dismissWithOptions:v3];
}

- (void)dismissWithOptions:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  objc_copyWeak(&v6, &location);
  SiriUIInvokeOnMainQueue();
  -[SiriPresentationViewController presentationDismissalRequestedWithOptions:](self, "presentationDismissalRequestedWithOptions:", v4, v5, 3221225472, __53__SiriPresentationViewController_dismissWithOptions___block_invoke, &unk_2645BD018);
  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__SiriPresentationViewController_dismissWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained hintGlowAssertion];

    if (v3)
    {
      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[SiriPresentationViewController dismissWithOptions:]_block_invoke";
        _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to activating state for a smoother dismissal", (uint8_t *)&v6, 0xCu);
      }
      [v2 setCurrentGlowState:1];
      uint64_t v5 = [v2 hintGlowAssertion];
      [v5 setSystemGlowStyle:0];
    }
  }
}

- (BOOL)isEnabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(SiriPresentationOptions *)self->_currentPresentationOptions requestSource] == 53)
  {
    id v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[SiriPresentationViewController isEnabled]";
      _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #VisualIntelligence - presentation always enabled for Visual Intelligence", (uint8_t *)&v9, 0xCu);
    }
    return 1;
  }
  else
  {
    int v4 = _AXSHomeButtonAssistant();
    uint64_t v5 = [MEMORY[0x263F6C740] sharedSystemState];
    if ([v5 siriIsSupported])
    {
      int v6 = [MEMORY[0x263F6C740] sharedSystemState];
      char v7 = [v6 siriIsEnabled];
      if (v4) {
        BOOL v3 = v7;
      }
      else {
        BOOL v3 = 1;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  char v7 = (void (**)(id, uint64_t))a4;
  if (-[SiriPresentationViewController _activeTCCHasContentAtPoint:](self, "_activeTCCHasContentAtPoint:", x, y))
  {
    v7[2](v7, 1);
  }
  else
  {
    uint64_t v8 = [(SiriPresentationViewController *)self siriViewController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__SiriPresentationViewController_hasContentAtPoint_completion___block_invoke;
    v9[3] = &unk_2645BD040;
    uint64_t v10 = v7;
    objc_msgSend(v8, "hasContentAtPoint:completion:", v9, x, y);
  }
}

uint64_t __63__SiriPresentationViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notePanBeganAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(SiriPresentationViewController *)self siriViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SiriPresentationViewController_notePanBeganAtPoint___block_invoke;
  v8[3] = &unk_2645BD068;
  id v9 = v6;
  id v7 = v6;
  -[SiriPresentationViewController hasContentAtPoint:completion:](self, "hasContentAtPoint:completion:", v8, x, y);
}

uint64_t __54__SiriPresentationViewController_notePanBeganAtPoint___block_invoke(uint64_t a1, int a2)
{
  return [*(id *)(a1 + 32) didDetectGestureEvent:0 inRegion:a2 ^ 1u];
}

- (void)noteTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(SiriPresentationViewController *)self siriViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SiriPresentationViewController_noteTapAtPoint___block_invoke;
  v8[3] = &unk_2645BD068;
  id v9 = v6;
  id v7 = v6;
  -[SiriPresentationViewController hasContentAtPoint:completion:](self, "hasContentAtPoint:completion:", v8, x, y);
}

uint64_t __49__SiriPresentationViewController_noteTapAtPoint___block_invoke(uint64_t a1, int a2)
{
  return [*(id *)(a1 + 32) didDetectGestureEvent:1 inRegion:a2 ^ 1u];
}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    objc_initWeak(&location, self);
    v12[1] = (id)MEMORY[0x263EF8330];
    v12[2] = (id)3221225472;
    v12[3] = __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke;
    v12[4] = &unk_2645BD090;
    uint64_t v8 = &v15;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    SiriUIInvokeOnMainQueue();

    id v9 = v13;
LABEL_5:

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  if (self->_siriSetupViewController)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = v12;
    objc_copyWeak(v12, &location);
    id v10 = v6;
    id v11 = v7;
    SiriUIInvokeOnMainQueue();

    id v9 = v10;
    goto LABEL_5;
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_6:
}

void __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 162);
    BOOL v4 = v3 == 4 || v3 == 8;
    id v7 = (id *)WeakRetained;
    if (v4
      || ([*((id *)WeakRetained + 172) currentRequestOptions],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isTypeToSiriRequest],
          v5,
          v6))
    {
      [v7 _requestHomeAffordanceSuppression:0];
    }
    else if (v7[162] == (id)7)
    {
      [v7 _requestHomeAffordanceSuppression:2];
    }
    [v7[172] animatedAppearanceWithFactory:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id WeakRetained = v7;
  }
}

void __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _requestHomeAffordanceSuppression:1];
    [v3[173] animatedAppearanceWithFactory:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v10, &location);
    id v8 = v6;
    id v9 = v7;
    SiriUIInvokeOnMainQueue();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __78__SiriPresentationViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _tearDownSiriEffectsViewController];
    [v3[172] animatedDisappearanceWithFactory:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)aggregateLockStateDidChange
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[SiriPresentationViewController aggregateLockStateDidChange]";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (AFUISiriSAEEffectsViewController)siriEffectsViewController
{
  siriEffectsViewController = self->_siriEffectsViewController;
  if (!siriEffectsViewController)
  {
    BOOL v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      [(SiriPresentationViewController *)v4 siriEffectsViewController];
    }
    [(SiriPresentationViewController *)self _updateHostedPresentationFrame];
    id v12 = objc_alloc(MEMORY[0x263F28820]);
    id v13 = [(SiriPresentationViewController *)self _viewHostingInstrumentationHandler];
    id v14 = (AFUISiriSAEEffectsViewController *)[v12 initWithDelegate:self instrumentationHandler:v13];
    id v15 = self->_siriEffectsViewController;
    self->_siriEffectsViewController = v14;

    siriEffectsViewController = self->_siriEffectsViewController;
  }
  return siriEffectsViewController;
}

- (void)didPresentLocationTCC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[SiriPresentationViewController didPresentLocationTCC:](v5);
  }
  activeTCCs = self->_activeTCCs;
  if (!activeTCCs)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    uint64_t v8 = self->_activeTCCs;
    self->_activeTCCs = v7;

    activeTCCs = self->_activeTCCs;
  }
  [(NSMutableSet *)activeTCCs addObject:v4];
}

- (void)didDismissLocationTCC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[SiriPresentationViewController didDismissLocationTCC:](v5);
  }
  [(NSMutableSet *)self->_activeTCCs removeObject:v4];
}

- (BOOL)_activeTCCHasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(NSMutableSet *)self->_activeTCCs count];
  if (v6)
  {
    uint64_t v7 = [(SiriPresentationViewController *)self siriViewController];
    uint64_t v8 = [v7 view];
    uint64_t v9 = [v8 window];
    uint64_t v10 = [v9 screen];

    uint64_t v11 = [v10 coordinateSpace];
    [MEMORY[0x263EFFA08] setWithSet:self->_activeTCCs];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "alertController", (void)v21);
          v17 = [v16 view];

          objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v11, x, y);
          v18 = objc_msgSend(v17, "hitTest:withEvent:", 0);

          if (v18)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  v19 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    [(SiriPresentationViewController *)v13 _activeTCCHasContentAtPoint:v19];
  }
  return v13;
}

- (void)ping
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[SiriPresentationViewController ping]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong received ping", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __38__SiriPresentationViewController_ping__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SiriPresentationViewController ping]_block_invoke";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #pingpong on main thread", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupPongTimer];
}

- (BOOL)presentationisIdleAndQuiet
{
  return self->_isIdleAndQuiet;
}

- (void)activateHintGlow
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [*(id *)(a1 + 32) _canShowHintGlow])
  {
    int v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController can show hint glow", buf, 0xCu);
    }
    int v4 = [WeakRetained siriEffectsViewController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__SiriPresentationViewController_activateHintGlow__block_invoke_117;
    v6[3] = &unk_2645BD108;
    uint64_t v5 = *(void *)(a1 + 32);
    void v6[4] = WeakRetained;
    v6[5] = v5;
    [v4 requestPresentationWithHandler:v6];
  }
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_117(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__SiriPresentationViewController_activateHintGlow__block_invoke_2;
    aBlock[3] = &unk_2645BCD30;
    aBlock[4] = *(void *)(a1 + 32);
    int v3 = _Block_copy(aBlock);
    int v4 = [*(id *)(a1 + 40) siriViewController];
    int v5 = [v4 shouldPlaceEffectsWindowOnTopOfSiriWindow];

    if (v5) {
      [*(id *)(a1 + 32) updateEdgeLightWindowLevel:1];
    }
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController requesting .Activating hint glow effect", buf, 0xCu);
    }
    uint64_t v7 = [MEMORY[0x263F793A0] sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__SiriPresentationViewController_activateHintGlow__block_invoke_119;
    v9[3] = &unk_2645BD0E0;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v8 = v3;
    [v7 requestSystemGlowEffectWithInitialStyle:0 completion:v9];
  }
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) siriEffectsViewController];
  [v1 beginHintingForInvocationType:1];
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  SiriUIInvokeOnMainQueue();
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_2_120(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *MEMORY[0x263F28348];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v5 = 136315138;
      uint64_t v6 = "-[SiriPresentationViewController activateHintGlow]_block_invoke_2";
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController began .Activating hint glow effect", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1 + 40) setCurrentGlowState:1];
    [*(id *)(a1 + 40) setHintGlowAssertion:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (v4)
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController failed to acquire .Activating hint glow effect", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_canShowHintGlow
{
  if (![(SiriPresentationViewController *)self _isSpringBoardMainScreenPresentation])return 0; {
  id v3 = [(SiriPresentationViewController *)self siriEffectsViewController];
  }
  BOOL v4 = [v3 state] == 0;

  return v4;
}

- (void)cancelActivatedHintGlow
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __57__SiriPresentationViewController_cancelActivatedHintGlow__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      BOOL v4 = "-[SiriPresentationViewController cancelActivatedHintGlow]_block_invoke";
      _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController cancel hint glow activation", (uint8_t *)&v3, 0xCu);
    }
    [WeakRetained _invalidateHintGlowAssertion];
    [WeakRetained _tearDownSiriEffectsViewController];
  }
}

- (void)presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v6;
  id v9 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__SiriPresentationViewController_presentationRequestedWithPresentationOptions_requestOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([WeakRetained _shouldProceedPresentingSiriViewController])
    {
      [v3 _presentationRequestedWithPresentationOptions:*(void *)(a1 + 32) requestOptions:*(void *)(a1 + 40)];
    }
    else
    {
      [v3 _invalidateHintGlowAssertion];
      [v3 _failedToPresentSiriWithError:0];
    }
    id WeakRetained = v3;
  }
}

- (double)hintGlowPresentedDelayIntervalInMs
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];
  id v3 = [v2 valueForKey:@"HintGlowPresentedDelayInMs"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 15.0;
  }

  return v5;
}

- (void)_invalidateHintGlowAssertion
{
  if (self->_currentGlowState != 2)
  {
    self->_currentGlowState = 0;
    [(SBSHardwareButtonSystemGlowStyleControlling *)self->_hintGlowAssertion invalidate];
    hintGlowAssertion = self->_hintGlowAssertion;
    self->_hintGlowAssertion = 0;
  }
}

- (BOOL)_isSpringBoardMainScreenPresentation
{
  return [(SiriPresentationViewController *)self identifier] == 1;
}

- (void)_presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation presentationRequestedWithPresentationOptions:%@ requestOptions:%@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v10 = [v6 wakeScreen] ^ 1;
  uint64_t v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
    __int16 v17 = 1024;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation Setting screen off during activation: %{BOOL}i", (uint8_t *)&v15, 0x12u);
  }
  [(SiriPresentationViewController *)self _setScreenOffDuringActivation:v10];
  -[SiriPresentationViewController setCurrentLockState:](self, "setCurrentLockState:", [v7 currentLockState]);
  [(SiriPresentationViewController *)self _processIncomingRequestOptionsForTestingPayload:v7];
  BOOL v12 = -[SiriPresentationViewController _shouldShowSetupViewControllerForRequestSource:](self, "_shouldShowSetupViewControllerForRequestSource:", [v7 requestSource]);
  uint64_t v13 = *v8;
  BOOL v14 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v15 = 136315138;
      v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation showing setup view controller", (uint8_t *)&v15, 0xCu);
    }
    [(SiriPresentationViewController *)self _showSetupViewControllerIfNecessary];
  }
  else
  {
    if (v14)
    {
      int v15 = 136315138;
      v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation presenting Siri view controller", (uint8_t *)&v15, 0xCu);
    }
    [(SiriPresentationViewController *)self _removeSetupViewControllerIfNecessary];
    [(SiriPresentationViewController *)self _presentSiriViewControllerWithPresentationOptions:v6 requestOptions:v7];
  }
  kdebug_trace();
}

- (void)_presentSiriEffectsWithRequestOptions:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriPresentationViewController *)self _canPresentSiriEffectsViewControllerWithRequestOptions:v4])
  {
    double v5 = [(SiriPresentationViewController *)self siriEffectsViewController];
    char v6 = [v4 isInitialBringUp];
    id v7 = (os_log_t *)MEMORY[0x263F28348];
    if ((v6 & 1) != 0 || ![(AFUISiriSAEEffectsViewController *)self->_siriEffectsViewController state])
    {
      if ([v4 requestSource] == 2)
      {
        uint64_t v8 = [v5 state];
        id v9 = *v7;
        BOOL v10 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
        if (v8 == 5)
        {
          if (v10)
          {
            *(_DWORD *)buf = 136315138;
            v28 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
            _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation effects already presented for button invocation; starting ef"
              "fects animations",
              buf,
              0xCu);
          }
          [v5 beginAnimatingEffectsForInvocationType:1];
        }
        else
        {
          if (v10)
          {
            uint64_t v11 = v9;
            [v5 state];
            BOOL v12 = NSStringFromAFUISiriSAEEffectsViewControllerState();
            *(_DWORD *)buf = 136315394;
            v28 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
            __int16 v29 = 2114;
            v30 = v12;
            _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation effects not presented for button invocation; requesting pres"
              "entation, then animating (effects state: %{public}@)",
              buf,
              0x16u);
          }
          [(SiriPresentationViewController *)self _presentAndBeginAnimatingEffectsForInvocationType:1];
        }
      }
      else if ([v4 requestSource] == 53)
      {
        [(SiriPresentationViewController *)self _presentAndBeginAnimatingEffectsForInvocationType:3];
      }
      else
      {
        os_log_t v13 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v14 = v13;
          [v5 state];
          int v15 = NSStringFromAFUISiriSAEEffectsViewControllerState();
          *(_DWORD *)buf = 136315394;
          v28 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
          __int16 v29 = 2114;
          v30 = v15;
          _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation requesting effects presentation and animating for voice invocation (effects state: %{public}@)", buf, 0x16u);
        }
        [(SiriPresentationViewController *)self _presentAndBeginAnimatingEffectsForInvocationType:2];
      }
    }
    os_log_t v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v16;
      [(SiriPresentationViewController *)self hintGlowPresentedDelayIntervalInMs];
      *(_DWORD *)buf = 136315394;
      v28 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
      __int16 v29 = 2048;
      v30 = v18;
      _os_log_impl(&dword_221664000, v17, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController delaying %lf ms for hint glow presented state.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    [(SiriPresentationViewController *)self hintGlowPresentedDelayIntervalInMs];
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v19 / 1000.0 * 1000000000.0));
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    long long v23 = __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke;
    long long v24 = &unk_2645BCE48;
    objc_copyWeak(&v26, (id *)buf);
    v25 = self;
    dispatch_after(v20, MEMORY[0x263EF83A0], &v21);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  if (objc_msgSend(v4, "requestSource", v21, v22, v23, v24) == 53
    && ([(AFUISiriViewController *)self->_siriViewController isSceneHostingVisualIntelligence] & 1) == 0)
  {
    [(SiriPresentationViewController *)self _playTamaleHaptic];
  }
}

void __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[169];
    double v5 = *MEMORY[0x263F28348];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v11 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]_block_invoke_3";
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to glow presented from activating state", buf, 0xCu);
      }
      *((void *)v3 + 170) = 2;
      [*((id *)v3 + 169) setSystemGlowStyle:1];
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v11 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]_block_invoke";
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to hint glow presented directly because Siri is already presented", buf, 0xCu);
      }
      id v7 = [MEMORY[0x263F793A0] sharedInstance];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_124;
      v9[3] = &unk_2645BD158;
      void v9[4] = v3;
      [v7 requestSystemGlowEffectWithInitialStyle:1 completion:v9];
    }
    uint64_t v8 = [*(id *)(a1 + 32) requestCachedSceneHostedView];

    if (v8) {
      [v3 updateEdgeLightWindowLevel:1];
    }
  }
}

void __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  SiriUIInvokeOnMainQueue();
}

uint64_t __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentGlowState:2];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setHintGlowAssertion:v3];
}

- (BOOL)_canPresentSiriEffectsViewControllerWithRequestOptions:(id)a3
{
  id v4 = a3;
  int64_t currentViewMode = self->_currentViewMode;
  if (![(SiriPresentationViewController *)self _isSpringBoardMainScreenPresentation])goto LABEL_7; {
  BOOL v6 = 0;
  }
  if (([v4 isForUIFree] & 1) == 0 && currentViewMode)
  {
    if (([v4 isTypeToSiriRequest] & 1) == 0
      && [MEMORY[0x263F286B8] isSAEEnabled])
    {
      BOOL v6 = [v4 requestSource] != 53;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v6 = 0;
  }
LABEL_8:

  return v6;
}

- (void)_presentAndBeginAnimatingEffectsForInvocationType:(int64_t)a3
{
  objc_initWeak(&location, self);
  double v5 = [(SiriPresentationViewController *)self siriEffectsViewController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__SiriPresentationViewController__presentAndBeginAnimatingEffectsForInvocationType___block_invoke;
  v6[3] = &unk_2645BD180;
  objc_copyWeak(v7, &location);
  void v6[4] = self;
  v7[1] = (id)a3;
  [v5 requestPresentationWithHandler:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __84__SiriPresentationViewController__presentAndBeginAnimatingEffectsForInvocationType___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    double v5 = [*(id *)(a1 + 32) siriViewController];
    int v6 = [v5 shouldPlaceEffectsWindowOnTopOfSiriWindow];

    if (v6) {
      [v11 updateEdgeLightWindowLevel:1];
    }
    id WeakRetained = v11;
    if (a2)
    {
      id v7 = [v11 siriViewController];
      uint64_t v8 = [v11 siriEffectsViewController];
      [v7 setEdgeLightViewProvider:v8];

      id v9 = [v11 siriEffectsViewController];
      [v9 beginAnimatingEffectsForInvocationType:*(void *)(a1 + 48)];

      BOOL v10 = [v11 siriViewController];
      LODWORD(v9) = [v10 isSceneHostingVisualIntelligence];

      id WeakRetained = v11;
      if (v9)
      {
        [v11 updateEdgeLightWindowLevel:1];
        id WeakRetained = v11;
      }
    }
  }
}

- (void)_tearDownSiriEffectsViewController
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke;
  v3[3] = &unk_2645BD018;
  objc_copyWeak(&v4, &location);
  [(SiriPresentationViewController *)self _removeSiriEffectsViewControllerIfNeededUsingBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 174);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_2;
    v5[3] = &unk_2645BD1A8;
    objc_copyWeak(&v6, v1);
    [v4 requestDismissalWithHandler:v5];
    objc_destroyWeak(&v6);
  }
}

void __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = (os_log_t *)MEMORY[0x263F28348];
    if ((a2 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_2_cold_1();
    }
    uint64_t v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      BOOL v10 = "-[SiriPresentationViewController _tearDownSiriEffectsViewController]_block_invoke";
      _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController setting siriEffectsVC to nil after dismissal of effects window", (uint8_t *)&v9, 0xCu);
    }
    [WeakRetained setSiriEffectsViewController:0];
  }
}

- (void)_animateOutSiriEffectsView
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__SiriPresentationViewController__animateOutSiriEffectsView__block_invoke;
  v3[3] = &unk_2645BD018;
  objc_copyWeak(&v4, &location);
  [(SiriPresentationViewController *)self _removeSiriEffectsViewControllerIfNeededUsingBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __60__SiriPresentationViewController__animateOutSiriEffectsView__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained siriViewController];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__SiriPresentationViewController__animateOutSiriEffectsView__block_invoke_2;
    v5[3] = &unk_2645BD018;
    objc_copyWeak(&v6, v1);
    [v4 animateOrbViewToOffIfNecessaryWithCompletion:v5];

    objc_destroyWeak(&v6);
  }
}

void __60__SiriPresentationViewController__animateOutSiriEffectsView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tearDownSiriEffectsViewController];
    id WeakRetained = v2;
  }
}

- (void)_removeSiriEffectsViewControllerIfNeededUsingBlock:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(SiriPresentationViewController *)self _isSpringBoardMainScreenPresentation];
  if ([(AFUISiriSAEEffectsViewController *)self->_siriEffectsViewController state]) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || !v5)
  {
    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      BOOL v10 = "-[SiriPresentationViewController _removeSiriEffectsViewControllerIfNeededUsingBlock:]";
      _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController don't need to remove siriEffectsVC, setting it to nil", (uint8_t *)&v9, 0xCu);
    }
    [(SiriPresentationViewController *)self setSiriEffectsViewController:0];
  }
  else
  {
    v4[2](v4);
  }
}

- (BOOL)_shouldShowSetupViewControllerForRequestSource:(int64_t)a3
{
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  int v5 = [v4 assistantIsEnabled] ^ 1;
  if (a3 == 53) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5;
  }

  return v6;
}

- (void)wakeScreenAfterActivationWithReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  BOOL v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    [(SiriPresentationViewController *)self _wasScreenOffDuringActivation];
    uint64_t v8 = NSStringFromBOOL();
    int v9 = NSStringFromBOOL();
    *(_DWORD *)buf = 136315650;
    dispatch_time_t v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    long long v24 = v9;
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Wake Screen was requested when _wasScreenOffDuringActivation was %@ and _shouldDeferOSiriActWake was %@", buf, 0x20u);
  }
  if ([(SiriPresentationViewController *)self _wasScreenOffDuringActivation])
  {
    BOOL v10 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    int v11 = [(id)objc_opt_class() conformsToProtocol:&unk_26D3C16C8];

    if (v11)
    {
      uint64_t v12 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
      os_log_t v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        dispatch_time_t v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
        _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Asking presentationControllerDelegate to wake screen", buf, 0xCu);
      }
      [v12 screenWakeRequested];
      BOOL v14 = [(SiriPresentationViewController *)self _analytics];
      __int16 v17 = @"reason";
      id v18 = v4;
      int v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v14 logEventWithType:1930 context:v15];
    }
  }
  else
  {
    os_log_t v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_time_t v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
      _os_log_impl(&dword_221664000, v16, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Tried to turn the screen on but it wasn't kept off at activation.", buf, 0xCu);
    }
  }
}

- (void)deviceWonMyriadElection
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SiriPresentationViewController deviceWonMyriadElection]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Device won myriad Election, hiding VoiceActivationMAskView", (uint8_t *)&v4, 0xCu);
  }
  [(AFUISiriViewController *)self->_siriViewController hideVoiceActivationMaskViewIfNecessary];
}

- (void)activationDeterminedShouldDeferWake:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[SiriPresentationViewController _setShouldDeferWake:](self, "_setShouldDeferWake:", [v4 BOOLValue]);
  int v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    [v4 BOOLValue];
    id v7 = NSStringFromBOOL();
    int v8 = 136315394;
    int v9 = "-[SiriPresentationViewController activationDeterminedShouldDeferWake:]";
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Pocket determined should cancel screen wake - %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateHostedPresentationFrame
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_4() hostedPresentationFrame];
  uint64_t v3 = NSStringFromCGRect(v10);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_221664000, v4, v5, "%s PresentationViewController created without specifying a presentation frame, falling back to %@", v6, v7, v8, v9, 2u);
}

- (void)_presentSiriViewControllerWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  [(SiriPresentationViewController *)self _prepareSiriViewControllerWithRequestOptions:v7];
  if ([v7 isForUIFree])
  {
    uint64_t v8 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v9 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      CGRect v10 = v9;
      int v11 = [v7 uiPresentationIdentifier];
      *(_DWORD *)buf = 136315394;
      v36 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v11;
      _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation Not requesting presentation for %@, handling request directly", buf, 0x16u);
    }
    os_log_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v13 = (void *)MEMORY[0x263F08B88];
      BOOL v14 = v12;
      int v15 = [v13 currentThread];
      uint64_t v16 = [v15 qualityOfService];
      *(_DWORD *)buf = 136315394;
      v36 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      __int16 v37 = 2048;
      uint64_t v38 = v16;
      _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_presentationStateProcessingLock);
    __int16 v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_221664000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock successfully locked", buf, 0xCu);
    }
    [(SiriPresentationViewController *)self setPresentationState:3];
    os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
    id v18 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_221664000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock unlocked", buf, 0xCu);
    }
    uint64_t v19 = [v7 requestSource];
    BOOL v21 = v19 == 40 || v19 == 37;
    [(SiriPresentationViewController *)self _updateAnnouncementRequestsPermittedWhilePresentationActive:v21];
    [(SiriPresentationViewController *)self _showPresentationAndActivateWithRequestOptions:v7];
    [(SiriPresentationViewController *)self _presentationRequestedHandlerWithRequestOptions:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke;
    v31[3] = &unk_2645BD1F8;
    objc_copyWeak(&v33, &location);
    id v22 = v7;
    id v32 = v22;
    [(SiriPresentationViewController *)self _requestPresentationWithOptions:v6 completion:v31];
    __int16 v23 = [v22 requestInfo];
    int v24 = [v23 requiresUserInteraction];

    if (v24 && ([v22 currentLockState] & 2) != 0)
    {
      uint64_t v25 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
        _os_log_impl(&dword_221664000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation Device is locked during handoff; presenting passcode unlock screen.",
          buf,
          0xCu);
      }
      objc_initWeak((id *)buf, self);
      siriViewController = self->_siriViewController;
      v27 = [v22 requestInfo];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_237;
      v28[3] = &unk_2645BD220;
      objc_copyWeak(&v30, (id *)buf);
      id v29 = v22;
      [(AFUISiriViewController *)siriViewController showPasscodeUnlockScreenForRequest:v27 passcodeUnlockClient:0 unlockCompletion:v28];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(SiriPresentationViewController *)self _showPresentationAndActivateWithRequestOptions:v22];
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  kdebug_trace();
}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v5;
  char v9 = a2;
  id v7 = *(id *)(a1 + 32);
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v8);
}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
LABEL_10:
    [v3 _failedToPresentSiriWithError:v5];
    goto LABEL_11;
  }
  if (!*((unsigned char *)WeakRetained + 1150))
  {
    uint64_t v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke_2";
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Waking screen", (uint8_t *)&v6, 0xCu);
    }
    [v3 wakeScreenAfterActivationWithReason:@"MyriadUI"];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  [v3 _presentationRequestedHandlerWithRequestOptions:*(void *)(a1 + 40)];
LABEL_11:
}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_237(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v6)
      {
        int v8 = 136315394;
        char v9 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke";
        __int16 v10 = 2048;
        uint64_t v11 = a2;
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Device unlock aborted with uint64_t result = %ld", (uint8_t *)&v8, 0x16u);
      }
      id v7 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:14];
      [WeakRetained dismissWithOptions:v7];
    }
    else
    {
      if (v6)
      {
        int v8 = 136315138;
        char v9 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke";
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Device is now unlocked; proceeding with the handoff request.",
          (uint8_t *)&v8,
          0xCu);
      }
      [WeakRetained _showPresentationAndActivateWithRequestOptions:*(void *)(a1 + 32)];
    }
  }
}

- (void)_startDeviceScreenEngagementController
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v3 = _os_feature_enabled_impl();
  uint64_t v4 = *MEMORY[0x263F28348];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[SiriPresentationViewController _startDeviceScreenEngagementController]";
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #userAttention Starting device screen engagement", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    BOOL v6 = [(SiriPresentationViewController *)self _deviceScreenEngagementController];
    id v7 = MEMORY[0x263EF83A0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke;
    v8[3] = &unk_2645BD248;
    objc_copyWeak(&v9, (id *)buf);
    [v6 startIfNeededForTypes:10 completionQueue:MEMORY[0x263EF83A0] completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else if (v5)
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[SiriPresentationViewController _startDeviceScreenEngagementController]";
    _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #modes Response framework is not enabled.", buf, 0xCu);
  }
}

void __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke_cold_1(a1, v4, (uint64_t)v3);
    }
  }
}

- (void)_stopDeviceScreenEngagement
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  BOOL v5 = "-[SiriPresentationViewController _stopDeviceScreenEngagement]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_221664000, log, OS_LOG_TYPE_ERROR, "%s #userAttention Failed to stop device screen engagement: %{public}@, error: %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)deviceScreenEngagementController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
}

- (void)_requestPresentationWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_currentPresentationOptions, a3);
  [(SiriPresentationViewController *)self _updateAnnouncementRequestsPermittedWhilePresentationActive:0];
  uint64_t v9 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)MEMORY[0x263F08B88];
    uint64_t v12 = v10;
    os_log_t v13 = [v11 currentThread];
    *(_DWORD *)buf = 136315394;
    id v30 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    __int16 v31 = 2048;
    uint64_t v32 = [v13 qualityOfService];
    _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  BOOL v14 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v30 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  [(SiriPresentationViewController *)self setPresentationState:1];
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  int v15 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v30 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  id v16 = objc_alloc(MEMORY[0x263F6C730]);
  uint64_t v17 = [v7 requestSource];
  id v18 = [(SiriPresentationViewController *)self _uiPresentationIdentifier];
  uint64_t v19 = (void *)[v16 initWithRequestSource:v17 uiPresentationIdentifier:v18];

  dispatch_time_t v20 = [(SiriPresentationViewController *)self siriViewController];
  objc_msgSend(v20, "siriWillBePresented:", objc_msgSend(v19, "requestSource"));
  objc_initWeak((id *)buf, self);
  BOOL v21 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__SiriPresentationViewController__requestPresentationWithOptions_completion___block_invoke;
  v24[3] = &unk_2645BD270;
  objc_copyWeak(&v28, (id *)buf);
  id v22 = v19;
  id v25 = v22;
  id v26 = self;
  id v23 = v8;
  id v27 = v23;
  [v21 siriPresentation:self requestsPresentationWithOptions:v7 withHandler:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __77__SiriPresentationViewController__requestPresentationWithOptions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = (os_log_t *)MEMORY[0x263F28348];
    id v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)MEMORY[0x263F08B88];
      uint64_t v10 = v8;
      uint64_t v11 = [v9 currentThread];
      int v20 = 136315394;
      BOOL v21 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = [v11 qualityOfService];
      _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock about to lock with qos: %zd", (uint8_t *)&v20, 0x16u);
    }
    os_unfair_lock_lock(WeakRetained + 268);
    uint64_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      BOOL v21 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
      _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock successfully locked", (uint8_t *)&v20, 0xCu);
    }
    if (v5 || !a2)
    {
      [(os_unfair_lock_s *)WeakRetained setPresentationState:6];
      os_unfair_lock_unlock(WeakRetained + 268);
      int v15 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        BOOL v21 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
        _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v20, 0xCu);
      }
      id v16 = *(void **)&WeakRetained[332]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[332]._os_unfair_lock_opaque = 0;

      uint64_t v17 = [*(id *)(a1 + 40) _uiPresentationIdentifier];
      int v18 = [v17 isEqualToString:@"com.apple.siri.Compact"];

      if (v18)
      {
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:0 requestCancellationReason:11 dismissalReason:59];
        [(os_unfair_lock_s *)WeakRetained dismissWithOptions:v19];
      }
    }
    else
    {
      [(os_unfair_lock_s *)WeakRetained setPresentationState:2];
      os_log_t v13 = [(os_unfair_lock_s *)WeakRetained siriViewController];
      objc_msgSend(v13, "siriWasPresented:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));

      os_unfair_lock_unlock(WeakRetained + 268);
      BOOL v14 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        BOOL v21 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
        _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v20, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_updateAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    id v5 = [(SiriPresentationViewController *)self siriViewController];
    [v5 setAnnouncementRequestsPermittedWhilePresentationActive:v3];
  }
}

- (id)_createPresentationPropertiesWithRequestOptions:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "requestSource"));
  [v4 setObject:v5 forKey:*MEMORY[0x263F287E8]];

  __int16 v6 = [v3 requestInfo];

  uint64_t v7 = [v6 activationEvent];
  if (v7 == 9 || v7 == 6) {
    [v4 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F287F0]];
  }
  return v4;
}

- (void)_showPresentationAndActivateWithRequestOptions:(id)a3
{
  id v4 = a3;
  id v7 = [(SiriPresentationViewController *)self _createPresentationPropertiesWithRequestOptions:v4];
  siriViewController = self->_siriViewController;
  __int16 v6 = [v4 uiPresentationIdentifier];
  [(AFUISiriViewController *)siriViewController showPresentationWithIdentifier:v6 properties:v7 lockState:[(SiriPresentationViewController *)self currentLockState]];

  [(SiriPresentationViewController *)self activateWithRequestOptions:v4];
  self->_activationHandled = 1;
}

- (BOOL)_shouldProceedPresentingSiriViewController
{
  clearSiriViewControllerTimer = self->_clearSiriViewControllerTimer;
  if (clearSiriViewControllerTimer)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SiriPresentationViewController *)v3 _shouldProceedPresentingSiriViewController];
    }
  }
  return clearSiriViewControllerTimer == 0;
}

- (void)_prepareSiriViewControllerWithRequestOptions:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  [(SiriPresentationViewController *)self _updateHostedPresentationFrame];
  BOOL v5 = [(SiriPresentationViewController *)self siriViewControllerConfigured];
  uint64_t v6 = *MEMORY[0x263F28348];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriPresentationViewController _prepareSiriViewControllerWithRequestOptions:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08348];
    v55[0] = *MEMORY[0x263F08320];
    v55[1] = v15;
    v56[0] = @"Reusing AFUISiriViewController is currently unsupported.";
    v56[1] = @"If this call is necessary, use siriViewControllerConfigured to check if it is ready to use";
    id v16 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    id v17 = [v14 errorWithDomain:@"com.apple.siri.activation" code:3 userInfo:v16];

    [(SiriPresentationViewController *)self _dismissDueToUnexpectedError:v17];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[SiriPresentationViewController _prepareSiriViewControllerWithRequestOptions:]";
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation creating new AFUISiriViewController", buf, 0xCu);
    }
    int v18 = [(SiriPresentationViewController *)self _createSiriViewControllerWithRequestOptions:v4];
    siriViewController = self->_siriViewController;
    self->_siriViewController = v18;

    int v20 = [(SiriPresentationViewController *)self siriViewController];
    [(SiriPresentationViewController *)self addChildViewController:v20];

    BOOL v21 = [(SiriPresentationViewController *)self siriViewController];
    __int16 v22 = [v21 view];
    objc_msgSend(v22, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

    uint64_t v23 = [(SiriPresentationViewController *)self view];
    uint64_t v24 = [(SiriPresentationViewController *)self siriViewController];
    id v25 = [v24 view];
    [v23 addSubview:v25];

    id v26 = [(SiriPresentationViewController *)self siriViewController];
    [v26 didMoveToParentViewController:self];

    id v27 = [(SiriPresentationViewController *)self siriViewController];
    [(SiriPresentationViewController *)self hostedPresentationFrame];
    objc_msgSend(v27, "setHostedPresentationFrame:");

    if ([v4 isForStark])
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v28 = [v4 appBundleIdentifier];
      id v29 = (void *)v28;
      id v30 = @"com.apple.siri";
      if (v28) {
        id v30 = (__CFString *)v28;
      }
      __int16 v31 = v30;

      if ([(__CFString *)v31 caseInsensitiveCompare:*MEMORY[0x263F28800]]
        && [(__CFString *)v31 caseInsensitiveCompare:*MEMORY[0x263F28848]])
      {
        id v32 = objc_alloc_init(MEMORY[0x263F64798]);
        id v33 = objc_alloc_init(MEMORY[0x263F64E58]);
        [v33 setBundleId:v31];
        [v32 setAppIdentifyingInfo:v33];
        id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
        v35 = (void *)MEMORY[0x263F28408];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke;
        v52[3] = &unk_2645BD298;
        v53 = v31;
        id v54 = v32;
        id v36 = v32;
        __int16 v37 = (void *)[v35 newWithBuilder:v52];
        [v34 addObject:v37];
      }
      else
      {
        id v34 = 0;
      }
      uint64_t v38 = [v4 currentCarPlaySupportedOEMAppIdList];

      if (v38)
      {
        id v39 = objc_alloc_init(MEMORY[0x263F64808]);
        v40 = [v4 currentCarPlaySupportedOEMAppIdList];
        [v39 setAppIds:v40];

        v41 = (void *)MEMORY[0x263F28408];
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke_2;
        v50[3] = &unk_2645BD2C0;
        id v51 = v39;
        id v42 = v39;
        v43 = (void *)[v41 newWithBuilder:v50];
        [v17 addObject:v43];
      }
    }
    else
    {
      id v34 = 0;
      id v17 = 0;
    }
    [(SiriPresentationViewController *)self setCurrentCarPlaySupportedOEMAppIdList:v17];
    [(SiriPresentationViewController *)self setStarkAppBundleIdentifierContext:v34];
    v44 = [v4 uiPresentationIdentifier];
    uint64_t v45 = [(SiriPresentationViewController *)self _foregroundAppInfosForUIPresentationIdentifier:v44];
    [(SiriPresentationViewController *)self setContextAppInfosForSiriViewController:v45];

    [(SiriPresentationViewController *)self _handleContextClearForRequestOptions:v4];
    uint64_t v46 = [(SiriPresentationViewController *)self siriViewController];
    objc_msgSend(v46, "siriWillActivateFromSource:", objc_msgSend(v4, "requestSource"));

    v47 = [(SiriPresentationViewController *)self siriViewController];
    if ([v4 isForStark]) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = [v4 isForUIFree] ^ 1;
    }
    [v47 setStatusBarEnabled:v48];

    if ([v4 requestSource] == 19)
    {
      v49 = [(SiriPresentationViewController *)self siriViewController];
      [v49 setShowsStatusBar:1];
    }
    kdebug_trace();
  }
}

void __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAssociatedBundleIdentifier:v3];
  [v4 setAceContext:*(void *)(a1 + 40)];
}

uint64_t __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAceContext:*(void *)(a1 + 32)];
}

- (void)_presentationRequestedHandlerWithRequestOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  if ([v4 requestSource] != 19)
  {
    BOOL v5 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v5 didPresentSiri];
  }
  -[AFUISiriViewController siriDidActivateFromSource:](self->_siriViewController, "siriDidActivateFromSource:", [v4 requestSource]);
  if ([MEMORY[0x263F28828] availabilityState] == 1
    || [MEMORY[0x263F28828] availabilityState] == 3)
  {
    [(AFUISiriViewController *)self->_siriViewController presentRemoteViewControllerIfNecessary];
  }
  else if ([MEMORY[0x263F28828] availabilityState] == 2)
  {
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v14 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]";
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Device not unlocked since boot; presenting passcode unlock screen",
        buf,
        0xCu);
    }
    uint64_t v7 = [v4 requestSource];
    objc_initWeak((id *)buf, self);
    siriViewController = self->_siriViewController;
    uint64_t v9 = [v4 requestInfo];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__SiriPresentationViewController__presentationRequestedHandlerWithRequestOptions___block_invoke;
    v10[3] = &unk_2645BD2E8;
    id v11 = v4;
    objc_copyWeak(&v12, (id *)buf);
    [(AFUISiriViewController *)siriViewController showPasscodeUnlockScreenForRequest:v9 passcodeUnlockClient:v7 == 53 unlockCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  kdebug_trace();
}

void __82__SiriPresentationViewController__presentationRequestedHandlerWithRequestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v8 = 136315394;
      uint64_t v9 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = a2;
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation Device unlock aborted with uint64_t result = %ld", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:15];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained dismissWithOptions:v6];
  }
  else
  {
    if (v5)
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]_block_invoke";
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation Device is now unlocked; proceeding with the request.",
        (uint8_t *)&v8,
        0xCu);
    }
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F6C730]), "initWithRequestSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained activateWithRequestOptions:v6];
  }
}

- (void)handleRequestWithOptions:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  objc_initWeak(&location, self);
  id v5 = v4;
  objc_copyWeak(&v6, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __59__SiriPresentationViewController_handleRequestWithOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requestSource] == 15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = [WeakRetained siriViewController];
    objc_msgSend(v3, "siriWillActivateFromSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 activateWithRequestOptions:*(void *)(a1 + 32)];
}

- (void)handleRequestWithPresentationOptionsUpdate:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  objc_initWeak(&location, self);
  id v8 = v7;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __92__SiriPresentationViewController_handleRequestWithPresentationOptionsUpdate_requestOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requestSource] == 15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v3 = [WeakRetained siriViewController];
    objc_msgSend(v3, "siriWillActivateFromSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 activateWithPresentationOptionsUpdate:*(void *)(a1 + 40) requestOptions:*(void *)(a1 + 32)];
}

- (void)activateWithPresentationOptionsUpdate:(id)a3 requestOptions:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__SiriPresentationViewController_activateWithPresentationOptionsUpdate_requestOptions___block_invoke;
  v8[3] = &unk_2645BCEC0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SiriPresentationViewController *)self _updateCurrentPresentationOptions:a3 withCompletion:v8];
}

uint64_t __87__SiriPresentationViewController_activateWithPresentationOptionsUpdate_requestOptions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriViewController];
  objc_msgSend(v2, "siriWasPresented:", objc_msgSend(*(id *)(a1 + 40), "requestSource"));

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) requestSource];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v3 activateWithSource:v4 requestOptions:v5 timestamp:0];
}

- (void)_updateCurrentPresentationOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v6;
  id v9 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __83__SiriPresentationViewController__updateCurrentPresentationOptions_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained + 166;
    objc_storeStrong((id *)WeakRetained + 166, *(id *)(a1 + 32));
    uint64_t v4 = [v9 siriPresentationControllerDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_msgSend(*(id *)(a1 + 40), "siriPresentationControllerDelegate", v9);
      [v6 siriPresentation:v9 didUpdatePresentationOptions:*v3];
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  return MEMORY[0x270F9A790]();
}

- (void)activateWithRequestOptions:(id)a3
{
  id v4 = a3;
  -[SiriPresentationViewController activateWithSource:requestOptions:timestamp:](self, "activateWithSource:requestOptions:timestamp:", [v4 requestSource], v4, 0);
}

- (void)activateWithSource:(int64_t)a3 timestamp:(id)a4
{
}

- (int64_t)_viewModeForRequestOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 uiPresentationIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.siri.CarDisplay"];
  char v5 = (os_log_t *)MEMORY[0x263F28348];
  if (v4) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.siri.EyesFree"])
  {
    int64_t v6 = 4;
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"com.apple.siri.BluetoothCar"])
  {
    int64_t v6 = 8;
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"com.apple.siri.UIFree"]) {
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.siri.SiriTVPresentation"])
  {
    int64_t v6 = 6;
  }
  else
  {
    if (([v3 isEqualToString:@"com.apple.siri.Compact"] & 1) == 0
      && ([v3 isEqualToString:@"com.apple.siri.SystemAssistantExperience"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"com.apple.siri.CarDisplay.UIFree"])
      {
LABEL_2:
        int64_t v6 = 5;
        goto LABEL_14;
      }
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
        -[SiriPresentationViewController _viewModeForRequestOptions:]();
      }
LABEL_8:
      int64_t v6 = 0;
      goto LABEL_14;
    }
    int64_t v6 = 7;
  }
LABEL_14:
  uint64_t v7 = *v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = SiriUINSStringFromSiriUIViewMode();
    int v11 = 136315394;
    uint64_t v12 = "-[SiriPresentationViewController _viewModeForRequestOptions:]";
    __int16 v13 = 2112;
    BOOL v14 = v9;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation: Returning SiriUIViewMode:%@", (uint8_t *)&v11, 0x16u);
  }
  return v6;
}

- (void)activateWithSource:(int64_t)a3 requestOptions:(id)a4 timestamp:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F6C730]);
    uint64_t v12 = [(SiriPresentationViewController *)self _uiPresentationIdentifier];
    id v10 = (void *)[v11 initWithRequestSource:a3 uiPresentationIdentifier:v12];
  }
  if (!SASRequestSourceIsHTT()) {
    goto LABEL_11;
  }
  [(SiriPresentationViewController *)self _releaseExistingTrigger];
  if (!v8)
  {
    [(SiriPresentationViewController *)self _setButtonDownEventDidOccur:1];
    [v9 timeInterval];
    -[SiriPresentationViewController _setButtonDownTimestamp:](self, "_setButtonDownTimestamp:");
    [v9 timeInterval];
    objc_msgSend(v10, "setTimestamp:");
    id v14 = objc_alloc(MEMORY[0x263F6C738]);
    p_buttonTrigger = &self->_buttonTrigger;
    id v16 = v10;
    goto LABEL_9;
  }
  [v8 buttonDownTimestamp];
  if (v13 == 0.0)
  {
    [(SiriPresentationViewController *)self _setButtonDownEventDidOccur:0];
    [(SiriPresentationViewController *)self _setButtonDownTimestamp:0.0];
LABEL_11:
    id v17 = 0;
    goto LABEL_12;
  }
  [(SiriPresentationViewController *)self _setButtonDownEventDidOccur:1];
  [v8 buttonDownTimestamp];
  -[SiriPresentationViewController _setButtonDownTimestamp:](self, "_setButtonDownTimestamp:");
  id v14 = objc_alloc(MEMORY[0x263F6C738]);
  p_buttonTrigger = &self->_buttonTrigger;
  id v16 = v8;
LABEL_9:
  id v17 = (void *)[v14 initWithRequestOptions:v16 updateHandle:p_buttonTrigger];
LABEL_12:
  objc_initWeak(&location, self);
  id v18 = v17;
  id v19 = v8;
  objc_copyWeak(&v21, &location);
  id v20 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __78__SiriPresentationViewController_activateWithSource_requestOptions_timestamp___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 40) isShortButtonPressAction]
      && ([*(id *)(a1 + 40) isATVRemotePTTEligible] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      int64_t v6 = [WeakRetained siriViewController];
      [v6 shortTapActionWithRequestOptions:*(void *)(a1 + 40)];

      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v7 = [v8 siriViewController];
      [v7 presentRemoteViewControllerIfNecessary];
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      id v2 = [v8 siriViewController];
      [v2 startRequestWithActivationTrigger:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4) {
      uint64_t v4 = *(void *)(a1 + 48);
    }
    id v8 = v3;
    [v3 _startRequestWithOptions:v4];
  }
}

- (void)_startRequestWithOptions:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (os_log_t *)MEMORY[0x263F28348];
  int64_t v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x263F08B88];
    id v8 = v6;
    id v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    id v29 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    __int16 v30 = 2048;
    uint64_t v31 = [v9 qualityOfService];
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  id v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v29 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  int64_t presentationState = self->_presentationState;
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  uint64_t v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v29 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    double v13 = [(SiriPresentationViewController *)self siriViewController];
    id v14 = [v13 currentRequestOptions];
  }
  else
  {
    id v14 = 0;
  }
  BOOL v15 = [(SiriPresentationViewController *)self _shouldRequestPresentationForState:presentationState forNewRequest:v4 currentRequest:v14];
  BOOL v16 = [(SiriPresentationViewController *)self _shouldHandleNewRequestWithOptions:v4 currentRequest:v14];
  if ([v4 isForStark]
    && [MEMORY[0x263F28808] isRequestForAnnounceNotification:v14])
  {
    char v17 = [MEMORY[0x263F28808] isRequestForMessageReadBannerTap:v4];
    if (!v15) {
      goto LABEL_18;
    }
  }
  else
  {
    char v17 = 0;
    if (!v15) {
      goto LABEL_18;
    }
  }
  id v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v29 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation requesting presentation for new request.", buf, 0xCu);
  }
  id v19 = objc_alloc(MEMORY[0x263F6C788]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __59__SiriPresentationViewController__startRequestWithOptions___block_invoke;
  v26[3] = &unk_2645BD3B0;
  id v27 = v4;
  id v20 = (void *)[v19 initWithBuilder:v26];
  objc_initWeak((id *)buf, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __59__SiriPresentationViewController__startRequestWithOptions___block_invoke_2;
  v23[3] = &unk_2645BD3D8;
  objc_copyWeak(&v24, (id *)buf);
  char v25 = v17;
  v23[4] = self;
  [(SiriPresentationViewController *)self _requestPresentationWithOptions:v20 completion:v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

LABEL_18:
  if (v16)
  {
    [(SiriPresentationViewController *)self _restartVisualIntelligenceIfNeededForRequestOptions:v4];
    id v21 = [(SiriPresentationViewController *)self siriViewController];
    [v21 startRequestWithOptions:v4];
  }
  else
  {
    __int16 v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[SiriPresentationViewController _startRequestWithOptions:]";
      _os_log_impl(&dword_221664000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation ignoring starting a new request.", buf, 0xCu);
    }
  }
}

void __59__SiriPresentationViewController__startRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(v3, "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));
}

void __59__SiriPresentationViewController__startRequestWithOptions___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8 || (a2 & 1) == 0)
  {
    [WeakRetained _failedToPresentSiriWithError:v8];
  }
  else if (*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) siriViewControllerConfigured])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F6ECE0]);
    uint64_t v7 = [*(id *)(a1 + 32) siriViewController];
    [v7 emitInstrumentationEvent:v6];
  }
}

- (void)_restartVisualIntelligenceIfNeededForRequestOptions:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([a3 requestSource] == 53 && self->_cachedSceneHostedView)
  {
    if ([(AFUISiriViewController *)self->_siriViewController isSceneHostingVisualIntelligence])
    {
      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "-[SiriPresentationViewController _restartVisualIntelligenceIfNeededForRequestOptions:]";
        _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence visualIntelligence already active ignoring.", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      unint64_t v6 = v5;
      if ((self->_currentLockState & 2) != 0)
      {
        self->_retryWindowStart = v5;
        self->_int numberOfVILaunchesInRestartPeriod = 0;
        uint64_t v7 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315138;
          id v11 = "-[SiriPresentationViewController _restartVisualIntelligenceIfNeededForRequestOptions:]";
          _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence - terminating VI camera for invoking while locked", (uint8_t *)&v10, 0xCu);
        }
        [(SiriPresentationViewController *)self _terminateVisualIntelligenceCamera];
      }
      if (v6 - self->_retryWindowStart > 0x6FC23ABFFLL)
      {
        self->_int numberOfVILaunchesInRestartPeriod = 1;
        self->_retryWindowStart = v6;
      }
      else
      {
        int numberOfVILaunchesInRestartPeriod = self->_numberOfVILaunchesInRestartPeriod;
        self->_int numberOfVILaunchesInRestartPeriod = numberOfVILaunchesInRestartPeriod + 1;
        if (numberOfVILaunchesInRestartPeriod >= 2)
        {
          self->_retryWindowStart = v6;
          self->_int numberOfVILaunchesInRestartPeriod = 0;
          id v9 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315138;
            id v11 = "-[SiriPresentationViewController _restartVisualIntelligenceIfNeededForRequestOptions:]";
            _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence - terminating VI camera for invoking 3x within restart period", (uint8_t *)&v10, 0xCu);
          }
          [(SiriPresentationViewController *)self _terminateVisualIntelligenceCamera];
        }
      }
    }
  }
}

- (void)_terminateVisualIntelligenceCamera
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_4() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_221664000, v4, v5, "%s #visualIntelligence Error trying to kill Visual Intelligence after max launches in restart window: %@", v6, v7, v8, v9, 2u);
}

- (BOOL)_shouldRequestPresentationForState:(int64_t)a3 forNewRequest:(id)a4 currentRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 isForStark])
  {
    char v9 = [MEMORY[0x263F28808] shouldPresentForNewRequest:v7 duringCurrentRequest:v8];
    if (a3 == 3) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldHandleNewRequestWithOptions:(id)a3 currentRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isForStark]) {
    char v7 = [MEMORY[0x263F28808] shouldStartNewRequest:v5 duringCurrentRequest:v6];
  }
  else {
    char v7 = ([v5 isRemotePresentationBringUp] & 1) == 0
  }
      && ([v5 requestSource] != 53 || objc_msgSend(MEMORY[0x263F28828], "availabilityState") != 2);

  return v7;
}

- (id)_uiPresentationIdentifier
{
  id v2 = @"com.apple.siri.CarDisplay";
  switch(self->_identifier)
  {
    case 0:
    case 3:
      id v2 = @"com.apple.siri.Compact";
      break;
    case 1:
      uint64_t v4 = [MEMORY[0x263F6C740] sharedSystemState];
      if (([v4 isConnectedToEyesFreeDevice] & 1) != 0 || objc_msgSend(v4, "carDNDActive"))
      {
        [MEMORY[0x263F286B8] isSAEEnabled];
        id v2 = @"com.apple.siri.EyesFree";
      }
      else
      {
        BOOL v5 = [(SiriPresentationViewController *)self _AFPreferencesAlwaysEyesFreeEnabled];
        int v6 = [MEMORY[0x263F286B8] isSAEEnabled];
        char v7 = @"com.apple.siri.Compact";
        if (v6) {
          char v7 = @"com.apple.siri.SystemAssistantExperience";
        }
        if (v5) {
          id v2 = @"com.apple.siri.EyesFree";
        }
        else {
          id v2 = v7;
        }
      }

      break;
    case 4:
      id v2 = @"com.apple.siri.SiriTVPresentation";
      break;
    default:
      return v2;
  }
  return v2;
}

- (CGRect)_fallbackFrameForScreen:(id)a3 withIdentifier:(int64_t)a4
{
  id v5 = a3;
  int v6 = v5;
  if ((unint64_t)a4 > 4)
  {
    double v10 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    [v5 bounds];
    double v10 = v9;
    double v12 = v11;
    if (a4 == 2)
    {
      double v14 = v8;
      double v13 = v7 + -44.0;
    }
    else
    {
      double v13 = v7;
      double v14 = v8;
    }
  }

  double v15 = v10;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)_fallbackScreenForIdentifier:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
  {
    id v5 = 0;
  }
  else
  {
    if (a3 == 2) {
      objc_msgSend(MEMORY[0x263F82B60], "_carScreen", v3);
    }
    else {
    id v5 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", v3);
    }
  }
  return v5;
}

- (void)presentationDismissalRequestedWithOptions:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = [(SiriPresentationViewController *)self _updateDismissalOptionsIfNecessary:v4];

  [(SiriPresentationViewController *)self _presentationDismissalRequestedWithOptions:v5 withCompletion:0];
}

- (id)_updateDismissalOptionsIfNecessary:(id)a3
{
  id v4 = a3;
  if ([v4 dismissalReason] == 8 && self->_isVoiceActivationMaskShown) {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F6C770]), "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", objc_msgSend(v4, "deactivationOptions"), objc_msgSend(v4, "animated"), objc_msgSend(v4, "reason"), objc_msgSend(v4, "dismissalReason"), 1);
  }
  else {
    id v5 = v4;
  }
  int v6 = v5;

  return v6;
}

- (void)_presentationDismissalRequestedWithOptions:(id)a3 withCompletion:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  double v8 = (os_log_t *)MEMORY[0x263F28348];
  double v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v6;
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation %@", buf, 0x16u);
  }
  os_log_t v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (void *)MEMORY[0x263F08B88];
    double v12 = v10;
    double v13 = [v11 currentThread];
    uint64_t v14 = [v13 qualityOfService];
    *(_DWORD *)buf = 136315394;
    v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    __int16 v69 = 2048;
    uint64_t v70 = v14;
    _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  double v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  int64_t v16 = [(SiriPresentationViewController *)self presentationState];
  if (v16 != 4)
  {
    [(SiriPresentationViewController *)self setPresentationState:4];
    double v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      _os_log_impl(&dword_221664000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:YES", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  double v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    _os_log_impl(&dword_221664000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  if (v16 == 4)
  {
    id v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    [(SiriPresentationViewController *)self _invalidateCarSiriButtonHoldToTalkTimer];
    os_log_t v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = v27;
      [(SiriPresentationViewController *)self _isDelayingSessionEnd];
      id v29 = NSStringFromBOOL();
      *(_DWORD *)buf = 136315650;
      v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v6;
      __int16 v71 = 2112;
      v72 = v29;
      _os_log_impl(&dword_221664000, v28, OS_LOG_TYPE_DEFAULT, "%s #activation options:%@ _isDelayingSessionEnd:%@", buf, 0x20u);
    }
    if ([(SiriPresentationViewController *)self _isDelayingSessionEnd])
    {
      __int16 v30 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_221664000, v30, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy #punchout delaying session end, did not send willDismiss before dismissal", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = [(SiriPresentationViewController *)self connection];
      uint64_t v32 = [v31 remoteTarget];
      [v32 willDismiss];
    }
    uint64_t v33 = [v6 reason];
    if (v33)
    {
      id v34 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_221664000, v34, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: Passing through cancellationReason", buf, 0xCu);
      }
      v35 = [(SiriPresentationViewController *)self siriViewController];
      [v35 setSiriRequestCancellationReason:v33];
    }
    [(SiriPresentationViewController *)self _instrumentSuccessfulAppLaunchIfNecessary];
    id v36 = [(SiriPresentationViewController *)self siriViewController];
    uint64_t v37 = [v36 viewMode];

    uint64_t v38 = [(SiriPresentationViewController *)self _dismissalReasonForDismissalWithOptions:v6];
    [(SiriPresentationViewController *)self _logDismissalRequestedForViewMode:v37 withDismissalReason:v38];
    id v39 = NSString;
    v40 = SASDismissalReasonGetName();
    v41 = [v39 stringWithFormat:@"#activation dismissal reason: %@", v40];

    int IsError = SASDismissalIsError();
    v43 = *v8;
    if (IsError)
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]();
      }
    }
    else if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v41;
      _os_log_impl(&dword_221664000, v43, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke;
    aBlock[3] = &unk_2645BD450;
    objc_copyWeak(v65, &location);
    id v44 = v6;
    id v62 = v44;
    v65[1] = v38;
    v63 = self;
    v64 = v7;
    uint64_t v45 = (void (**)(void))_Block_copy(aBlock);
    if ([(SiriPresentationViewController *)self currentViewMode] == 7
      && [v44 shouldTurnScreenOff])
    {
      uint64_t v46 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_221664000, v46, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI : Animating Orb before requesting dismissal", buf, 0xCu);
      }
      -[SiriPresentationViewController startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:](self, "startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:", v45, [v44 shouldTurnScreenOff]);
      objc_initWeak((id *)buf, self);
      v47 = [(SiriPresentationViewController *)self siriViewController];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_277;
      v58[3] = &unk_2645BCE00;
      objc_copyWeak(&v60, (id *)buf);
      uint64_t v59 = v45;
      [v47 animateOrbViewDismissalIfNecessaryWithCompletion:v58];

      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v45[2](v45);
    }
    objc_copyWeak(&v57, &location);
    SiriUIInvokeOnMainQueue();
    uint64_t v48 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
      -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:](v48, v49, v50, v51, v52, v53, v54, v55);
    }
    viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
    self->_viewHostingInstrumentationHandler = 0;

    objc_destroyWeak(&v57);
    objc_destroyWeak(v65);
    objc_destroyWeak(&location);
  }
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained siriPresentationControllerDelegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2;
  v8[3] = &unk_2645BD428;
  objc_copyWeak(v13, v2);
  v13[1] = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = WeakRetained;
  uint64_t v11 = v7;
  id v12 = v6;
  [v4 siriPresentation:WeakRetained requestsDismissalWithOptions:v5 withHandler:v8];

  objc_destroyWeak(v13);
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke_2";
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation handler for siriPresentation:requestsDismissalWithOptions:WithHandler:", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = (void *)*((void *)WeakRetained + 166);
  *((void *)WeakRetained + 166) = 0;

  if (v5 || !a2)
  {
    os_log_t v11 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSNumber;
      double v13 = v11;
      uint64_t v14 = [v12 numberWithBool:a2];
      *(_DWORD *)buf = 136315650;
      uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v14;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation handler for siriPresentation:requestsDismissalWithOptions:WithHandler: returned success:%@ error:%@. Aborting dismissal and calling resetSiriToActive to reset state.", buf, 0x20u);
    }
    double v15 = [WeakRetained connection];
    int64_t v16 = [v15 remoteTarget];
    [v16 resetSiriToActive];

    os_log_t v17 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = (void *)MEMORY[0x263F08B88];
      id v19 = v17;
      uint64_t v20 = [v18 currentThread];
      uint64_t v21 = [v20 qualityOfService];
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_impl(&dword_221664000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 1072));
    uint64_t v22 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock successfully locked", buf, 0xCu);
    }
    [*(id *)(a1 + 48) setPresentationState:6];
    uint64_t v23 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:NO", buf, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 268);
    uint64_t v24 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock unlocked", buf, 0xCu);
    }
    uint64_t v25 = *(void *)(a1 + 56);
    if (v25) {
      (*(void (**)(uint64_t, void))(v25 + 16))(v25, 0);
    }
  }
  else
  {
    id v10 = [WeakRetained siriViewController];
    [v10 siriWillBeginTearDownForDismissalReason:*(void *)(a1 + 72) withOriginalDismissalOptions:*(void *)(a1 + 32)];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_276;
    v26[3] = &unk_2645BD400;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    void v26[4] = WeakRetained;
    id v27 = *(id *)(a1 + 56);
    char v29 = a2;
    [WeakRetained _wasDismissedWithCompletion:v26];

    objc_destroyWeak(&v28);
  }
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_276(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained _isDelayingSessionEnd];
    id v5 = (os_log_t *)MEMORY[0x263F28348];
    if (v4)
    {
      id v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy #punchout delaying session end, did not send didDismiss on dismissal", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = [v3 connection];
      double v8 = [v7 remoteTarget];
      [v8 didDismiss];

      [v3 _teardownPongTimer];
    }
    os_log_t v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)MEMORY[0x263F08B88];
      os_log_t v11 = v9;
      id v12 = [v10 currentThread];
      uint64_t v13 = [v12 qualityOfService];
      int v21 = 136315394;
      uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1072));
    uint64_t v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock successfully locked", (uint8_t *)&v21, 0xCu);
    }
    [v3 setPresentationState:5];
    double v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:NO", (uint8_t *)&v21, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1072));
    int64_t v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_221664000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v21, 0xCu);
    }
    [v3 _setShouldDeferWake:0];
    os_log_t v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = v17;
      id v19 = NSStringFromBOOL();
      int v21 = 136315394;
      uint64_t v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v19;
      _os_log_impl(&dword_221664000, v18, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Resetting shouldDeferWake - %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(uint64_t, void))(v20 + 16))(v20, *(unsigned __int8 *)(a1 + 56));
    }
  }
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_277(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stopAnimationDismissalWatchdogTimerIfNeededThen:*(void *)(a1 + 32) onQueue:MEMORY[0x263EF83A0]];

  id v5 = objc_loadWeakRetained(v2);
  char v4 = [v5 _analytics];
  [v4 logEventWithType:1931 context:0];
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2_278(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[169])
    {
      uint64_t v3 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        id v6 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke_2";
        _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController invalidate hint glow assertion for dismissal", (uint8_t *)&v5, 0xCu);
      }
      *((void *)v2 + 170) = 0;
      [*((id *)v2 + 169) invalidate];
      char v4 = (void *)*((void *)v2 + 169);
      *((void *)v2 + 169) = 0;
    }
    [v2 _tearDownSiriEffectsViewController];
  }
}

- (void)_setUpUnownedConnectionIfNecessary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  char v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    unownedConnection = self->_unownedConnection;
    id v6 = NSNumber;
    uint64_t v7 = v4;
    double v8 = objc_msgSend(v6, "numberWithBool:", -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"));
    int v13 = 136315650;
    uint64_t v14 = "-[SiriPresentationViewController _setUpUnownedConnectionIfNecessary]";
    __int16 v15 = 2112;
    int64_t v16 = unownedConnection;
    __int16 v17 = 2112;
    double v18 = v8;
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation _unownedConnection: %@ , siriViewControllerConfigured: %@", (uint8_t *)&v13, 0x20u);
  }
  if (!self->_unownedConnection
    && ![(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    os_log_t v9 = (AFConnection *)objc_alloc_init(MEMORY[0x263F284A0]);
    id v10 = self->_unownedConnection;
    self->_unownedConnection = v9;

    os_log_t v11 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = self->_unownedConnection;
      int v13 = 136315394;
      uint64_t v14 = "-[SiriPresentationViewController _setUpUnownedConnectionIfNecessary]";
      __int16 v15 = 2112;
      int64_t v16 = v12;
      _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation created new _unownedConnection: %@", (uint8_t *)&v13, 0x16u);
    }
    [(SiriPresentationViewController *)self _scheduleConnectionHouseKeepingAfterDelay:2.0];
  }
}

- (void)preheatWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v8 = "-[SiriPresentationViewController preheatWithOptions:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Activation service requests preheat with options %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v6, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __53__SiriPresentationViewController_preheatWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1024) = 0;
    [WeakRetained _setUpUnownedConnectionIfNecessary];
    [v2[150] preheatWithStyle:1];
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v2[150];
      int v5 = 136315394;
      id v6 = "-[SiriPresentationViewController preheatWithOptions:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation preheated _unownedConnection: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)cancelPreheat
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v4 = "-[SiriPresentationViewController cancelPreheat]";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Cancel preheat", buf, 0xCu);
  }
  SiriUIInvokeOnMainQueue();
}

uint64_t __47__SiriPresentationViewController_cancelPreheat__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _cleanupUnownedConnection];
  id v2 = *(void **)(a1 + 32);
  if (v2[169])
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[SiriPresentationViewController cancelPreheat]_block_invoke";
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController invalidate hint glow assertion for cancel preheat", (uint8_t *)&v7, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 1360) = 0;
    [*(id *)(*(void *)(a1 + 32) + 1352) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 1352);
    *(void *)(v4 + 1352) = 0;

    id v2 = *(void **)(a1 + 32);
  }
  return [v2 _tearDownSiriEffectsViewController];
}

- (void)handleButtonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s handleButtonDownFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _isSpringBoardMainScreenPresentation])
    {
      uint64_t v5 = SBUIGetUserAgent();
      int v6 = [v5 isScreenOn];

      BOOL v7 = [a1[4] siriButtonIdentifier] == 1 || objc_msgSend(a1[4], "siriButtonIdentifier") == 2;
      if ((v7 & v6) == 1)
      {
        [v4 _setScreenOffDuringActivation:0];
        char v13 = 1;
      }
      else
      {
        char v13 = v7 & (v6 ^ 1);
      }
      unint64_t v14 = [a1[4] siriButtonIdentifier];
      if ((v14 > 9 || ((1 << v14) & 0x3E6) == 0) && v14 - 200 >= 2 && v14 - 100 > 1)
      {
        if (v13) {
          goto LABEL_36;
        }
        goto LABEL_28;
      }
      if ((v13 & 1) == 0 && ([v4 _cancelPendingPhoneCall] & 1) == 0) {
LABEL_28:
      }
        objc_msgSend(v4, "activateWithSource:timestamp:", objc_msgSend(MEMORY[0x263F6C708], "requestSourceForButtonIdentifier:", objc_msgSend(a1[4], "siriButtonIdentifier")), a1[5]);
    }
    else if ([v4 identifier] == 4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = a1[6];
      if ([v8 isListening])
      {
        id v9 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Received Button Down While Listening", buf, 0xCu);
        }
        [v4 _handleButtonDownWhileListeningFromButtonIdentifier:a1[4] timestamp:a1[5] context:v8];
      }
    }
    else if ((unint64_t)([a1[4] siriButtonIdentifier] - 5) <= 2)
    {
      if ([v4 siriViewControllerConfigured])
      {
        id v10 = [v4 siriViewController];
        int v11 = [v10 isVisible];

        if (v11)
        {
          [v4 _setButtonDownEventDidOccur:1];
          [a1[5] timeInterval];
          objc_msgSend(v4, "_setButtonDownTimestamp:");
        }
        id v12 = [v4 siriViewController];
        if ([v12 isListening])
        {
        }
        else
        {
          int64_t v16 = [v4 clearSiriViewControllerTimer];

          if (!v16)
          {
            [v4 _invalidateCarSiriButtonHoldToTalkTimer];
            [a1[5] timeInterval];
            objc_msgSend(v4, "_setCarSiriButtonTimeInterval:");
            __int16 v17 = (void *)MEMORY[0x263EFFA20];
            uint64_t v21 = MEMORY[0x263EF8330];
            uint64_t v22 = 3221225472;
            __int16 v23 = __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke_283;
            uint64_t v24 = &unk_2645BD478;
            objc_copyWeak(&v26, v2);
            id v25 = a1[4];
            __int16 v18 = [v17 scheduledTimerWithTimeInterval:0 repeats:&v21 block:0.4];
            objc_msgSend(v4, "_setCarSiriButtonHoldToTalkTimer:", v18, v21, v22, v23, v24);

            id v19 = (id)*MEMORY[0x263F28348];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              __int16 v20 = [v4 _carSiriButtonHoldToTalkTimer];
              *(_DWORD *)buf = 136315650;
              id v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke_2";
              __int16 v29 = 2112;
              __int16 v30 = v20;
              __int16 v31 = 2048;
              uint64_t v32 = 0x3FD999999999999ALL;
              _os_log_impl(&dword_221664000, v19, OS_LOG_TYPE_INFO, "%s #activation Started Car Siri button long press timer (%@) for %f seconds", buf, 0x20u);
            }
            objc_destroyWeak(&v26);
          }
        }
      }
      else
      {
        id v15 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_INFO, "%s #activation button pressed, but AFUISiriViewController is not set up, returning early.", buf, 0xCu);
        }
      }
    }
  }
LABEL_36:
}

void __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke_283(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));
  }
}

- (void)_handleButtonDownWhileListeningFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int64_t v16 = "-[SiriPresentationViewController _handleButtonDownWhileListeningFromButtonIdentifier:timestamp:context:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s _handleButtonDownWhileListeningFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v8;
  id v13 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __104__SiriPresentationViewController__handleButtonDownWhileListeningFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && [a1[4] siriButtonIdentifier] == 201
    && [a1[5] isPTTEligible]
    && [WeakRetained[172] isListening])
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[SiriPresentationViewController _handleButtonDownWhileListeningFromButtonIdentifier:timestamp:context:]_block_invoke";
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #ptt We are Listening, sending Button Down While Listening to Siri View Controller", (uint8_t *)&v4, 0xCu);
    }
    [WeakRetained[172] tvRemoteSentButtonDownWhileListening];
  }
}

- (void)handleButtonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  kdebug_trace();
  id v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonUpFromButtonIdentifier:%@ deviceIdentifier:%@ timestamp:%@ context:%@", buf, 0x34u);
  }
  if ([MEMORY[0x263F28510] isTVPushToTalkEnabled]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v15 = v13;
  }
  else
  {
    id v15 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v23) = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v20, &location);
  id v16 = v10;
  id v17 = v15;
  id v18 = v13;
  id v19 = v11;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __104__SiriPresentationViewController_handleButtonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained
    && objc_msgSend(WeakRetained, "_buttonIdentifierIsHoldToTalkTrigger:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier")))
  {
    if ((unint64_t)([*(id *)(a1 + 32) siriButtonIdentifier] - 5) <= 2) {
      [WeakRetained _invalidateCarSiriButtonHoldToTalkTimer];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [WeakRetained _releaseExistingTrigger];
  }
  if ([*(id *)(a1 + 32) siriButtonIdentifier] == 201)
  {
    if ([*(id *)(a1 + 40) isPTTEligible]
      && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && (AFPreferencesTypeToSiriEnabled() & 1) == 0)
    {
      id v18 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *(void **)(a1 + 40);
        id v20 = v18;
        [v19 remoteType];
        uint64_t v21 = SiriTVStringForRemoteType();
        int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        int v23 = 136315650;
        __int16 v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
        __int16 v25 = 2112;
        __int16 v26 = v21;
        __int16 v27 = 1024;
        int v28 = v22;
        _os_log_impl(&dword_221664000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #ptt Not stopping requests as the remote - %@ is PTT Eligible, and tap released trigger - %{BOOL}d", (uint8_t *)&v23, 0x1Cu);
      }
    }
    else
    {
      int v4 = (os_log_t *)MEMORY[0x263F28348];
      uint64_t v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315138;
        __int16 v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v23, 0xCu);
      }
      uint64_t v6 = objc_msgSend(MEMORY[0x263F6C708], "requestSourceForButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));
      id v7 = objc_alloc(MEMORY[0x263F6C730]);
      id v8 = [*(id *)(a1 + 48) _uiPresentationIdentifier];
      id v9 = (void *)[v7 initWithRequestSource:v6 uiPresentationIdentifier:v8 buttonContext:*(void *)(a1 + 56)];

      if ([*(id *)(a1 + 64) length]) {
        [v9 setActivationDeviceIdentifier:*(void *)(a1 + 64)];
      }
      id v10 = objc_loadWeakRetained(v2);
      id v11 = [v10 siriViewController];
      int v12 = [v11 isListening];

      if (v12)
      {
        id v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136315138;
          __int16 v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v23, 0xCu);
        }
        id v14 = objc_loadWeakRetained(v2);
        id v15 = [v14 siriViewController];
        [v15 stopRequestWithOptions:v9];
      }
      id v16 = objc_loadWeakRetained(v2);
      id v17 = [v16 siriViewController];
      [v17 didReceiveButtonUpWithRequestOptions:v9];
    }
  }
}

- (void)handleButtonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SiriPresentationViewController handleButtonTapFromButtonIdentifier:timestamp:context:]";
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonTapFromButtonIdentifier:%@", buf, 0x16u);
  }
  if (![MEMORY[0x263F28510] isTVPushToTalkEnabled]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v12 = 0;
    goto LABEL_8;
  }
  id v12 = v10;
  if (![v12 isPTTEligible])
  {
LABEL_8:
    objc_initWeak((id *)buf, self);
    id v14 = v8;
    objc_copyWeak(&v15, (id *)buf);
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v15);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  id v13 = [v12 activeDeviceBluetoothIdentifier];
  [(SiriPresentationViewController *)self handleButtonUpFromButtonIdentifier:v8 deviceIdentifier:v13 timestamp:v9 context:v12];

LABEL_9:
}

void __88__SiriPresentationViewController_handleButtonTapFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  __int16 v18 = @"eventSource";
  id v2 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(a1[4], "siriButtonIdentifier"));
  v19[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  int v4 = [MEMORY[0x263F283F8] sharedAnalytics];
  uint64_t v5 = AFAnalyticsEventCreateCurrent();
  [v4 logEvent:v5];

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (-[NSObject _handleTapButtonBehavior:](WeakRetained, "_handleTapButtonBehavior:", [a1[4] siriButtonIdentifier]))
  {

LABEL_5:
    id v10 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSString;
      id v12 = a1[4];
      id WeakRetained = v10;
      id v13 = objc_msgSend(v11, "stringWithSiriButtonIdentifier:", objc_msgSend(v12, "siriButtonIdentifier"));
      int v14 = 136315394;
      id v15 = "-[SiriPresentationViewController handleButtonTapFromButtonIdentifier:timestamp:context:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_221664000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s #activation handled for %@", (uint8_t *)&v14, 0x16u);

LABEL_8:
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained(a1 + 6);
  if ((objc_msgSend(v7, "_buttonIdentifierIsHoldToTalkTrigger:", objc_msgSend(a1[4], "siriButtonIdentifier")) & 1) == 0)
  {

    goto LABEL_8;
  }
  id v8 = objc_loadWeakRetained(a1 + 6);
  int v9 = [v8 _releaseExistingTrigger];

  if (v9) {
    goto LABEL_5;
  }
LABEL_9:
  [a1[5] _setButtonDownEventDidOccur:0];
}

- (void)handleButtonLongPressFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  kdebug_trace();
  int v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s handleButtonLongPressFromButtonIdentifier:%@ deviceIdentifier:%@ timestamp:%@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v19, (id *)buf);
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __111__SiriPresentationViewController_handleButtonLongPressFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained[172] isListening];
    uint64_t v5 = *MEMORY[0x263F28348];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v13 = 136315394;
        int v14 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:cont"
              "ext:]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonLongPressFromIdentifier:%@ whileListening:YES Ignoring", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v13 = 136315394;
        int v14 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:cont"
              "ext:]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonLongPressFromIdentifier:%@ whileListening:NO Starting a new request", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v9 = objc_msgSend(MEMORY[0x263F6C708], "requestSourceForButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));
      id v10 = objc_alloc(MEMORY[0x263F6C730]);
      id v11 = [*(id *)(a1 + 40) _uiPresentationIdentifier];
      id v12 = (void *)[v10 initWithRequestSource:v9 uiPresentationIdentifier:v11 buttonContext:*(void *)(a1 + 48)];

      [*(id *)(a1 + 56) timeInterval];
      objc_msgSend(v12, "setButtonDownTimestamp:");
      if ([*(id *)(a1 + 64) length]) {
        [v12 setActivationDeviceIdentifier:*(void *)(a1 + 64)];
      }
      [v3 activateWithSource:v9 requestOptions:v12 timestamp:*(void *)(a1 + 56)];
    }
  }
}

- (void)presentationWithIdentifier:(id)a3 didUpdatePresentationState:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSString;
    uint64_t v8 = v6;
    uint64_t v9 = objc_msgSend(v7, "stringWithSiriPresentationIdentifier:", -[SiriPresentationViewController identifier](self, "identifier"));
    int v10 = 136315650;
    id v11 = "-[SiriPresentationViewController presentationWithIdentifier:didUpdatePresentationState:]";
    __int16 v12 = 2112;
    int v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ received presentation state update %@", (uint8_t *)&v10, 0x20u);
  }
}

- (BOOL)_handleTapButtonBehavior:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  BOOL v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSString;
    uint64_t v8 = v6;
    uint64_t v9 = [v7 stringWithSiriButtonIdentifier:a3];
    int v28 = 136315394;
    uint64_t v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
    __int16 v30 = 2112;
    __int16 v31 = v9;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation _handleTapButtonBehavior:%@", (uint8_t *)&v28, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x263F6C730]);
  uint64_t v11 = [MEMORY[0x263F6C708] requestSourceForButtonIdentifier:a3];
  __int16 v12 = [(SiriPresentationViewController *)self _uiPresentationIdentifier];
  int v13 = (void *)[v10 initWithRequestSource:v11 uiPresentationIdentifier:v12];

  if ((unint64_t)a3 > 9) {
    goto LABEL_19;
  }
  if (((1 << a3) & 0x30E) != 0)
  {
    if ([(SiriPresentationViewController *)self _wasScreenOffDuringActivation])
    {
      __int16 v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 136315138;
        uint64_t v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
        _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s Turning on the screen because pocket state kept the screen off during activation", (uint8_t *)&v28, 0xCu);
      }
      id v15 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
      int v16 = [(id)objc_opt_class() conformsToProtocol:&unk_26D3C16C8];

      if (v16)
      {
        uint64_t v17 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
        [v17 screenWakeRequested];
        id v18 = [(SiriPresentationViewController *)self _analytics];
        [v18 logEventWithType:1930 context:&unk_26D3AF540];

        [(SiriPresentationViewController *)self _setScreenOffDuringActivation:0];
LABEL_18:

LABEL_21:
        char v21 = 1;
        goto LABEL_23;
      }
LABEL_22:
      char v21 = 0;
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (((1 << a3) & 0xE0) != 0)
  {
LABEL_11:
    id v19 = self;
    int64_t v20 = a3;
    goto LABEL_12;
  }
  if (a3 != 4)
  {
LABEL_19:
    if (a3 == 201)
    {
      __int16 v26 = [(SiriPresentationViewController *)self siriViewController];
      [v26 shortTapActionWithRequestOptions:v13];

      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ([(AFUISiriViewController *)self->_siriViewController isListening])
  {
    __int16 v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315138;
      uint64_t v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
      _os_log_impl(&dword_221664000, v22, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v17 = [(SiriPresentationViewController *)self siriViewController];
    id v23 = objc_alloc(MEMORY[0x263F6C730]);
    __int16 v24 = [(SiriPresentationViewController *)self _uiPresentationIdentifier];
    id v25 = (void *)[v23 initWithRequestSource:17 uiPresentationIdentifier:v24];
    [v17 stopRequestWithOptions:v25];

    goto LABEL_18;
  }
  id v19 = self;
  int64_t v20 = 4;
LABEL_12:
  char v21 = [(SiriPresentationViewController *)v19 _handleTapDismissal:v20];
LABEL_23:

  return v21;
}

- (BOOL)_handleTapDismissal:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(SiriPresentationViewController *)self _cancelPendingPhoneCall]) {
    return 1;
  }
  if (self->_siriSetupViewController)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      int64_t v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s Dismissing Siri setup due to button tap", (uint8_t *)&v19, 0xCu);
    }
    [(SiriPresentationViewController *)self _dismissSiriSetup];
    return 1;
  }
  BOOL v8 = [(SiriPresentationViewController *)self siriViewControllerConfigured];
  uint64_t v9 = *MEMORY[0x263F28348];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v19 = 136315138;
      int64_t v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s Dismissing Siri due to button tap", (uint8_t *)&v19, 0xCu);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      uint64_t v11 = 20;
    }
    else if (a3 == 5)
    {
      id v15 = [(SiriPresentationViewController *)self siriViewController];
      int v16 = [v15 currentRequestOptions];
      uint64_t v17 = [v16 requestSource];

      if (v17 == 37) {
        uint64_t v11 = 41;
      }
      else {
        uint64_t v11 = 50;
      }
    }
    else
    {
      uint64_t v11 = 5;
    }
    BOOL v6 = 1;
    id v18 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:v11];
    [(SiriPresentationViewController *)self _requestDismissalWithOptions:v18];
  }
  else
  {
    if (v10)
    {
      BOOL activationHandled = self->_activationHandled;
      siriViewController = self->_siriViewController;
      __int16 v14 = v9;
      int v19 = 136315650;
      int64_t v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      __int16 v21 = 1024;
      BOOL v22 = activationHandled;
      __int16 v23 = 1024;
      int v24 = [(AFUISiriViewController *)siriViewController isVisible];
      _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s Not handled: _activationHandled=%d [_siriViewController isVisible]=%d", (uint8_t *)&v19, 0x18u);
    }
    return 0;
  }
  return v6;
}

- (void)updateCurrentLockState:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SiriPresentationViewController_updateCurrentLockState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentLockState:", objc_msgSend(*(id *)(a1 + 32), "SASLockState"));
}

- (void)setCurrentLockState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_currentLockState != a3)
  {
    self->_unint64_t currentLockState = a3;
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t currentLockState = self->_currentLockState;
      int v8 = 136315394;
      uint64_t v9 = "-[SiriPresentationViewController setCurrentLockState:]";
      __int16 v10 = 2048;
      unint64_t v11 = currentLockState;
      _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Lock state in SiriPresentationViewController updated to %zd", (uint8_t *)&v8, 0x16u);
    }
    if (self->_siriViewController)
    {
      uint64_t v7 = [(SiriPresentationViewController *)self siriViewController];
      [v7 setLockState:a3];
    }
  }
}

- (void)_requestDismissal
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1];
  [(SiriPresentationViewController *)self _requestDismissalWithOptions:v3];
}

- (void)_requestDismissalWithOptions:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SiriPresentationViewController *)self _invalidateCarSiriButtonHoldToTalkTimer];
  [(SiriPresentationViewController *)self _setScreenOffDuringActivation:0];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SiriPresentationViewController _requestDismissalWithOptions:]";
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_INFO, "%s wantsDismissal", (uint8_t *)&v6, 0xCu);
  }
  [(SiriPresentationViewController *)self presentationDismissalRequestedWithOptions:v4];
}

- (void)_carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(SiriPresentationViewController *)self _carSiriButtonTimeInterval];
  if (v5 != 0.0)
  {
    int v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[SiriPresentationViewController _carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:]";
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_INFO, "%s #activation Starting new Speech Request due to Car Siri button long press timer", (uint8_t *)&v11, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x263F6C730]);
    uint64_t v8 = [MEMORY[0x263F6C708] requestSourceForButtonIdentifier:a3];
    uint64_t v9 = [(SiriPresentationViewController *)self _uiPresentationIdentifier];
    __int16 v10 = (void *)[v7 initWithRequestSource:v8 uiPresentationIdentifier:v9];

    [(SiriPresentationViewController *)self activateWithRequestOptions:v10];
  }
  [(SiriPresentationViewController *)self _invalidateCarSiriButtonHoldToTalkTimer];
}

- (void)cancelPendingActivationEventWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[SiriPresentationViewController cancelPendingActivationEventWithReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s cancelPendingActivationEventWithReason:%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v7, (id *)buf);
  id v6 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __73__SiriPresentationViewController_cancelPendingActivationEventWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cancelPendingActivationWithReason:", objc_msgSend(*(id *)(a1 + 32), "cancelReason"));
}

- (void)_cancelPendingActivationWithReason:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSString;
    uint64_t v8 = v6;
    uint64_t v9 = [v7 stringWithSiriPresentationActivationCancelReason:a3];
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[SiriPresentationViewController _cancelPendingActivationWithReason:]";
    __int16 v27 = 2112;
    int v28 = v9;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s cancelReason=%@", buf, 0x16u);
  }
  if (self->_activationHandled)
  {
    __int16 v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[SiriPresentationViewController _cancelPendingActivationWithReason:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    if (self->_receivedIncomingPhoneCall) {
      unint64_t v18 = 5;
    }
    else {
      unint64_t v18 = a3;
    }
    int v19 = objc_msgSend(NSString, "stringWithSiriPresentationActivationCancelReason:", v18, @"cancelReason");
    int v24 = v19;
    int64_t v20 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    __int16 v21 = [MEMORY[0x263F283F8] sharedAnalytics];
    BOOL v22 = AFAnalyticsEventCreateCurrent();
    [v21 logEvent:v22];

    if (self->_unownedConnection)
    {
      [(SiriPresentationViewController *)self _cleanupUnownedConnection];
      [(SiriPresentationViewController *)self _requestDismissal];
    }
  }
}

- (BOOL)_buttonIdentifierIsHoldToTalkTrigger:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 9 && ((0x183u >> (a3 - 1)) & 1) != 0
      || [(SiriPresentationViewController *)self identifier] == 2
      || [(SiriPresentationViewController *)self identifier] == 4;
}

- (void)bulletinManagerDidChangeBulletins
{
}

- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[SiriPresentationViewController siriSessionShouldExtendAudioSessionForImminentPhoneCall]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Extending audio session for imminent phone call. Setting _waitingForTelephonyToStart:YES", (uint8_t *)&v4, 0xCu);
  }
  [(SiriPresentationViewController *)self _setWaitingForTelephonyToStart:1];
}

- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = NSNumber;
    siriViewController = self->_siriViewController;
    uint64_t v6 = v3;
    id v7 = objc_msgSend(v4, "numberWithBool:", -[AFUISiriViewController isVisible](siriViewController, "isVisible"));
    int v8 = 136315394;
    uint64_t v9 = "-[SiriPresentationViewController siriSessionShouldEndExtendAudioSessionForImminentPhoneCall]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler stop extending audio session while visible: %@", (uint8_t *)&v8, 0x16u);
  }
  if ([(AFUISiriViewController *)self->_siriViewController isVisible])
  {
    self->_waitingForTelephonyToStart = 0;
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__telephonyHasStarted object:0];
  }
  else
  {
    [(SiriPresentationViewController *)self _setWaitingForTelephonyToStart:0];
  }
}

- (BOOL)_AFPreferencesAlwaysEyesFreeEnabled
{
  return MEMORY[0x270F0EE90](self, a2);
}

- (AFUISiriViewController)siriViewController
{
  siriViewController = self->_siriViewController;
  if (!siriViewController)
  {
    int v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriPresentationViewController siriViewController](v4);
    }
    siriViewController = self->_siriViewController;
  }
  return siriViewController;
}

- (id)_createSiriViewControllerWithRequestOptions:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 requestSource];
  }
  else {
    uint64_t v6 = 0;
  }
  int64_t v7 = [(SiriPresentationViewController *)self _viewModeForRequestOptions:v5];
  self->_int64_t currentViewMode = v7;
  BOOL v8 = [(SiriPresentationViewController *)self _shouldAllowResizingBetweenModesForViewMode:v7];
  uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F753A0]), "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", -[SiriPresentationViewController preferredFlamesViewFidelity](self, "preferredFlamesViewFidelity"), 1, v8, v7, 1);
  if (v6 == 53)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unownedConnection = self->_unownedConnection;
    if (unownedConnection) {
      uint64_t v11 = unownedConnection;
    }
    else {
      uint64_t v11 = (AFConnection *)objc_alloc_init(MEMORY[0x263F284A0]);
    }
    uint64_t v9 = (__CFString *)v11;
  }
  uint64_t v12 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    uint64_t v14 = SASRequestSourceGetName();
    *(_DWORD *)buf = 136315906;
    __int16 v31 = "-[SiriPresentationViewController _createSiriViewControllerWithRequestOptions:]";
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    __int16 v34 = 2112;
    id v35 = v29;
    __int16 v36 = 2112;
    uint64_t v37 = v14;
    _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Creating new view controller with connection: %@, configuration: %@, requestSource: %@", buf, 0x2Au);
  }
  if ([(SiriPresentationViewController *)self _canPresentSiriEffectsViewControllerWithRequestOptions:v5])
  {
    uint64_t v15 = [(SiriPresentationViewController *)self siriEffectsViewController];
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = objc_alloc(MEMORY[0x263F28838]);
  displayConfiguration = self->_displayConfiguration;
  unint64_t v18 = [(SiriPresentationViewController *)self _viewHostingInstrumentationHandler];
  int v19 = (void *)[v16 initWithConnection:v9 configuration:v29 requestSource:v6 displayConfiguration:displayConfiguration edgeLightViewProvider:v15 instrumentationHandler:v18];

  int64_t v20 = self->_unownedConnection;
  self->_unownedConnection = 0;

  [v19 setDataSource:self];
  [v19 setDelegate:self];
  objc_msgSend(v19, "setLockState:", -[SiriPresentationViewController currentLockState](self, "currentLockState"));
  [(SiriPresentationViewController *)self hostedPresentationFrame];
  objc_msgSend(v19, "setHostedPresentationFrame:");
  if ([v5 isConnectedToCarPlay])
  {
    BOOL v21 = 0;
  }
  else
  {
    BOOL v21 = 1;
    if (v7 != 4 && v7 != 8) {
      BOOL v21 = [(SiriPresentationViewController *)self _AFPreferencesAlwaysEyesFreeEnabled];
    }
  }
  objc_msgSend(v19, "setSupportsCarPlayVehicleData:", objc_msgSend(v5, "supportsCarPlayVehicleData"));
  [v19 setEyesFree:v21];
  objc_msgSend(v19, "setDeviceInStarkMode:", objc_msgSend(v5, "isForStark"));
  objc_msgSend(v19, "setCarDNDActive:", objc_msgSend(v5, "isForCarDND"));
  objc_msgSend(v19, "setDirectActionEvent:", objc_msgSend(v5, "directActionEvent"));
  BOOL v22 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    if ([v5 isForStark]) {
      int v24 = @"YES";
    }
    else {
      int v24 = @"NO";
    }
    [v5 carDNDStatus];
    uint64_t v25 = CARAutomaticFeatureStateGetName();
    __int16 v26 = NSStringFromBOOL();
    [v5 supportsCarPlayVehicleData];
    __int16 v27 = NSStringFromBOOL();
    *(_DWORD *)buf = 136316162;
    __int16 v31 = "-[SiriPresentationViewController _createSiriViewControllerWithRequestOptions:]";
    __int16 v32 = 2112;
    uint64_t v33 = v24;
    __int16 v34 = 2112;
    id v35 = v25;
    __int16 v36 = 2112;
    uint64_t v37 = v26;
    __int16 v38 = 2112;
    id v39 = v27;
    _os_log_impl(&dword_221664000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay #carDnd #eyesFree isForStark: %@, carDNDStatus: %@, eyesFree: %@, supportsCarPlayVehicleData: %@", buf, 0x34u);
  }
  return v19;
}

- (BOOL)siriViewControllerConfigured
{
  return self->_siriViewController != 0;
}

- (void)_scheduleConnectionHouseKeepingAfterDelay:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    int64_t v7 = v5;
    BOOL v8 = [v6 numberWithDouble:a3];
    int v9 = 136315394;
    __int16 v10 = "-[SiriPresentationViewController _scheduleConnectionHouseKeepingAfterDelay:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation delay: %@", (uint8_t *)&v9, 0x16u);
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__processConnectionHouseKeeping object:0];
  [(SiriPresentationViewController *)self performSelector:sel__processConnectionHouseKeeping withObject:0 afterDelay:a3];
}

- (void)_processConnectionHouseKeeping
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[SiriPresentationViewController _processConnectionHouseKeeping]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v4, 0xCu);
  }
  [(SiriPresentationViewController *)self _cleanupUnownedConnection];
}

- (void)_cleanupUnownedConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    unownedConnection = self->_unownedConnection;
    int v7 = 136315394;
    BOOL v8 = "-[SiriPresentationViewController _cleanupUnownedConnection]";
    __int16 v9 = 2112;
    __int16 v10 = unownedConnection;
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _unownedConnection: %@", (uint8_t *)&v7, 0x16u);
  }
  double v5 = self->_unownedConnection;
  if (v5)
  {
    [(AFConnection *)v5 cancelRequest];
    [(AFConnection *)self->_unownedConnection endSession];
    [(AFConnection *)self->_unownedConnection invalidate];
    [(AFConnection *)self->_unownedConnection setSpeechDelegate:0];
    [(AFConnection *)self->_unownedConnection setDelegate:0];
    uint64_t v6 = self->_unownedConnection;
    self->_unownedConnection = 0;
  }
}

- (void)_clearSiriViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  __int16 v9 = __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke;
  __int16 v10 = &unk_2645BD518;
  uint64_t v11 = self;
  id v5 = v4;
  id v12 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(&v7);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v7, v8, v9, v10, v11)) {
    v6[2](v6);
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], v6);
  }
}

void __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[SiriPresentationViewController _clearSiriViewControllerWithCompletion:]_block_invoke";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation _clearSiriViewController", buf, 0xCu);
  }
  id v3 = *(id *)(*(void *)(a1 + 32) + 1376);
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  [*(id *)(a1 + 32) _invalidateCarSiriButtonHoldToTalkTimer];
  [*(id *)(a1 + 32) _cleanupUnownedConnection];
  id v4 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 1080);
  *(void *)(v5 + 1080) = v4;

  uint64_t v7 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA20];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke_311;
    uint64_t v15 = &unk_2645BD478;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v3;
    __int16 v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:&v12 block:3.0];
    objc_msgSend(v7, "setClearSiriViewControllerTimer:", v9, v12, v13, v14, v15);

    [*(id *)(*(void *)(a1 + 32) + 1376) siriDidDeactivate];
    [*(id *)(*(void *)(a1 + 32) + 1376) setDataSource:0];
    __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 1376) underlyingConnection];
    [v10 invalidate];

    [*(id *)(*(void *)(a1 + 32) + 1376) willMoveToParentViewController:0];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 1376) view];
    [v11 removeFromSuperview];

    [*(id *)(*(void *)(a1 + 32) + 1376) removeFromParentViewController];
    [*(id *)(a1 + 32) setSiriViewController:0];

    objc_destroyWeak(&v17);
  }
  else
  {
    [*(id *)(a1 + 32) _finishClearingSiriViewController:0];
  }
  objc_destroyWeak((id *)buf);
}

void __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke_311(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SiriPresentationViewController _clearSiriViewControllerWithCompletion:]_block_invoke";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation calling didDismiss from inside clearSiriViewControllerTimer", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishClearingSiriViewController:*(void *)(a1 + 32)];
}

- (void)_finishClearingSiriViewController:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation _finishClearingSiriViewController", (uint8_t *)&v12, 0xCu);
  }
  [(SiriPresentationViewController *)self _invalidateCarSiriButtonHoldToTalkTimer];
  uint64_t v7 = [(SiriPresentationViewController *)self clearSiriViewControllerTimer];
  [v7 invalidate];

  [(SiriPresentationViewController *)self setClearSiriViewControllerTimer:0];
  uint64_t v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation clearSiriViewControllerTimer was invalidated", (uint8_t *)&v12, 0xCu);
  }
  [(AFUISiriViewController *)self->_siriViewController updatePresentationVisualState:0];
  [v4 setDelegate:0];

  __int16 v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s Attempting to enable the SpringBoard idle timer because we are losing the SiriViewController", (uint8_t *)&v12, 0xCu);
  }
  [(SiriPresentationViewController *)self _enableSpringBoardIdleTimer];
  dismissalCompletion = (void (**)(void))self->_dismissalCompletion;
  if (dismissalCompletion)
  {
    dismissalCompletion[2]();
    id v11 = self->_dismissalCompletion;
    self->_dismissalCompletion = 0;
  }
}

- (void)_invalidateCarSiriButtonHoldToTalkTimer
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SiriPresentationViewController *)self _carSiriButtonHoldToTalkTimer];

  if (v3)
  {
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SiriPresentationViewController *)self _carSiriButtonHoldToTalkTimer];
      int v8 = 136315394;
      __int16 v9 = "-[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer]";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_INFO, "%s #activation Invalidating _carSiriButtonHoldToTalkTimer (%@)…", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = [(SiriPresentationViewController *)self _carSiriButtonHoldToTalkTimer];
    [v7 invalidate];

    [(SiriPresentationViewController *)self _setCarSiriButtonHoldToTalkTimer:0];
    [(SiriPresentationViewController *)self _setCarSiriButtonTimeInterval:0.0];
  }
}

- (void)_handleContextClearForRequestOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriPresentationViewController *)self _isDelayingSessionEnd]
    && ([v4 isForStark] & 1) != 0
    || [v4 directActionEvent] && (objc_msgSend(v4, "isForStark") & 1) != 0)
  {
    uint64_t v5 = 6;
  }
  else
  {
    uint64_t v5 = 7;
  }
  if ([v4 requestSource] == 26)
  {
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[SiriPresentationViewController _handleContextClearForRequestOptions:]";
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s Triggerless request, dont clear Siri context", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = 3;
  }
  uint64_t v7 = [(SiriPresentationViewController *)self siriViewController];
  [v7 resetContextTypes:v5];
}

- (void)_dismissSiriSetup
{
  if (self->_siriSetupNavigationController)
  {
    objc_initWeak(&location, self);
    siriSetupNavigationController = self->_siriSetupNavigationController;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__SiriPresentationViewController__dismissSiriSetup__block_invoke;
    v4[3] = &unk_2645BD018;
    objc_copyWeak(&v5, &location);
    [(UINavigationController *)siriSetupNavigationController dismissViewControllerAnimated:1 completion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__SiriPresentationViewController__dismissSiriSetup__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSiriSetupNavigationController:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setSiriSetupViewController:0];

  id v5 = (id)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:0 dismissalReason:30];
  id v4 = objc_loadWeakRetained(v1);
  [v4 dismissWithOptions:v5];
}

- (void)_wasDismissedWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  kdebug_trace();
  if ([(SiriPresentationViewController *)self _isDelayingSessionEnd])
  {
    id v5 = [(SiriPresentationViewController *)self siriViewController];
    uint64_t v6 = [v5 _siriView];
    [v6 setMode:0];

    uint64_t v7 = [(SiriPresentationViewController *)self siriViewController];
    [v7 cancelSpeechRecordingIfNecessary];

LABEL_7:
    char v9 = 1;
    goto LABEL_9;
  }
  if ([(SiriPresentationViewController *)self siriSetupViewControllerPresented])
  {
    [(SiriPresentationViewController *)self _removeSetupViewControllerIfNecessary];
    int v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[SiriPresentationViewController _wasDismissedWithCompletion:]";
      _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s Attempting to enable the SpringBoard idle timer because we are losing the setupViewController", (uint8_t *)&v11, 0xCu);
    }
    [(SiriPresentationViewController *)self _enableSpringBoardIdleTimer];
    goto LABEL_7;
  }
  [(SiriPresentationViewController *)self _clearSiriViewControllerWithCompletion:v4];
  char v9 = 0;
LABEL_9:
  if ([(SiriPresentationViewController *)self _startGuidedAccessOnDismissal])
  {
    _AXSGuidedAccessStartSession();
    [(SiriPresentationViewController *)self _setStartGuidedAccessOnDismissal:0];
  }
  char v10 = v9 ^ 1;
  if (!v4) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0) {
    v4[2](v4);
  }
}

- (void)_siriDidOpenURL:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  int v5 = _ACIsTelephonyURL(v4);

  if (v5)
  {
    [(SiriPresentationViewController *)self _setWaitingForTelephonyToStart:1];
  }
}

- (BOOL)_releaseExistingTrigger
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_buttonTrigger) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v8 = 136315394;
    char v9 = "-[SiriPresentationViewController _releaseExistingTrigger]";
    __int16 v10 = 2112;
    int v11 = v4;
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s _buttonTrigger=%@", (uint8_t *)&v8, 0x16u);
  }
  buttonTrigger = (void (**)(id, uint64_t))self->_buttonTrigger;
  if (buttonTrigger)
  {
    buttonTrigger[2](self->_buttonTrigger, 2);
    id v6 = self->_buttonTrigger;
    self->_buttonTrigger = 0;

    [(SiriPresentationViewController *)self _setButtonDownEventDidOccur:0];
  }
  return buttonTrigger != 0;
}

- (BOOL)_isDeviceButton:(int64_t)a3
{
  return a3 == 9 || (unint64_t)(a3 - 1) < 2;
}

- (void)_enableSpringBoardIdleTimer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(SiriPresentationViewController *)self presentationHostedInSpringBoard])
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[SiriPresentationViewController _enableSpringBoardIdleTimer]";
      _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s Siri enabled SpringBoard idle timer", (uint8_t *)&v4, 0xCu);
    }
    [(SiriPresentationViewController *)self _setSpringBoardIdleTimerDisabled:0];
  }
}

- (void)_dismissDueToUnexpectedError:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[SiriPresentationViewController _dismissDueToUnexpectedError:]();
  }
  int v5 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:0 dismissalReason:21];
  [(SiriPresentationViewController *)self _requestDismissalWithOptions:v5];
}

- (int64_t)_impliedDismissalReasonFromState
{
  if (self->_instrumentationDismissalState.punchedOut) {
    return 9;
  }
  if (self->_instrumentationDismissalState.incomingPhoneCallDetected) {
    return 2;
  }
  if (self->_instrumentationDismissalState.outgoingPhoneCallDetected) {
    return 3;
  }
  if (self->_instrumentationDismissalState.fluidDismissalSet) {
    return 6;
  }
  if ([(NSString *)self->_instrumentationDismissalState.attemptedAppLaunchIdentifier length]) {
    return 29;
  }
  return 0;
}

- (void)_logDismissalRequestedForViewMode:(int64_t)a3 withDismissalReason:(int64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = SASDismissalReasonGetName();
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    __int16 v10 = @"reason";
    v11[0] = v6;
    int v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    char v9 = [(SiriPresentationViewController *)self _analytics];
    [v9 logEventWithType:1460 context:v8];
  }
  [(SiriPresentationViewController *)self _logDismissalToPowerLogWithReason:a4];
  [(SiriPresentationViewController *)self _emitInstrumentationDismissalStateWithReason:a4];
}

- (void)_logDismissalToPowerLogWithReason:(int64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  int v5 = @"ReasonEnd";
  id v3 = [NSNumber numberWithInteger:a3];
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  PLLogRegisteredEvent();
}

- (void)_instrumentSuccessfulAppLaunchIfNecessary
{
  p_instrumentationDismissalState = &self->_instrumentationDismissalState;
  if ([(NSString *)self->_instrumentationDismissalState.attemptedAppLaunchIdentifier length])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F6EDB0]);
    [v5 setAppID:p_instrumentationDismissalState->attemptedAppLaunchIdentifier];
    id v4 = [(SiriPresentationViewController *)self siriViewController];
    [v4 emitInstrumentationEvent:v5];
  }
}

- (void)_emitInstrumentationDismissalStateWithReason:(int64_t)a3
{
  id v5 = [(SiriPresentationViewController *)self siriViewController];
  [v5 emitUIStateTransitionForSiriDismissalWithReason:a3];

  [(SiriPresentationViewController *)self _resetStateForInstrumentation];
}

- (int64_t)_dismissalReasonForDismissalWithOptions:(id)a3
{
  int64_t v4 = [a3 dismissalReason];
  int64_t v5 = [(SiriPresentationViewController *)self _impliedDismissalReasonFromState];
  if (v4)
  {
    if (v5 == 29 && v4 == 4) {
      return 29;
    }
    else {
      return v4;
    }
  }
  else
  {
    return [(SiriPresentationViewController *)self _impliedDismissalReasonFromState];
  }
}

- (void)_resetStateForInstrumentation
{
  p_instrumentationDismissalState = &self->_instrumentationDismissalState;
  *(_DWORD *)&self->_instrumentationDismissalState.fluidDismissalSet = 0;
  attemptedAppLaunchIdentifier = self->_instrumentationDismissalState.attemptedAppLaunchIdentifier;
  p_instrumentationDismissalState->attemptedAppLaunchIdentifier = (NSString *)&stru_26D3AC7A0;
}

- (id)_analytics
{
  return (id)[MEMORY[0x263F283F8] sharedAnalytics];
}

- (id)_viewHostingInstrumentationHandler
{
  viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
  if (!viewHostingInstrumentationHandler)
  {
    int64_t v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      [(SiriPresentationViewController *)v4 _viewHostingInstrumentationHandler];
    }
    uint64_t v12 = (SRUIFPlatformHostingInstrumentationHandler *)objc_opt_new();
    uint64_t v13 = self->_viewHostingInstrumentationHandler;
    self->_viewHostingInstrumentationHandler = v12;

    viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
  }
  return viewHostingInstrumentationHandler;
}

- (void)_logSignatureWithType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[SiriPresentationViewController _logSignatureWithType:subType:context:]();
  }
  uint64_t v10 = [MEMORY[0x263F6CF68] sharedInstance];
  uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
  objc_msgSend(v10, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", v7, v8, v9, objc_msgSend(v11, "processIdentifier"), AFIsInternalInstall());
}

- (void)siriViewController:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  id v8 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __94__SiriPresentationViewController_siriViewController_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 123, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)siriViewController:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __91__SiriPresentationViewController_siriViewController_failedToLaunchAppWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[123];
    WeakRetained[123] = &stru_26D3AC7A0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)siriViewControllerDidFinishDismissing:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SiriPresentationViewController siriViewControllerDidFinishDismissing:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation siriViewControllerDidFinishDismissing: %@", (uint8_t *)&v7, 0x16u);
  }
  if (self->_clearSiriViewControllerTimer)
  {
    [(SiriPresentationViewController *)self _finishClearingSiriViewController:v4];
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:0];
    [(SiriPresentationViewController *)self dismissWithOptions:v6];
  }
}

- (void)siriViewController:(id)a3 didEncounterUnexpectedError:(id)a4
{
}

- (void)dismissSiriViewController:(id)a3 withReason:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    __int16 v9 = SASDismissalReasonGetName();
    int v11 = 136315650;
    uint64_t v12 = "-[SiriPresentationViewController dismissSiriViewController:withReason:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #punchout #activation %@ %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:a4];
  [(SiriPresentationViewController *)self presentationDismissalRequestedWithOptions:v10];
}

- (void)startGuidedAccessForSiriViewController:(id)a3
{
  [(SiriPresentationViewController *)self _setStartGuidedAccessOnDismissal:1];
  id v4 = (id)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1];
  [(SiriPresentationViewController *)self presentationDismissalRequestedWithOptions:v4];
}

- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = [v5 requestInfo];

  if (v6)
  {
    int v7 = [v5 requestInfo];
    if ([v7 activationEvent] == 6 || objc_msgSend(v7, "activationEvent") == 9)
    {
      id v8 = [v7 requestCompletionOptions];
      completionOptions = self->_completionOptions;
      self->_completionOptions = v8;
    }
  }
  if (([v5 isTypeToSiriRequest] & 1) == 0) {
    [(SiriPresentationViewController *)self _presentSiriEffectsWithRequestOptions:v5];
  }
  id v10 = [(SiriPresentationViewController *)self _updateRequestOptionsWithTestingInput:v5];

  return v10;
}

- (id)siriViewController:(id)a3 didStopRequestWithOptions:(id)a4
{
  id v4 = a4;
  return v4;
}

- (id)_updateRequestOptionsWithTestingInput:(id)a3
{
  id v4 = a3;
  if ([(SiriPresentationViewController *)self _hasTestingInput])
  {
    id v5 = [(SiriPresentationViewController *)self _dequeueTestingInput];
    uint64_t v6 = [v5 type];
    if (v6 == 2)
    {
      int v7 = [v5 recordedSpeechURL];
      [v4 setSpeechFileURL:v7];
    }
    else
    {
      if (v6 != 1)
      {
LABEL_7:

        goto LABEL_8;
      }
      int v7 = [v5 text];
      [v4 setText:v7];
    }

    goto LABEL_7;
  }
LABEL_8:
  return v4;
}

- (BOOL)siriViewControllerShouldEndSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = ![(SiriPresentationViewController *)self _isDelayingSessionEnd];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    int v7 = NSStringFromBOOL();
    BOOL waitingForTelephonyToStart = self->_waitingForTelephonyToStart;
    int v10 = 136315650;
    int v11 = "-[SiriPresentationViewController siriViewControllerShouldEndSession:]";
    __int16 v12 = 2112;
    __int16 v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = waitingForTelephonyToStart;
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #punchout shouldEnd:%@ waitingForTelephonyToStart:%i", (uint8_t *)&v10, 0x1Cu);
  }
  return v4;
}

- (void)siriViewController:(id)a3 willStartHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v10 siriPresentation:self willStartHostingSceneWithIdentifier:v11 bundleIdentifier:v7];
  }
}

- (void)siriViewController:(id)a3 willStopHostingSceneWithIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v10 siriPresentation:self willStopHostingSceneWithIdentifier:v11 bundleIdentifier:v7];
  }
}

- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__SiriPresentationViewController_requestTamaleLaunchAnimationLayerProviderWithCompletion___block_invoke;
    v8[3] = &unk_2645BD540;
    id v9 = v4;
    [v7 requestTamaleLaunchAnimationLayerProviderWithCompletion:v8];
  }
}

void __90__SiriPresentationViewController_requestTamaleLaunchAnimationLayerProviderWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 transitioningLayer];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)requestCachedSceneHostedView
{
  return self->_cachedSceneHostedView;
}

- (void)siriViewController:(id)a3 cacheSceneHostedView:(id)a4
{
}

- (void)siriViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SiriPresentationViewController *)self presentationHostedInSpringBoard]) {
    [(SiriPresentationViewController *)self _setSpringBoardIdleTimerDisabled:!v4];
  }
  self->_isIdleAndQuiet = v4;
}

- (void)_setScreenOffDuringActivation:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    char v6 = v5;
    id v7 = NSStringFromBOOL();
    int v8 = 136315394;
    id v9 = "-[SiriPresentationViewController _setScreenOffDuringActivation:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Setting wasScreenOffDuringActivation to %@", (uint8_t *)&v8, 0x16u);
  }
  self->_wasScreenOffDuringActivation = a3;
}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    BOOL v15 = NSStringFromBOOL();
    *(_DWORD *)buf = 136315906;
    __int16 v27 = "-[SiriPresentationViewController openURL:bundleId:inPlace:completion:]";
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    __int16 v31 = v15;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #punchout 2 bundleId:%@ inPlace:%@ url:%@", buf, 0x2Au);
  }
  if ([v11 isEqualToString:*MEMORY[0x263F753F0]])
  {
    uint64_t v16 = [MEMORY[0x263F753D8] defaultBrowserBundleIdentifier];

    id v11 = (id)v16;
  }
  id v17 = objc_alloc_init(MEMORY[0x263F6C790]);
  unint64_t v18 = v17;
  if (v7) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  [v17 setPunchoutStyle:v19];
  [v18 setBundleIdentifier:v11];
  if (v10)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v20 = (void *)MEMORY[0x263F01850];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__SiriPresentationViewController_openURL_bundleId_inPlace_completion___block_invoke;
    v21[3] = &unk_2645BD568;
    id v22 = v18;
    id v23 = v10;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = v12;
    [v20 getAppLinkWithURL:v23 completionHandler:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(SiriPresentationViewController *)self _punchout:v18 completion:v12];
  }
}

void __70__SiriPresentationViewController_openURL_bundleId_inPlace_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = [a2 targetApplicationProxy];
    id v5 = [v4 bundleIdentifier];
    [v3 setBundleIdentifier:v5];
  }
  [*(id *)(a1 + 32) setUrl:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _punchout:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)_punchout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v6;
  id v9 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__SiriPresentationViewController__punchout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = [WeakRetained siriPresentationControllerDelegate];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __55__SiriPresentationViewController__punchout_completion___block_invoke_2;
  v7[3] = &unk_2645BD590;
  id v8 = v6;
  objc_copyWeak(&v10, v2);
  id v9 = *(id *)(a1 + 40);
  [v4 siriPresentation:v5 requestsPunchout:v8 withHandler:v7];

  objc_destroyWeak(&v10);
}

void __55__SiriPresentationViewController__punchout_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x263F28348];
  id v7 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2)
    {
      id v9 = @"Completed";
    }
    else
    {
      id v9 = [v5 localizedDescription];
    }
    int v18 = 136315650;
    uint64_t v19 = "-[SiriPresentationViewController _punchout:completion:]_block_invoke_2";
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #punchout 3 %@ %@", (uint8_t *)&v18, 0x20u);
    if ((a2 & 1) == 0) {
  }
    }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 977) = a2;
    if (a2)
    {
      id v12 = [*(id *)(a1 + 32) url];
      int v13 = _ACIsTelephonyURL(v12);

      if (v13)
      {
        __int16 v14 = [v11 siriViewController];
        [v14 telephonyRequestCompleted];
      }
    }
    if ([*(id *)(a1 + 32) punchoutStyle] == 2 && v11[162] == 5)
    {
      BOOL v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        uint64_t v19 = "-[SiriPresentationViewController _punchout:completion:]_block_invoke";
        _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #punchout 4 Deactivating scene and returning focus back to CarPlay", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v16 = [v11 siriViewController];
      [v16 deactivateScene];
    }
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, a2);
    }
  }
}

- (BOOL)siriViewController:(id)a3 attemptUnlockWithPassword:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  int v7 = [(id)objc_opt_class() conformsToProtocol:&unk_26D3C16C8];

  if (v7)
  {
    uint64_t v8 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    char v9 = [v8 siriPresentation:self requestsDeviceUnlockWithPassword:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)siriViewController:(id)a3 updateHomeAffordanceForBlurVisibilty:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SiriPresentationViewController *)self isAmbientPresented]) {
    int v6 = [MEMORY[0x263F286B8] isSAEEnabled] ^ 1;
  }
  else {
    int v6 = 1;
  }
  if ((v4 & v6) != 0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  [(SiriPresentationViewController *)self _requestHomeAffordanceSuppression:v7];
}

- (void)_requestHomeAffordanceSuppression:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (a3 == 1 || !self->_isVoiceActivationMaskShown)
    {
      uint64_t v8 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
      [v8 siriPresentation:self setHomeAffordanceSuppression:a3];

      char v9 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = NSString;
        id v11 = v9;
        id v12 = [v10 stringWithSiriHomeAffordanceSuppression:a3];
        int v13 = 136315394;
        __int16 v14 = "-[SiriPresentationViewController _requestHomeAffordanceSuppression:]";
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #Compact: Telling SpringBoard that the Siri Home affordance state is %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        __int16 v14 = "-[SiriPresentationViewController _requestHomeAffordanceSuppression:]";
        _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #Compact: Not showing Home Affordance as we are showing voiceActivationMask, Returning", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)siriViewController:(id)a3 didCompleteRequestWithError:(id)a4
{
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __81__SiriPresentationViewController_siriViewController_didCompleteRequestWithError___block_invoke;
  v7[3] = &unk_2645BD018;
  objc_copyWeak(&v8, &location);
  dispatch_async(v5, v7);

  completionOptions = self->_completionOptions;
  self->_completionOptions = 0;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __81__SiriPresentationViewController_siriViewController_didCompleteRequestWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained siriViewController];
    if ([v2 carDNDActive])
    {
      id v3 = [v5 siriViewController];
      uint64_t v4 = [v3 currentSource];

      id WeakRetained = v5;
      if (v4 != 8) {
        goto LABEL_6;
      }
      uint64_t v2 = [MEMORY[0x263F753C0] sharedPreferences];
      [v2 setVoiceRequestMadeWhileInCarDND:1];
    }

    id WeakRetained = v5;
  }
LABEL_6:
}

- (void)siriViewController:(id)a3 requestsPresentation:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[SiriPresentationViewController siriViewController:requestsPresentation:]";
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation siriPresentationControllerDelegate called", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  char v9 = (void *)[objc_alloc(MEMORY[0x263F6C788]) initWithBuilder:0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke;
  v11[3] = &unk_2645BD5E0;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [(SiriPresentationViewController *)self _requestPresentationWithOptions:v9 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = v5;
  char v8 = a2;
  SiriUIInvokeOnMainQueue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  objc_destroyWeak(&v7);
}

void __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained && !v3)
  {
    if (*(unsigned char *)(a1 + 48)) {
      goto LABEL_6;
    }
    uint64_t v3 = 0;
  }
  id v4 = WeakRetained;
  [WeakRetained _failedToPresentSiriWithError:v3];
  id WeakRetained = v4;
LABEL_6:
}

- (void)siriViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a5;
  char v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    char v9 = v8;
    id v10 = SASDismissalReasonGetName();
    int v12 = 136315394;
    id v13 = "-[SiriPresentationViewController siriViewController:requestsDismissalWithReason:withCompletion:]";
    __int16 v14 = 2112;
    __int16 v15 = v10;
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:a4];
  [(SiriPresentationViewController *)self _presentationDismissalRequestedWithOptions:v11 withCompletion:v7];
}

- (void)siriViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->siriPresentationControllerDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      char v9 = @"Not Visible";
      if (v4) {
        char v9 = @"Visible";
      }
      int v11 = 136315394;
      int v12 = "-[SiriPresentationViewController siriViewController:willChangeKeyboardVisibility:]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #SAE - telling delegate keyboard visibility will change to: %@", (uint8_t *)&v11, 0x16u);
    }
    id v10 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v10 siriPresentation:self willChangeKeyboardVisibility:v4];
  }
}

- (void)siriViewController:(id)a3 presentedIntentWithBundleId:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriPresentationViewController *)self intentUsageDelegate];
  [v6 activeIntentWithBundleId:v5];
}

- (id)getDeviceEngagementEvents:(id)a3 forDeviceEngagementTimeWindow:(double)a4
{
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  char v7 = [(SiriPresentationViewController *)self deviceEngagementTimeStamps];
  char v8 = [v7 objectForKey:&unk_26D3AF590];

  char v9 = [(SiriPresentationViewController *)self deviceEngagementTimeStamps];
  id v10 = [v9 objectForKey:&unk_26D3AF5A8];

  int v11 = [MEMORY[0x263EFF910] date];
  int v12 = v11;
  if (v8)
  {
    [v11 timeIntervalSinceDate:v8];
    if (v13 < a4) {
      [v6 addObject:&unk_26D3AF590];
    }
  }
  if (v10)
  {
    [v12 timeIntervalSinceDate:v10];
    if (v14 < a4) {
      [v6 addObject:&unk_26D3AF5A8];
    }
  }

  return v6;
}

- (id)bulletinsForSiriViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  id v5 = [(SiriPresentationViewController *)self connection];
  id v6 = [v5 remoteTarget];

  if ([(SiriPresentationViewController *)self identifier] == 1)
  {
    char v7 = [MEMORY[0x263F6C740] sharedSystemState];
    char v8 = [v7 lockStateMonitor];
    char v9 = [v8 lockState];

    if ((v9 & 2) != 0) {
      [v6 bulletinsOnLockScreen];
    }
    else {
      [v6 allBulletins];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isRead", (void)v18) & 1) == 0) {
            [v4 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }
  }
  uint64_t v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[SiriPresentationViewController bulletinsForSiriViewController:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_221664000, v16, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  return v4;
}

- (void)siriViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  id v8 = a4;
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v7 siriPresentation:self didUpdateAudioCategoriesDisablingVolumeHUD:v8];
  }
}

- (void)siriViewControllerSpeechRequestStartedFromSiriOrb
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(SiriPresentationViewController *)self connection];
  uint64_t v3 = [v2 remoteTarget];

  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    char v6 = "-[SiriPresentationViewController siriViewControllerSpeechRequestStartedFromSiriOrb]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech request was started from Siri orb button press %@", (uint8_t *)&v5, 0x16u);
  }
  [v3 speechRequestStartedFromSiriOrb];
}

- (void)siriViewControllerDidReactivateFromFlexibleFollowups
{
  uint64_t v3 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v5 siriRequestDidReactivateForSiriPresentation:self];
  }
}

- (void)siriViewControllerSpeechRequestCancelledFromSiriOrb
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(SiriPresentationViewController *)self connection];
  uint64_t v3 = [v2 remoteTarget];

  char v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    char v6 = "-[SiriPresentationViewController siriViewControllerSpeechRequestCancelledFromSiriOrb]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech request was cancelled from Siri orb button press %@", (uint8_t *)&v5, 0x16u);
  }
  [v3 speechRequestCancelledFromSiriOrb];
}

- (void)siriViewController:(id)a3 voiceActivationMaskViewIsVisible:(BOOL)a4
{
  BOOL v4 = a4;
  [(SiriPresentationViewController *)self _setVoiceActivationMaskShown:a4];
  if (v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(SiriPresentationViewController *)self _requestHomeAffordanceSuppression:v6];
}

- (void)siriViewController:(id)a3 onboardingScreenContinueButtonTappedWithRequestOptions:(id)a4
{
}

- (void)requestSystemApertureCollapse
{
  uint64_t v3 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v5 restrictSystemApertureToDefaultLayoutWithReason:@"Siri requested collapse"];

    [(SiriPresentationViewController *)self invalidateSystemApertureAssertion];
  }
}

- (void)invalidateSystemApertureAssertion
{
  uint64_t v3 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v5 invalidateSystemApertureAssertionWithReason:@"Siri invalidated collapse"];
  }
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  if (a3)
  {
    if (SiriUIDeviceIsPad()) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(SiriPresentationViewController *)self _requestHomeAffordanceSuppression:v4];
}

- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v7 siriPresentation:self setSiriHomeAffordanceGestureControl:v3];
  }
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(v4, &location);
  v4[1] = (id)a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __61__SiriPresentationViewController_updateEdgeLightWindowLevel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4 == 1)
    {
      char v6 = [WeakRetained siriPresentationControllerDelegate];
      id v7 = [v3 edgeLightWindowLevelInvalidable];
      if (v7)
      {
      }
      else if (objc_opt_respondsToSelector())
      {
        id v8 = [*(id *)(a1 + 32) requestCachedSceneHostedView];
        uint64_t v9 = @"EdgeLight In Tamale";
        if (!v8) {
          uint64_t v9 = @"User Drilled in";
        }
        id v10 = v9;

        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        void v11[2] = __61__SiriPresentationViewController_updateEdgeLightWindowLevel___block_invoke_2;
        v11[3] = &unk_2645BD608;
        void v11[4] = v3;
        [v6 siriPresentation:v3 acquireElevatedEffectsViewControllerAssertionWithReason:v10 handler:v11];
      }
    }
    else if (!v4)
    {
      id v5 = [WeakRetained edgeLightWindowLevelInvalidable];
      [v5 invalidate];

      [v3 setEdgeLightWindowLevelInvalidable:0];
    }
  }
}

uint64_t __61__SiriPresentationViewController_updateEdgeLightWindowLevel___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setEdgeLightWindowLevelInvalidable:a2];
}

- (BOOL)headphonesAuthenticated
{
  headphonesAuthenticationManager = self->_headphonesAuthenticationManager;
  if (headphonesAuthenticationManager) {
    LOBYTE(headphonesAuthenticationManager) = [(SASHeadphonesAuthenticationManager *)headphonesAuthenticationManager isAuthenticated];
  }
  return (char)headphonesAuthenticationManager;
}

- (id)siriViewController:(id)a3 bulletinWithIdentifier:(id)a4
{
  id v5 = a4;
  char v6 = [(SiriPresentationViewController *)self connection];
  id v7 = [v6 remoteTarget];
  id v8 = [v7 bulletinForIdentifier:v5];

  return v8;
}

- (UIEdgeInsets)safeAreaInsetsForSceneCreationInSiriViewController:(id)a3
{
  uint64_t v4 = (SiriPresentationViewController *)a3;
  id v5 = v4;
  if (self->_currentViewMode == 7)
  {
    char v6 = [(SiriPresentationViewController *)self view];
    id v7 = [v6 window];
    id v8 = [v7 windowScene];
    uint64_t v9 = [v8 _FBSScene];
    id v10 = [v9 settings];

    [v10 safeAreaInsetsPortrait];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    goto LABEL_26;
  }
  long long v19 = [(SiriPresentationViewController *)v4 view];
  [v19 safeAreaInsets];
  double v12 = *MEMORY[0x263F834E8];
  double v14 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v18 = *(double *)(MEMORY[0x263F834E8] + 24);
  if (v23 != v14 || v20 != v12 || v22 != v18)
  {

LABEL_24:
    id v39 = v5;
LABEL_25:
    uint64_t v40 = [(SiriPresentationViewController *)v39 view];
    [v40 safeAreaInsets];
    double v12 = v41;
    double v14 = v42;
    double v16 = v43;
    double v18 = v44;

    goto LABEL_26;
  }
  double v26 = v21;
  double v16 = *(double *)(MEMORY[0x263F834E8] + 16);

  if (v26 != v16) {
    goto LABEL_24;
  }
  [(SiriPresentationViewController *)v5 additionalSafeAreaInsets];
  if (v30 != v14 || v27 != v12 || v29 != v18 || v28 != v16)
  {
    uint64_t v34 = v5;
LABEL_23:
    [(SiriPresentationViewController *)v34 additionalSafeAreaInsets];
    double v12 = v35;
    double v14 = v36;
    double v16 = v37;
    double v18 = v38;
    goto LABEL_26;
  }
  uint64_t v49 = [(SiriPresentationViewController *)self view];
  [v49 safeAreaInsets];
  if (v53 != v14 || v50 != v12 || v52 != v18)
  {

LABEL_41:
    id v39 = self;
    goto LABEL_25;
  }
  double v56 = v51;

  if (v56 != v16) {
    goto LABEL_41;
  }
  [(SiriPresentationViewController *)self additionalSafeAreaInsets];
  if (v60 != v14 || v57 != v12 || v59 != v18 || v58 != v16)
  {
    uint64_t v34 = self;
    goto LABEL_23;
  }
LABEL_26:

  double v45 = v12;
  double v46 = v14;
  double v47 = v16;
  double v48 = v18;
  result.right = v48;
  result.bottom = v47;
  result.left = v46;
  result.top = v45;
  return result;
}

- (void)siriSAEEffectsViewController:(id)a3 requestsPresentationWithHandler:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  id v7 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [(SiriPresentationViewController *)self siriEffectsViewController];
    [v7 siriPresentation:self requestsPresentationOfEffectsViewController:v6 withHandler:v5];
  }
  else
  {
    char v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.siri.activation" code:6 userInfo:0];
    v5[2](v5, 0, v6);
  }
}

- (void)siriSAEEffectsViewController:(id)a3 requestsDismissalWithHandler:(id)a4
{
  id v7 = (void (**)(id, void, void *))a4;
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 siriPresentation:self requestsDismissalOfEffectsViewControllerWithHandler:v7];
  }
  else
  {
    char v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.siri.activation" code:6 userInfo:0];
    v7[2](v7, 0, v6);
  }
}

- (void)_checkForGuideUpdatesIfNecessary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [MEMORY[0x263EFF910] date];
    lastGuideCheck = self->_lastGuideCheck;
    if (lastGuideCheck)
    {
      id v5 = [(NSDate *)lastGuideCheck dateByAddingTimeInterval:86400.0];
      if ([v5 compare:v3] == -1)
      {
        uint64_t v8 = [MEMORY[0x263F28828] availabilityState];

        if (v8) {
          goto LABEL_15;
        }
      }
      else
      {
        char v6 = [MEMORY[0x263F28810] sharedManager];
        id v7 = [v6 cachedGuideSnippet];
        if (v7)
        {

LABEL_15:
          return;
        }
        uint64_t v9 = [MEMORY[0x263F28828] availabilityState];

        if (v9) {
          goto LABEL_15;
        }
      }
    }
    else if ([MEMORY[0x263F28828] availabilityState])
    {
      goto LABEL_15;
    }
    objc_storeStrong((id *)&self->_lastGuideCheck, v3);
    id v10 = [MEMORY[0x263F28810] sharedManager];
    int v11 = [v10 shouldCheckForUpdateWithLastAppUpdateTime:self->_lastAppUpdateTimestamp];

    if (v11)
    {
      double v12 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        double v15 = "-[SiriPresentationViewController _checkForGuideUpdatesIfNecessary]";
        _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s Checking for guide updates", (uint8_t *)&v14, 0xCu);
      }
      double v13 = [MEMORY[0x263F28810] sharedManager];
      [v13 checkGuideUpdate];
    }
    goto LABEL_15;
  }
}

- (void)_applicationsDidChange
{
  self->_lastAppUpdateTimestamp = [MEMORY[0x263EFF910] date];
  MEMORY[0x270F9A758]();
}

- (void)_setSpringBoardIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(SiriPresentationViewController *)self presentationHostedInSpringBoard])
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      char v6 = @"Enabled";
      if (v3) {
        char v6 = @"Disabled";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "-[SiriPresentationViewController _setSpringBoardIdleTimerDisabled:]";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ the SpringBoard idle timer", buf, 0x16u);
    }
    SiriUIInvokeOnMainQueue();
    self->_springBoardIdleTimerDisabled = v3;
  }
}

void __67__SiriPresentationViewController__setSpringBoardIdleTimerDisabled___block_invoke(uint64_t a1)
{
  SBUIGetUserAgent();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setIdleTimerDisabled:*(unsigned __int8 *)(a1 + 32) forReason:@"SiriIsTalking"];
}

- (BOOL)_cancelPendingPhoneCall
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SiriPresentationViewController *)self _isWaitingForTelephonyToStart];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SiriPresentationViewController _cancelPendingPhoneCall]";
      _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler we are waiting for telephony to start, so cancelling pending phone call", (uint8_t *)&v6, 0xCu);
    }
    CTCallListDisconnect();
    [(SiriPresentationViewController *)self _setWaitingForTelephonyToStart:0];
  }
  return v3;
}

- (void)_setWaitingForTelephonyToStart:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  int v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSNumber;
    uint64_t v8 = v6;
    __int16 v9 = [v7 numberWithBool:v3];
    *(_DWORD *)buf = 136315394;
    double v27 = "-[SiriPresentationViewController _setWaitingForTelephonyToStart:]";
    __int16 v28 = 2112;
    double v29 = v9;
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler setting _waitingForTelephonyToStart:%@", buf, 0x16u);
  }
  if (self->_waitingForTelephonyToStart != v3)
  {
    self->_BOOL waitingForTelephonyToStart = v3;
    [(AFUISiriViewController *)self->_siriViewController setWaitingForTelephonyToStart:v3];
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    if (self->_waitingForTelephonyToStart)
    {
      uint64_t v11 = [MEMORY[0x263F544E0] sharedAVSystemController];
      double v12 = (void *)MEMORY[0x263F54348];
      uint64_t v25 = *MEMORY[0x263F54348];
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [v11 setAttribute:v13 forKey:*MEMORY[0x263F544A0] error:0];
      [v10 addObserver:self selector:sel__callIsActiveDidChangeNotification_ name:*v12 object:0];
      [(SiriPresentationViewController *)self _sendTelephonyHasStartedAfterDelay:10.0];
      self->_instrumentationDismissalState.outgoingPhoneCallDetected = 1;
    }
    else
    {
      int v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v27 = "-[SiriPresentationViewController _setWaitingForTelephonyToStart:]";
        _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler requesting dismissal", buf, 0xCu);
      }
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:3];
      [(SiriPresentationViewController *)self dismissWithOptions:v11];
      uint64_t v24 = *MEMORY[0x263F54348];
      [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v20;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(v10, "removeObserver:name:object:", self, *(void *)(*((void *)&v19 + 1) + 8 * v18++), 0, (void)v19);
          }
          while (v16 != v18);
          uint64_t v16 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v16);
      }
    }
  }
}

- (void)_telephonyHasStarted
{
}

- (void)_sendTelephonyHasStartedAfterDelay:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSNumber;
    id v7 = v5;
    uint64_t v8 = [v6 numberWithDouble:a3];
    int v9 = 136315394;
    id v10 = "-[SiriPresentationViewController _sendTelephonyHasStartedAfterDelay:]";
    __int16 v11 = 2112;
    double v12 = v8;
    _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Setting %@ second audio session extension timer, if the timer fires, we'll stop extending the audio session", (uint8_t *)&v9, 0x16u);
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__telephonyHasStarted object:0];
  [(SiriPresentationViewController *)self performSelector:sel__telephonyHasStarted withObject:0 afterDelay:a3];
}

- (void)_callIsActiveDidChangeNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *MEMORY[0x263F54348];
    int v7 = 136315394;
    uint64_t v8 = "-[SiriPresentationViewController _callIsActiveDidChangeNotification:]";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler %@ posted: ending audio session", (uint8_t *)&v7, 0x16u);
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__telephonyHasStarted object:0];
  if ([(SiriPresentationViewController *)self _isWaitingForTelephonyToStart]) {
    [(SiriPresentationViewController *)self _telephonyHasStarted];
  }
}

- (BOOL)presentationHostedInSpringBoard
{
  return self->_identifier == 1;
}

- (BOOL)isAmbientPresented
{
  BOOL v3 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  char v6 = [v5 isAmbientActive];

  return v6;
}

- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a3
      && [(AFUISiriViewController *)self->_siriViewController isVisible]
      && ![(SiriPresentationViewController *)self _isWaitingForTelephonyToStart])
    {
      char v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[SiriPresentationViewController callStateChangedToIsActive:isOutgoing:]";
        _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Requesting dismissal for outgoing phone call", (uint8_t *)&v9, 0xCu);
      }
      int v7 = (void *)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:3];
      [(SiriPresentationViewController *)self dismissWithOptions:v7];
    }
  }
  else
  {
    self->_receivedIncomingPhoneCall = a3;
    [(AFUISiriViewController *)self->_siriViewController setReceivedIncomingPhoneCall:a3];
    if (v4) {
      char v8 = [(AFUISiriViewController *)self->_siriViewController isVisible];
    }
    else {
      char v8 = 0;
    }
    self->_instrumentationDismissalState.incomingPhoneCallDetected = v8;
  }
}

- (void)_showSetupViewControllerIfNecessary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  kdebug_trace();
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[SiriPresentationViewController _showSetupViewControllerIfNecessary]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation Siri supported but not enabled, presenting an AFUISiriSetupViewController", buf, 0xCu);
  }
  [(SiriPresentationViewController *)self _updateHostedPresentationFrame];
  if (!self->_siriSetupViewController)
  {
    BOOL v4 = (AFUISiriSetupViewController *)objc_alloc_init(MEMORY[0x263F28830]);
    siriSetupViewController = self->_siriSetupViewController;
    self->_siriSetupViewController = v4;

    [(AFUISiriSetupViewController *)self->_siriSetupViewController setDelegate:self];
    char v6 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_siriSetupViewController];
    siriSetupNavigationController = self->_siriSetupNavigationController;
    self->_siriSetupNavigationController = v6;

    [(UINavigationController *)self->_siriSetupNavigationController setModalPresentationStyle:2];
    char v8 = [(UINavigationController *)self->_siriSetupNavigationController presentationController];
    [v8 setDelegate:self->_siriSetupViewController];
  }
  id v9 = objc_alloc(MEMORY[0x263F754C0]);
  uint64_t v10 = (void *)[v9 initWithSuiteName:*MEMORY[0x263F75518]];
  uint64_t v11 = [v10 integerForKey:@"NumberOfTimesSetupSiriShown"];
  if (v11 < 2)
  {
    [v10 setInteger:v11 + 1 forKey:@"NumberOfTimesSetupSiriShown"];
    [v10 synchronize];
  }
  else
  {
    [(AFUISiriSetupViewController *)self->_siriSetupViewController setLastTimeShown:1];
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke;
  v12[3] = &unk_2645BD650;
  objc_copyWeak(&v13, (id *)buf);
  [(SiriPresentationViewController *)self siriViewController:0 requestsPresentation:v12];
  kdebug_trace();
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke(uint64_t a1, char a2)
{
  objc_copyWeak(&v3, (id *)(a1 + 32));
  char v4 = a2;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v3);
}

void __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained siriSetupNavigationController];
    [v4 presentViewController:v3 animated:1 completion:0];

    [v4 _setupSiriViewControllerPresentedSuccessHandler];
    id WeakRetained = v4;
  }
}

- (void)_setupSiriViewControllerPresentedSuccessHandler
{
  kdebug_trace();
  id v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  [v3 didPresentSiri];

  [(SiriPresentationViewController *)self setSiriSetupViewControllerPresented:1];
}

- (void)_removeSetupViewControllerIfNecessary
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SiriPresentationViewController _removeSetupViewControllerIfNecessary]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _removeSetupViewControllerIfNecessary", (uint8_t *)&v4, 0xCu);
  }
  if (self->_siriSetupViewController)
  {
    [(UINavigationController *)self->_siriSetupNavigationController dismissViewControllerAnimated:0 completion:0];
    [(SiriPresentationViewController *)self setSiriSetupNavigationController:0];
    [(SiriPresentationViewController *)self setSiriSetupViewController:0];
    [(SiriPresentationViewController *)self setSiriSetupViewControllerPresented:0];
  }
}

- (BOOL)siriSetupViewController:(id)a3 openURL:(id)a4
{
  return 1;
}

- (void)disableSiriActivationRequestedBySiriSetupViewController:(id)a3
{
}

- (void)openSiriRequestedBySiriSetupViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeSetupViewControllerIfNecessary];
    id v3 = (void *)[objc_alloc(MEMORY[0x263F6C730]) initWithRequestSource:19 uiPresentationIdentifier:@"com.apple.siri.Compact"];
    id v4 = objc_alloc(MEMORY[0x263F6C788]);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke_2;
    v10[3] = &unk_2645BD3B0;
    id v5 = v3;
    id v11 = v5;
    uint64_t v6 = (void *)[v4 initWithBuilder:v10];
    [v2 presentationRequestedWithPresentationOptions:v6 requestOptions:v5];
    int v7 = [v2[172] _siriView];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [v2[172] _fullSiriView];
      [v9 setBackdropVisible:1];
    }
  }
}

void __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(v3, "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));
}

- (void)startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  watchdogQueue = self->_watchdogQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __109__SiriPresentationViewController_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke;
  v9[3] = &unk_2645BD678;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(watchdogQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __109__SiriPresentationViewController_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void)_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(SiriPresentationViewController *)self animationDismissalTimer];

  id v8 = (os_log_t *)MEMORY[0x263F28348];
  if (v7)
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriPresentationViewController _watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v17 = [(SiriPresentationViewController *)self animationDismissalTimer];
    [v17 cancelIfNotAlreadyCanceled];

    [(SiriPresentationViewController *)self setAnimationDismissalTimer:0];
  }
  objc_initWeak(&location, self);
  id v18 = objc_alloc(MEMORY[0x263F286E8]);
  id v19 = MEMORY[0x263EF83A0];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  double v26 = __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke;
  double v27 = &unk_2645BD678;
  objc_copyWeak(&v29, &location);
  id v20 = v6;
  id v28 = v20;
  BOOL v30 = a4;
  long long v21 = (void *)[v18 initWithTimeoutInterval:MEMORY[0x263EF83A0] onQueue:&v24 timeoutHandler:0.75];
  -[SiriPresentationViewController setAnimationDismissalTimer:](self, "setAnimationDismissalTimer:", v21, v24, v25, v26, v27);

  long long v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[SiriPresentationViewController _watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:]";
    __int16 v34 = 2048;
    uint64_t v35 = 0x3FE8000000000000;
    _os_log_impl(&dword_221664000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Starting animation dismissal watchdog timer for %f seconds", buf, 0x16u);
  }
  double v23 = [(SiriPresentationViewController *)self animationDismissalTimer];
  [v23 start];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = [WeakRetained animationDismissalTimer];
  [v11 cancelIfNotAlreadyCanceled];

  [WeakRetained setAnimationDismissalTimer:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v12 = [WeakRetained _analytics];
    [v12 logEventWithType:1931 context:0];
  }
  [WeakRetained _logSignatureWithType:@"AnimationDismissalWatchdogTimerFired" subType:0 context:MEMORY[0x263EFFA78]];
}

- (void)_watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SiriPresentationViewController *)self animationDismissalTimer];

  uint64_t v9 = *MEMORY[0x263F28348];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SiriPresentationViewController _watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:]";
      _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Animation dismissal watchdog timer request stopping", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [(SiriPresentationViewController *)self animationDismissalTimer];
    [v11 cancelIfNotAlreadyCanceled];

    [(SiriPresentationViewController *)self setAnimationDismissalTimer:0];
  }
  else if (v10)
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SiriPresentationViewController _watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:]";
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Animation dismissal watchdog timer request stopping, but not needed", (uint8_t *)&v12, 0xCu);
  }
  dispatch_async(v6, v7);
}

- (void)stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  watchdogQueue = self->_watchdogQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __90__SiriPresentationViewController_stopAnimationDismissalWatchdogTimerIfNeededThen_onQueue___block_invoke;
  v11[3] = &unk_2645BD6A0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(watchdogQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__SiriPresentationViewController_stopAnimationDismissalWatchdogTimerIfNeededThen_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_updateLanguageCode
{
  id v2 = [(SiriPresentationViewController *)self _language];
  id v3 = [v2 spokenLanguageCode];

  MEMORY[0x223C874C0](v3);
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(SiriPresentationViewController *)self view];
  [v3 bounds];
  if (CGRectEqualToRect(v21, *MEMORY[0x263F001A8]))
  {
    [(SiriPresentationViewController *)self hostedPresentationFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    id v12 = [(SiriPresentationViewController *)self view];
    [v12 bounds];
    double v5 = v13;
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    uint64_t v17 = [(SiriPresentationViewController *)self siriViewController];
    objc_msgSend(v17, "setHostedPresentationFrame:", v5, v7, v9, v11);

    id v19 = [(SiriPresentationViewController *)self siriViewController];
    id v18 = [v19 view];
    objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(SiriPresentationOptions *)self->_currentPresentationOptions requestSource] == 53) {
    return 2;
  }
  siriViewController = self->_siriViewController;
  if (!siriViewController)
  {
    if (SiriUIDeviceIsZoomed() & 1) == 0 && (SiriUIIsAllOrientationsSupported()) {
      return 30;
    }
    return 2;
  }
  int64_t currentViewMode = self->_currentViewMode;
  BOOL v7 = currentViewMode == 8 || currentViewMode == 4;
  if (currentViewMode == 4 || currentViewMode == 8) {
    unint64_t v3 = 2;
  }
  else {
    unint64_t v3 = [(AFUISiriViewController *)siriViewController supportedInterfaceOrientations];
  }
  double v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v10 = @"NO";
    if (v7) {
      double v10 = @"YES";
    }
    int v11 = 136315394;
    id v12 = "-[SiriPresentationViewController supportedInterfaceOrientations]";
    __int16 v13 = 2112;
    double v14 = v10;
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Forcing portrait mode for Siri EyesFree: %@", (uint8_t *)&v11, 0x16u);
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return MEMORY[0x270F72808](self, a2);
}

- (BOOL)_shouldAllowResizingBetweenModesForViewMode:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1B0u >> a3);
}

- (void)_setupPongTimer
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[SiriPresentationViewController _setupPongTimer]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  double v4 = (void *)MEMORY[0x263EFFA20];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SiriPresentationViewController__setupPongTimer__block_invoke;
  v8[3] = &unk_2645BD6C8;
  objc_copyWeak(&v9, (id *)buf);
  double v5 = [v4 timerWithTimeInterval:0 repeats:v8 block:1.0];
  double v6 = [(SiriPresentationViewController *)self pongTimer];
  [v6 invalidate];

  [(SiriPresentationViewController *)self setPongTimer:v5];
  BOOL v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v7 addTimer:v5 forMode:*MEMORY[0x263EFF588]];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __49__SiriPresentationViewController__setupPongTimer__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _shouldKeepPonging];

  double v4 = *MEMORY[0x263F28348];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      double v6 = v4;
      id v7 = objc_loadWeakRetained(v1);
      double v8 = [v7 connection];
      id v9 = objc_loadWeakRetained(v1);
      double v10 = [v9 connection];
      int v11 = [v10 remoteTarget];
      int v16 = 136315650;
      uint64_t v17 = "-[SiriPresentationViewController _setupPongTimer]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      CGRect v21 = v11;
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #pingpong sending pong and waiting for ping - connection: %@ | remoteTarget: %@", (uint8_t *)&v16, 0x20u);
    }
    id v12 = objc_loadWeakRetained(v1);
    __int16 v13 = [v12 connection];
    double v14 = [v13 remoteTarget];
    [v14 pong];

    id v15 = objc_loadWeakRetained(v1);
    [v15 _waitForPing];
  }
  else if (v5)
  {
    int v16 = 136315138;
    uint64_t v17 = "-[SiriPresentationViewController _setupPongTimer]_block_invoke";
    _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong tried to send pong but _shouldKeepPonging == NO", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_waitForPing
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v10 = "-[SiriPresentationViewController _waitForPing]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  double v4 = (void *)MEMORY[0x263EFFA20];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __46__SiriPresentationViewController__waitForPing__block_invoke;
  v7[3] = &unk_2645BD6C8;
  objc_copyWeak(&v8, (id *)buf);
  BOOL v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:2.0];
  double v6 = [(SiriPresentationViewController *)self pongTimer];
  [v6 invalidate];

  [(SiriPresentationViewController *)self setPongTimer:v5];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __46__SiriPresentationViewController__waitForPing__block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __46__SiriPresentationViewController__waitForPing__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  double v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  v15[0] = @"SiriPresentationViewController expected ping from SiriActivationService but timed out.";
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v12 = [v10 errorWithDomain:@"com.apple.siri.activation" code:4 userInfo:v11];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissDueToUnexpectedError:v12];
}

- (void)_teardownPongTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[SiriPresentationViewController _teardownPongTimer]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __52__SiriPresentationViewController__teardownPongTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SiriPresentationViewController _teardownPongTimer]_block_invoke";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s #pingpong on main thread", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained pongTimer];
  [v5 invalidate];

  id v6 = objc_loadWeakRetained(v3);
  [v6 setPongTimer:0];
}

- (BOOL)_shouldKeepPonging
{
  if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    uint64_t v3 = [(SiriPresentationViewController *)self siriViewController];
    char v4 = [v3 isVisible];
  }
  else
  {
    char v4 = 0;
  }
  if (self->_currentViewMode) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [(SiriPresentationViewController *)self siriViewControllerConfigured];
  }
  id v6 = [(SiriPresentationViewController *)self siriSetupNavigationController];

  if (self->_currentViewMode == 5
    && [(SiriPresentationViewController *)self siriViewControllerConfigured])
  {
    int v7 = [(SiriPresentationViewController *)self siriViewController];
    int v8 = [v7 isVisible] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  char v9 = v4 | v5;
  if (v6) {
    char v9 = 1;
  }
  return v9 | v8;
}

- (id)_foregroundAppInfosForUIPresentationIdentifier:(id)a3
{
  int64_t v4 = [(SiriPresentationViewController *)self _presentationIdentifierFromUIPresentationIdentifier:a3];
  BOOL v5 = [(SiriPresentationViewController *)self applicationStateHelper];
  id v6 = v5;
  if (v4 == 2) {
    [v5 foregroundAppInfosForCarPlay];
  }
  else {
  int v7 = [v5 foregroundAppInfos];
  }

  return v7;
}

- (int64_t)_presentationIdentifierFromUIPresentationIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.siri.EyesFree"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.siri.BluetoothCar"] & 1) != 0)
  {
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"com.apple.siri.CarDisplay"])
  {
LABEL_4:
    int64_t v4 = 2;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.siri.UIFree"]) {
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"com.apple.siri.SiriTVPresentation"])
  {
    int64_t v4 = 4;
    goto LABEL_11;
  }
  if (([v3 isEqualToString:@"com.apple.siri.Compact"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.siri.SystemAssistantExperience"] & 1) != 0)
  {
LABEL_10:
    int64_t v4 = 1;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.siri.CarDisplay.UIFree"]) {
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[SiriPresentationViewController _presentationIdentifierFromUIPresentationIdentifier:]();
  }
  int64_t v4 = 0;
LABEL_11:

  return v4;
}

- (void)presentationStateProvider:(id)a3 presentationStateDidChange:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    double v10 = "-[SiriPresentationViewController presentationStateProvider:presentationStateDidChange:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  int v7 = [(SiriPresentationViewController *)self connection];
  int v8 = [v7 remoteTarget];
  [v8 didUpdatePresentationState:v5];
}

- (void)setPresentationState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t presentationState = self->_presentationState;
  if (presentationState != a3)
  {
    self->_int64_t presentationState = a3;
    id v5 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      int v7 = SiriUIPresentationStateGetName();
      int v8 = SiriUIPresentationStateGetName();
      int v10 = 136315650;
      __int16 v11 = "-[SiriPresentationViewController setPresentationState:]";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation updating presentation state from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    if ([(SiriPresentationViewController *)self siriViewControllerConfigured])
    {
      int v9 = [(SiriPresentationViewController *)self siriViewController];
      [v9 presentationStateUpdatedFromPresentationState:presentationState toPresentationState:self->_presentationState];
    }
  }
}

- (void)_failedToPresentSiriWithError:(id)a3
{
  id v8 = a3;
  int64_t v4 = [(SiriPresentationViewController *)self connection];
  id v5 = [v4 remoteTarget];
  id v6 = v5;
  if (v8)
  {
    [v5 failedToPresentSiriWithError:v8];
  }
  else
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.siri.activation" code:1 userInfo:&unk_26D3AF568];
    [v6 failedToPresentSiriWithError:v7];
  }
}

- (id)_createPatternFromAHAP:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 URLForResource:v3 withExtension:@"ahap"];

  if (v5)
  {
    id v19 = 0;
    id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:0 error:&v19];
    id v7 = v19;
    if (v7)
    {
      id v8 = v7;
      int v9 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        CGRect v21 = "-[SiriPresentationViewController _createPatternFromAHAP:]";
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s Error reading pattern file: %@", buf, 0x16u);
      }
      int v10 = 0;
      goto LABEL_19;
    }
    id v18 = 0;
    __int16 v12 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v18];
    id v13 = v18;
    if (v13)
    {
      id v8 = v13;
      __int16 v14 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        CGRect v21 = "-[SiriPresentationViewController _createPatternFromAHAP:]";
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s Error parsing JSON data: %@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = 0;
        int v10 = (void *)[objc_alloc(MEMORY[0x263F005A8]) initWithDictionary:v12 error:&v17];
        id v8 = v17;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      id v15 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        CGRect v21 = "-[SiriPresentationViewController _createPatternFromAHAP:]";
        _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s Error creating haptic pattern returning nil", buf, 0xCu);
      }
      id v8 = 0;
    }
    int v10 = 0;
    goto LABEL_18;
  }
  __int16 v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    CGRect v21 = "-[SiriPresentationViewController _createPatternFromAHAP:]";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s Pattern file not found: %@", buf, 0x16u);
  }
  int v10 = 0;
LABEL_20:

  return v10;
}

- (void)_setupTamaleHaptic
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s Failed to start playing haptic for Tamale request: %@", v2, v3, v4, v5, 2u);
}

uint64_t __52__SiriPresentationViewController__setupTamaleHaptic__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  if (v2 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __52__SiriPresentationViewController__setupTamaleHaptic__block_invoke_cold_2();
  }
  uint64_t v4 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
    __52__SiriPresentationViewController__setupTamaleHaptic__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 1;
}

- (void)_playTamaleHaptic
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(SiriPresentationViewController *)self _setupTamaleHaptic];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[SiriPresentationViewController _playTamaleHaptic]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s Tamale Starting haptic playback", buf, 0xCu);
  }
  hapticPlayer = self->hapticPlayer;
  uint64_t v5 = 0;
  [(CHHapticPatternPlayer *)hapticPlayer startAtTime:&v5 error:0.0];
}

+ (id)_applicationStateHelper
{
  id v2 = objc_alloc_init(MEMORY[0x263F75408]);
  return v2;
}

- (SiriPresentationControllerDelegate)siriPresentationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->siriPresentationControllerDelegate);
  return (SiriPresentationControllerDelegate *)WeakRetained;
}

- (void)setSiriPresentationControllerDelegate:(id)a3
{
}

- (SASUIDeviceScreenEngagementController)_deviceScreenEngagementController
{
  return self->_deviceScreenEngagementController;
}

- (void)_setDeviceScreenEngagementController:(id)a3
{
}

- (NSMutableDictionary)deviceEngagementTimeStamps
{
  return self->_deviceEngagementTimeStamps;
}

- (void)setDeviceEngagementTimeStamps:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CGRect)hostedPresentationFrame
{
  double x = self->_hostedPresentationFrame.origin.x;
  double y = self->_hostedPresentationFrame.origin.y;
  double width = self->_hostedPresentationFrame.size.width;
  double height = self->_hostedPresentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHostedPresentationFrame:(CGRect)a3
{
  self->_hostedPresentationFrame = a3;
}

- (AFConnection)unownedConnection
{
  return self->_unownedConnection;
}

- (void)setUnownedConnection:(id)a3
{
}

- (NSDate)_lastAppUpdateTimestamp
{
  return self->_lastAppUpdateTimestamp;
}

- (void)_setLastAppUpdateTimestamp:(id)a3
{
}

- (BOOL)_isSpringBoardIdleTimerDisabled
{
  return self->_springBoardIdleTimerDisabled;
}

- (BOOL)_isWaitingForTelephonyToStart
{
  return self->_waitingForTelephonyToStart;
}

- (BOOL)_startGuidedAccessOnDismissal
{
  return self->_startGuidedAccessOnDismissal;
}

- (void)_setStartGuidedAccessOnDismissal:(BOOL)a3
{
  self->_startGuidedAccessOnDismissal = a3;
}

- (BOOL)_wasScreenOffDuringActivation
{
  return self->_wasScreenOffDuringActivation;
}

- (BOOL)_isVoiceActivationMaskShown
{
  return self->_isVoiceActivationMaskShown;
}

- (void)_setVoiceActivationMaskShown:(BOOL)a3
{
  self->_isVoiceActivationMaskShown = a3;
}

- (BOOL)_buttonDownEventDidOccur
{
  return self->_buttonDownEventDidOccur;
}

- (void)_setButtonDownEventDidOccur:(BOOL)a3
{
  self->_buttonDownEventDidOccur = a3;
}

- (double)_buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)_setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (NSTimer)_carSiriButtonHoldToTalkTimer
{
  return self->_carSiriButtonHoldToTalkTimer;
}

- (void)_setCarSiriButtonHoldToTalkTimer:(id)a3
{
}

- (double)_carSiriButtonTimeInterval
{
  return self->_carSiriButtonTimeInterval;
}

- (void)_setCarSiriButtonTimeInterval:(double)a3
{
  self->_carSiriButtonTimeInterval = a3;
}

- (BOOL)_shouldDeferWake
{
  return self->_shouldDeferWake;
}

- (void)_setShouldDeferWake:(BOOL)a3
{
  self->_shouldDeferWake = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
}

- (NSArray)starkAppBundleIdentifierContext
{
  return self->_starkAppBundleIdentifierContext;
}

- (void)setStarkAppBundleIdentifierContext:(id)a3
{
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (unint64_t)currentLockState
{
  return self->_currentLockState;
}

- (AFWatchdogTimer)animationDismissalTimer
{
  return self->_animationDismissalTimer;
}

- (void)setAnimationDismissalTimer:(id)a3
{
}

- (AFUISiriLanguage)_language
{
  return self->_language;
}

- (SiriPresentationIntentUsageDelegate)intentUsageDelegate
{
  return self->_intentUsageDelegate;
}

- (void)setIntentUsageDelegate:(id)a3
{
}

- (NSTimer)clearSiriViewControllerTimer
{
  return self->_clearSiriViewControllerTimer;
}

- (void)setClearSiriViewControllerTimer:(id)a3
{
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (void)setCurrentViewMode:(int64_t)a3
{
  self->_int64_t currentViewMode = a3;
}

- (NSTimer)pongTimer
{
  return self->_pongTimer;
}

- (void)setPongTimer:(id)a3
{
}

- (SUICApplicationStateHelper)applicationStateHelper
{
  return self->_applicationStateHelper;
}

- (void)setApplicationStateHelper:(id)a3
{
}

- (SiriPresentationStateProvider)presentationStateProvider
{
  return self->_presentationStateProvider;
}

- (void)setPresentationStateProvider:(id)a3
{
}

- (SiriPresentationOptions)currentPresentationOptions
{
  return self->_currentPresentationOptions;
}

- (SRUIFTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (SASHeadphonesAuthenticationManager)headphonesAuthenticationManager
{
  return self->_headphonesAuthenticationManager;
}

- (void)setHeadphonesAuthenticationManager:(id)a3
{
}

- (SBSHardwareButtonSystemGlowStyleControlling)hintGlowAssertion
{
  return self->_hintGlowAssertion;
}

- (void)setHintGlowAssertion:(id)a3
{
}

- (int64_t)currentGlowState
{
  return self->_currentGlowState;
}

- (void)setCurrentGlowState:(int64_t)a3
{
  self->_currentGlowState = a3;
}

- (BSInvalidatable)edgeLightWindowLevelInvalidable
{
  return self->_edgeLightWindowLevelInvalidable;
}

- (void)setEdgeLightWindowLevelInvalidable:(id)a3
{
}

- (BOOL)siriSetupViewControllerPresented
{
  return self->_siriSetupViewControllerPresented;
}

- (void)setSiriSetupViewControllerPresented:(BOOL)a3
{
  self->_siriSetupViewControllerPresented = a3;
}

- (void)setSiriViewController:(id)a3
{
}

- (AFUISiriSetupViewController)siriSetupViewController
{
  return self->_siriSetupViewController;
}

- (void)setSiriSetupViewController:(id)a3
{
}

- (void)setSiriEffectsViewController:(id)a3
{
}

- (UINavigationController)siriSetupNavigationController
{
  return self->_siriSetupNavigationController;
}

- (void)setSiriSetupNavigationController:(id)a3
{
}

- (NSArray)contextAppInfosForSiriViewController
{
  return self->_contextAppInfosForSiriViewController;
}

- (void)setContextAppInfosForSiriViewController:(id)a3
{
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (AFQueue)_testInputQueue
{
  return self->_testInputQueue;
}

- (void)setTestInputQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testInputQueue, 0);
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, 0);
  objc_storeStrong((id *)&self->_siriSetupNavigationController, 0);
  objc_storeStrong((id *)&self->_siriEffectsViewController, 0);
  objc_storeStrong((id *)&self->_siriSetupViewController, 0);
  objc_storeStrong((id *)&self->_siriViewController, 0);
  objc_storeStrong((id *)&self->_edgeLightWindowLevelInvalidable, 0);
  objc_storeStrong((id *)&self->_hintGlowAssertion, 0);
  objc_storeStrong((id *)&self->_headphonesAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_currentPresentationOptions, 0);
  objc_storeStrong((id *)&self->_presentationStateProvider, 0);
  objc_storeStrong((id *)&self->_applicationStateHelper, 0);
  objc_storeStrong((id *)&self->_pongTimer, 0);
  objc_storeStrong((id *)&self->_clearSiriViewControllerTimer, 0);
  objc_storeStrong((id *)&self->_intentUsageDelegate, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_animationDismissalTimer, 0);
  objc_storeStrong((id *)&self->_starkAppBundleIdentifierContext, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_carSiriButtonHoldToTalkTimer, 0);
  objc_storeStrong((id *)&self->_lastAppUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_unownedConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_deviceEngagementTimeStamps, 0);
  objc_storeStrong((id *)&self->_deviceScreenEngagementController, 0);
  objc_destroyWeak((id *)&self->siriPresentationControllerDelegate);
  objc_storeStrong((id *)&self->hapticPlayer, 0);
  objc_storeStrong((id *)&self->hapticPattern, 0);
  objc_storeStrong((id *)&self->hapticEngine, 0);
  objc_storeStrong((id *)&self->_cachedSceneHostedView, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
  objc_storeStrong(&self->_buttonTrigger, 0);
  objc_storeStrong((id *)&self->_activeTCCs, 0);
  objc_storeStrong((id *)&self->_activeScreen, 0);
  objc_storeStrong((id *)&self->_completionOptions, 0);
  objc_storeStrong((id *)&self->_lastGuideCheck, 0);
  attemptedAppLaunchIdentifier = self->_instrumentationDismissalState.attemptedAppLaunchIdentifier;
}

+ (id)extractTestingInputsFromContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v3 objectForKey:*MEMORY[0x263F6C7E0]];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F6C748]);
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke;
        v34[3] = &unk_2645BCE70;
        v34[4] = v9;
        uint64_t v11 = (void *)[v10 initWithBuilder:v34];
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }
  __int16 v12 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x263F6C7C0], a1);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        id v18 = objc_alloc(MEMORY[0x263F6C748]);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke_2;
        v29[3] = &unk_2645BCE70;
        v29[4] = v17;
        id v19 = (void *)[v18 initWithBuilder:v29];
        [v4 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }
  uint64_t v20 = *MEMORY[0x263F6C7C8];
  CGRect v21 = [v3 objectForKey:*MEMORY[0x263F6C7C8]];

  if (v21)
  {
    __int16 v22 = [v3 objectForKey:v20];
    id v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F6C7D8]];
    uint64_t v24 = [v22 objectForKeyedSubscript:*MEMORY[0x263F6C7D0]];
    [v27 _failTestWithName:v23 andFailure:v24];
  }
  return v4;
}

void __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setType:1];
}

void __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSURL;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v2 fileURLWithPath:v3];
  [v5 setRecordedSpeechURL:v4];

  [v5 setType:2];
}

- (void)_processIncomingRequestOptionsForTestingPayload:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 testingContext];

  if (v5)
  {
    [(SiriPresentationViewController *)self _clearAllTestingInputs];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = objc_msgSend(v4, "testingContext", 0);
    uint64_t v7 = +[SiriPresentationViewController extractTestingInputsFromContext:v6];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(SiriPresentationViewController *)self _enqueueTestInput:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_clearAllTestingInputs
{
  id v3 = [(SiriPresentationViewController *)self _testInputQueue];
  id v2 = (id)[v3 dequeueAllObjects];
}

- (void)_enqueueTestInput:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriPresentationViewController *)self _testInputQueue];
  [v5 enqueueObject:v4];
}

- (BOOL)_hasTestingInput
{
  id v2 = [(SiriPresentationViewController *)self _testInputQueue];
  id v3 = [v2 frontObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_dequeueTestingInput
{
  id v2 = [(SiriPresentationViewController *)self _testInputQueue];
  id v3 = [v2 dequeueObject];

  return v3;
}

- (void)_runSyntheticButtonActivationTest
{
  id v2 = objc_alloc_init(SASHIDGenerator);
  if (MGGetSInt32Answer() == 2) {
    [(SASHIDGenerator *)v2 sendHoldLockButtonHIDEvents];
  }
  else {
    [(SASHIDGenerator *)v2 sendHoldHomeButtonHIDEvents];
  }
}

- (void)_startUIRequestWithText:(id)a3 testName:(id)a4
{
  BOOL v4 = (objc_class *)MEMORY[0x263F285E0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 startUIRequest:v5];

  [v6 barrier];
}

+ (void)_failTestWithName:(id)a3 andFailure:(id)a4
{
}

- (void)_removePreviousConversationIfNeededWithTestName:(id)a3 testOptions:(id)a4
{
  BOOL v4 = [a4 objectForKeyedSubscript:@"keepPreviousConversation"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F284B0]);
    [v6 removeConversationWithIdentifier:*MEMORY[0x263F287F8] completionBlock:0];
  }
}

- (void)_removePreviousInjectAudioSettings
{
}

- (void)_enableAudioInjection:(BOOL)a3 audioFiles:(id)a4
{
  BOOL v4 = a3;
  id value = a4;
  CFPreferencesSetAppValue(@"Audio Injection Enabled", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.voicetrigger");
  CFPreferencesSetAppValue(@"Audio Injection File Path", value, @"com.apple.voicetrigger");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_93_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)siriEffectsViewController
{
}

- (void)didPresentLocationTCC:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_4() debugDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_221664000, v4, v5, "%s #location Location TCC presented: %@", v6, v7, v8, v9, 2u);
}

- (void)didDismissLocationTCC:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_4() debugDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_221664000, v4, v5, "%s #location Location TCC dismissed: %@", v6, v7, v8, v9, 2u);
}

- (void)_activeTCCHasContentAtPoint:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = @"was not";
  uint64_t v5 = "-[SiriPresentationViewController _activeTCCHasContentAtPoint:]";
  int v4 = 136315650;
  if (a1) {
    id v3 = @"was";
  }
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_221664000, log, OS_LOG_TYPE_DEBUG, "%s #location hit testing %lu alerts - touch %@ in content.", (uint8_t *)&v4, 0x20u);
}

void __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s SiriPresentationViewController Failed to dismiss Siri effects VC with error: %@", v2, v3, v4, v5, 2u);
}

void __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [WeakRetained _deviceScreenEngagementController];
  v9[0] = 136315650;
  OUTLINED_FUNCTION_7();
  __int16 v10 = v8;
  uint64_t v11 = a3;
  _os_log_error_impl(&dword_221664000, v5, OS_LOG_TYPE_ERROR, "%s #userAttention Failed to start device screen engagement: %{public}@, error: %{public}@", (uint8_t *)v9, 0x20u);
}

- (void)_shouldProceedPresentingSiriViewController
{
}

- (void)_prepareSiriViewControllerWithRequestOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_viewModeForRequestOptions:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s #activation unknown presentationIdentifier %@", v2, v3, v4, v5, 2u);
}

- (void)_presentationDismissalRequestedWithOptions:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentationDismissalRequestedWithOptions:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentationDismissalRequestedWithOptions:withCompletion:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)_cancelPendingActivationWithReason:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)siriViewController
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_4() callStackSymbols];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_221664000, v4, v5, "%s #activation Attempting to use siriViewController, but one does not exist. Backtrace: %@", v6, v7, v8, v9, 2u);
}

- (void)_dismissDueToUnexpectedError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s #activation Siri encountered an unexpected error; dismissing Siri: %{public}@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)_viewHostingInstrumentationHandler
{
}

- (void)_logSignatureWithType:subType:context:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s Reporting Automatic Bug Capture of type - %@", v2, v3, v4, v5, 2u);
}

- (void)_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:(uint64_t)a3 shouldTurnScreenOff:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__SiriPresentationViewController__waitForPing__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentationIdentifierFromUIPresentationIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s Unhandled presentation identifier: %@", v2, v3, v4, v5, 2u);
}

- (void)_createPatternFromAHAP:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    uint64_t v4 = "-[SiriPresentationViewController _createPatternFromAHAP:]";
    __int16 v5 = 2112;
    id v6 = v1;
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s Error creating haptic pattern: %@", (uint8_t *)&v3, 0x16u);
  }

  objc_end_catch();
}

void __52__SiriPresentationViewController__setupTamaleHaptic__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__SiriPresentationViewController__setupTamaleHaptic__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_221664000, v0, v1, "%s Tamale Haptic playback stopped with error: %@", v2, v3, v4, v5, 2u);
}

@end