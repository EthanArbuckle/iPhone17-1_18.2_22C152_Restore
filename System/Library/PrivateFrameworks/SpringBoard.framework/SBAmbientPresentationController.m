@interface SBAmbientPresentationController
- (AMUIWidgetHostManager)widgetHostManager;
- (BOOL)_evaluatePresentationState;
- (BOOL)_evaluatePresentationStateIgnoreLockState:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)_isAmbientAlwaysOnUserSettingEnabled;
- (BOOL)_isAmbientModeUserSettingEnabled;
- (BOOL)_isAmbientPresentationAllowedIgnoreLockState:(BOOL)a3;
- (BOOL)_isBumpToWakeUserSettingEnabled;
- (BOOL)_isConnectedChargerInternalWirelessWithFamilyCode:(int)a3;
- (BOOL)_isCoverSheetPresentedByUserGesture;
- (BOOL)_isMotionToWakePermitted;
- (BOOL)_isMotionToWakeUserSettingEnabled;
- (BOOL)_isNightModeSettingMandatory;
- (BOOL)_isNightModeUserSettingEffectivelyEnabled;
- (BOOL)_isNightModeUserSettingEnabled;
- (BOOL)_isRedModeTriggered;
- (BOOL)_shouldSuppressForSleep;
- (BOOL)ambientTransientOverlayIsShowingPasscode;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isAlwaysOnPolicyActive;
- (BOOL)isPresentationRequested;
- (BOOL)isPresented;
- (BOOL)notificationsPreviewOnTapOnly;
- (BOOL)presentIfAllowedAndLockWithCompletion:(id)a3;
- (BOOL)suppressNotificationPresentation;
- (BOOL)wakeToContentForWakeDestination:(id)a3 unlockSource:(int)a4;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSArray)defaultWidgetStacks;
- (NSString)analyticsPolicyName;
- (NSString)coverSheetIdentifier;
- (SBAmbientPresentationController)initWithWindowScene:(id)a3;
- (SBWakeDestinationHandling)wakeDestinationHandler;
- (SBWindowScene)windowScene;
- (id)_connectedChargerIdentifier;
- (id)_connectedWirelessChargerIdentifierForAdapterDetails:(id)a3;
- (id)_fetchConnectedWirelessChargerIdentifier;
- (id)_fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails;
- (id)_widgetDescriptorsForATXStack:(id)a3;
- (id)ambientDefaultsForAmbientTransientOverlayViewController:(id)a3;
- (id)analyticsPolicyValue;
- (id)timeIntervalsWithReasonsForScheduledTimersForAmbientScheduledAlarmObserver:(id)a3;
- (id)widgetHostManagerForAmbientTransientOverlayViewController:(id)a3;
- (int64_t)_effectiveAlwaysOnMode;
- (int64_t)ambientDisplayStyle;
- (int64_t)participantState;
- (void)_carPlayPresentationDidChange:(id)a3;
- (void)_clearUpcomingAlarmSuppressionsIfNecessary;
- (void)_dismissAllOtherAmbientTransientOverlays;
- (void)_displayTransientLockElementIfNecessaryForKeyBagState:(id)a3;
- (void)_evaluateAuthenticationIdleTimerEnablement;
- (void)_evaluateBumpToWakeEnablement;
- (void)_evaluateIdleTimerDisablement;
- (void)_evaluateIdleTimerEnablement;
- (void)_evaluateRedModeTriggerDetectionState;
- (void)_evaluateTriggerDetectionState;
- (void)_evaluateTriggerDetectionStateIgnoreLockState:(BOOL)a3;
- (void)_fetchDefaultWidgetStacks;
- (void)_hideLockElement;
- (void)_invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded;
- (void)_lockStateDidChange:(id)a3;
- (void)_observeAmbientUserSettingChanges;
- (void)_presentLockUIAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_resetTransientLockSuppressionFlag;
- (void)_setAmbientDisplayStyle:(int64_t)a3;
- (void)_setAmbientDisplayStyle:(int64_t)a3 forReason:(id)a4;
- (void)_setAmbientTransientOverlayIsShowingPasscode:(BOOL)a3;
- (void)_setCoverSheetPresentedByUserGesture:(BOOL)a3;
- (void)_setPresented:(BOOL)a3;
- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4;
- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)_setSystemApertureProudLockElementHidden:(BOOL)a3;
- (void)_setupStateCaptureBlock;
- (void)_updateAmbientMountState:(int64_t)a3 withReason:(id)a4;
- (void)_updateAmbientTriggerState:(int64_t)a3 analogousTriggerEvents:(BOOL)a4 withReason:(id)a5;
- (void)_updateMotionDetection;
- (void)_updatePosterBoardWithChargerIdentifier:(id)a3;
- (void)_updatePresentationPossibleForMountState:(int64_t)a3;
- (void)_updateScheduledAlarmObserverForPresentationRequested:(BOOL)a3;
- (void)_updateSleepSuppression;
- (void)_updateTelemetryIsPresented:(BOOL)a3;
- (void)_updateTraitsArbiterParticipantForPresented:(BOOL)a3;
- (void)_updateViewObstructedSuppressionManager;
- (void)addObserver:(id)a3;
- (void)ambientIdleTimerController:(id)a3 didChangeIdleTimerBehavior:(id)a4;
- (void)ambientIdleTimerControllerSuppressionDidEnd:(id)a3;
- (void)ambientPresentationManager:(id)a3 didUpdateMountState:(int64_t)a4;
- (void)ambientPresentationManager:(id)a3 didUpdateTriggerState:(int64_t)a4 analogousTriggerEvents:(BOOL)a5;
- (void)ambientTransientOverlayViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4;
- (void)ambientTransientOverlayViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5;
- (void)ambientTransientOverlayViewController:(id)a3 viewDidDisappear:(BOOL)a4;
- (void)ambientTransientOverlayViewControllerRequestsDismissal:(id)a3;
- (void)ambientTransientOverlayViewControllerWillBeginConfiguration:(id)a3;
- (void)ambientTransientOverlayViewControllerWillEndConfiguration:(id)a3;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)dealloc;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)liftToWakeController:(id)a3 didIgnoreTransition:(int64_t)a4;
- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5;
- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)redModeTriggerManager:(id)a3 didUpdateRedModeTriggeredState:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)scheduledAlarmObserver:(id)a3 timerFiredForReason:(id)a4;
- (void)secureAppOfTypeDidBegin:(unint64_t)a3;
- (void)setDefaultWidgetStacks:(id)a3;
- (void)setWidgetHostManager:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)test_updateAmbientPresentationState:(int64_t)a3 withReason:(id)a4;
- (void)test_updateAmbientTriggerState:(int64_t)a3 withReason:(id)a4;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
@end

@implementation SBAmbientPresentationController

- (SBAmbientPresentationController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)SBAmbientPresentationController;
  v5 = [(SBAmbientPresentationController *)&v61 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    if (_os_feature_enabled_impl())
    {
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2) {
          goto LABEL_15;
        }
      }
      else
      {
        v7 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v8 = [v7 userInterfaceIdiom];

        if (v8 == 1) {
          goto LABEL_15;
        }
      }
      v9 = (AMAmbientDefaults *)objc_alloc_init(MEMORY[0x1E4F4A458]);
      ambientDefaults = v6->_ambientDefaults;
      v6->_ambientDefaults = v9;

      [(SBAmbientPresentationController *)v6 _observeAmbientUserSettingChanges];
      [v4 isMainDisplayWindowScene];
      IOPMUpdateDominoState();
      uint64_t v11 = +[SBAmbientDomain rootSettings];
      ambientSettings = v6->_ambientSettings;
      v6->_ambientSettings = (SBAmbientSettings *)v11;

      v13 = [[SBAmbientTelemetryEmitter alloc] initWithAmbientDefaults:v6->_ambientDefaults];
      telemetryEmitter = v6->_telemetryEmitter;
      v6->_telemetryEmitter = v13;

      v15 = (AMAmbientPresentationTriggerManager *)objc_alloc_init(MEMORY[0x1E4F4A460]);
      ambientTriggerManager = v6->_ambientTriggerManager;
      v6->_ambientTriggerManager = v15;

      [(AMAmbientPresentationTriggerManager *)v6->_ambientTriggerManager setAmbientDefaults:v6->_ambientDefaults];
      [(AMAmbientPresentationTriggerManager *)v6->_ambientTriggerManager addObserver:v6];
      v17 = (AMRedModeTriggerManager *)objc_alloc_init(MEMORY[0x1E4F4A478]);
      redModeTriggerManager = v6->_redModeTriggerManager;
      v6->_redModeTriggerManager = v17;

      [(AMRedModeTriggerManager *)v6->_redModeTriggerManager addObserver:v6];
      uint64_t v19 = +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance];
      motionDetectionWakeAttributeMonitor = v6->_motionDetectionWakeAttributeMonitor;
      v6->_motionDetectionWakeAttributeMonitor = (SBAmbientMotionDetectionWakeAttributeMonitor *)v19;

      [(SBAmbientMotionDetectionWakeAttributeMonitor *)v6->_motionDetectionWakeAttributeMonitor addObserver:v6];
      [MEMORY[0x1E4F4A488] prewarm];
      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 addObserver:v6 selector:sel__lockStateDidChange_ name:@"SBAggregateLockStateDidChangeNotification" object:0];
      [v21 addObserver:v6 selector:sel__carPlayPresentationDidChange_ name:@"SBNotificationCarPlayDestinationAvailabilityDidChange" object:0];
      [v21 addObserver:v6 selector:sel__isOnACDidChange_ name:@"SBUIACStatusChangedNotification" object:0];
      [(SBAmbientPresentationController *)v6 _evaluateTriggerDetectionState];
      uint64_t v22 = +[SBLockScreenManager sharedInstance];
      lockScreenManager = v6->_lockScreenManager;
      v6->_lockScreenManager = (SBLockScreenManager *)v22;

      uint64_t v24 = +[SBSecureAppManager sharedInstance];
      secureAppManager = v6->_secureAppManager;
      v6->_secureAppManager = (SBSecureAppManager *)v24;

      [(SBSecureAppManager *)v6->_secureAppManager addWakeDestinationProvider:v6];
      [(SBSecureAppManager *)v6->_secureAppManager addObserver:v6];
      v26 = [(id)SBApp blshService];
      v27 = [v26 platformProvider];
      uint64_t v28 = objc_opt_class();
      id v29 = v27;
      if (v28)
      {
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      id v31 = v30;

      v32 = [v31 alwaysOnPolicyCoordinator];

      [v32 addExternalPolicy:v6];
      objc_storeWeak((id *)&v6->_alwaysOnPolicyCoordinator, v32);
      if ([v4 isMainDisplayWindowScene])
      {
        v33 = [[SBAmbientMainDisplayController alloc] initWithAmbientPresentationController:v6];
        mainDisplayController = v6->_mainDisplayController;
        v6->_mainDisplayController = v33;
      }
      v35 = [[SBAmbientIdleTimerController alloc] initWithWindowScene:v4];
      ambientIdleTimerController = v6->_ambientIdleTimerController;
      v6->_ambientIdleTimerController = v35;

      [(SBAmbientIdleTimerController *)v6->_ambientIdleTimerController addObserver:v6];
      v37 = [(SBAmbientPresentationController *)v6 windowScene];
      v38 = [v37 coverSheetViewController];

      [v38 startObservingAmbientPresentationForController:v6];
      [v38 registerExternalEventHandler:v6];
      uint64_t v39 = +[SBLiftToWakeController sharedController];
      liftToWakeController = v6->_liftToWakeController;
      v6->_liftToWakeController = (SBLiftToWakeController *)v39;

      [(SBLiftToWakeController *)v6->_liftToWakeController addObserver:v6];
      uint64_t v41 = +[SBBacklightController sharedInstance];
      backlightController = v6->_backlightController;
      v6->_backlightController = (SBBacklightController *)v41;

      [(SBBacklightController *)v6->_backlightController addObserver:v6];
      v43 = objc_alloc_init(SBAmbientScheduledAlarmObserver);
      scheduledAlarmObserver = v6->_scheduledAlarmObserver;
      v6->_scheduledAlarmObserver = v43;

      [(SBAmbientScheduledAlarmObserver *)v6->_scheduledAlarmObserver setDelegate:v6];
      uint64_t v45 = +[SBPocketStateMonitor sharedInstance];
      pocketStateMonitor = v6->_pocketStateMonitor;
      v6->_pocketStateMonitor = (SBPocketStateMonitor *)v45;

      [(SBPocketStateMonitor *)v6->_pocketStateMonitor addObserver:v6];
      [(SBAmbientPresentationController *)v6 _updateMotionDetection];
      [(SBAmbientPresentationController *)v6 _updateViewObstructedSuppressionManager];
      v47 = objc_alloc_init(SBAmbientAuthenticationIdleTimer);
      authenticationIdleTimer = v6->_authenticationIdleTimer;
      v6->_authenticationIdleTimer = v47;

      v49 = (AMUIWidgetHostManager *)objc_alloc_init(MEMORY[0x1E4F4A4A0]);
      widgetHostManager = v6->_widgetHostManager;
      v6->_widgetHostManager = v49;
      v51 = v49;

      [(SBAmbientPresentationController *)v6 _setupStateCaptureBlock];
      v52 = [SBAmbientWirelessChargingIdleTimer alloc];
      v53 = [(id)SBApp screenSleepCoordinator];
      v54 = +[SBUIController sharedInstance];
      uint64_t v55 = [(SBAmbientWirelessChargingIdleTimer *)v52 initWithAmbientPresentationController:v6 screenSleepCoordinator:v53 uiController:v54];
      wirelessChargingIdleTimer = v6->_wirelessChargingIdleTimer;
      v6->_wirelessChargingIdleTimer = (SBAmbientWirelessChargingIdleTimer *)v55;

      [(SBAmbientWirelessChargingIdleTimer *)v6->_wirelessChargingIdleTimer setEnabled:1];
      v57 = [MEMORY[0x1E4FA5F80] sharedInstance];
      [v57 addObserver:v6];
      uint64_t v58 = [v57 state];
      lastKeyBagState = v6->_lastKeyBagState;
      v6->_lastKeyBagState = (SBFMobileKeyBagState *)v58;

      [(SBAmbientPresentationController *)v6 _fetchDefaultWidgetStacks];
    }
  }
LABEL_15:

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alwaysOnPolicyCoordinator);
  [WeakRetained removeExternalPolicy:self];
  [(SBAmbientIdleTimerController *)self->_ambientIdleTimerController removeObserver:self];
  [(SBAmbientMotionDetectionWakeAttributeMonitor *)self->_motionDetectionWakeAttributeMonitor removeObserver:self];
  [(AMAmbientPresentationTriggerManager *)self->_ambientTriggerManager removeObserver:self];
  [(AMRedModeTriggerManager *)self->_redModeTriggerManager removeObserver:self];
  [(SBSecureAppManager *)self->_secureAppManager removeWakeDestinationProvider:self];
  [(BSInvalidatable *)self->_bumpToWakeAssertion invalidate];
  [(BLSAssertion *)self->_enableIdleTimerAssertion invalidate];
  [(TRAParticipant *)self->_traitsArbiterParticipant invalidate];
  [(BSInvalidatable *)self->_disableIdleTimerAssertion invalidate];
  [(BSInvalidatable *)self->_systemApertureLockElementSuppressionAssertion invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBAmbientPresentationController;
  [(SBAmbientPresentationController *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isPresentationRequested
{
  return self->_presentationRequested;
}

- (BOOL)presentIfAllowedAndLockWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SBAmbientPresentationController *)self isPresented])
  {
    BOOL v5 = 0;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v6 = _os_activity_create(&dword_1D85BA000, "presentIfAllowedAndLockWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Requesting ambient presentation on device lock", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBAmbientPresentationController_presentIfAllowedAndLockWithCompletion___block_invoke;
  v10[3] = &unk_1E6B032F8;
  id v8 = v6;
  uint64_t v11 = v8;
  objc_copyWeak(&v13, buf);
  id v12 = v4;
  BOOL v5 = [(SBAmbientPresentationController *)self _evaluatePresentationStateIgnoreLockState:1 animated:1 withCompletion:v10];
  self->_shouldSuppressTransientLockIfKeyBagLocks = v5;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__resetTransientLockSuppressionFlag object:0];
  [(SBAmbientPresentationController *)self performSelector:sel__resetTransientLockSuppressionFlag withObject:0 afterDelay:5.0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);

  if (v4)
  {
LABEL_7:
    if (!v5) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
LABEL_9:

  return v5;
}

void __73__SBAmbientPresentationController_presentIfAllowedAndLockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v8);
  id v4 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "presentIfAllowedAndLockWithCompletion: completion called (finished: %{BOOL}u)", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (a2) {
    [WeakRetained _presentLockUIAnimated:0 withCompletion:0];
  }
  [v6 _evaluateTriggerDetectionState];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }

  os_activity_scope_leave(&v8);
}

- (BOOL)suppressNotificationPresentation
{
  if ([(AMAmbientDefaults *)self->_ambientDefaults isFirstPresentation]) {
    return 1;
  }
  else {
    return [(AMAmbientDefaults *)self->_ambientDefaults notificationsEnabled] ^ 1;
  }
}

- (BOOL)notificationsPreviewOnTapOnly
{
  return [(AMAmbientDefaults *)self->_ambientDefaults notificationsPreviewOnTapOnlyEnabled];
}

- (void)ambientPresentationManager:(id)a3 didUpdateTriggerState:(int64_t)a4 analogousTriggerEvents:(BOOL)a5
{
}

- (void)ambientPresentationManager:(id)a3 didUpdateMountState:(int64_t)a4
{
}

- (BOOL)isAlwaysOnPolicyActive
{
  return 1;
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"ambient";
}

- (id)analyticsPolicyValue
{
  return (id)[NSNumber numberWithBool:self->_disableAlwaysOnAssertion != 0];
}

- (void)redModeTriggerManager:(id)a3 didUpdateRedModeTriggeredState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Trigger manager toggling ambient red mode [ enabled : %{BOOL}d ]", (uint8_t *)v7, 8u);
  }

  [(SBAmbientPresentationController *)self _setAmbientDisplayStyle:v4 forReason:@"Red Mode Trigger"];
}

- (void)ambientTransientOverlayViewControllerRequestsDismissal:(id)a3
{
}

- (void)ambientTransientOverlayViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
  if (self->_transientOverlay == a3) {
    [(SBAmbientPresentationController *)self _setPresented:0 animated:0];
  }
}

- (void)ambientTransientOverlayViewControllerWillBeginConfiguration:(id)a3
{
  if ([(SBAmbientPresentationController *)self ambientDisplayStyle] == 1) {
    [(SBAmbientPresentationController *)self _setAmbientDisplayStyle:0 forReason:@"Configuration"];
  }
  [(SBAmbientPresentationController *)self _evaluateRedModeTriggerDetectionState];
  [(SBAmbientPresentationController *)self _evaluateAuthenticationIdleTimerEnablement];
}

- (void)ambientTransientOverlayViewControllerWillEndConfiguration:(id)a3
{
  [(SBAmbientPresentationController *)self _setAmbientDisplayStyle:[(SBAmbientPresentationController *)self _isRedModeTriggered] forReason:@"Configuration"];
  [(SBAmbientPresentationController *)self _evaluateRedModeTriggerDetectionState];
  [(SBAmbientPresentationController *)self _evaluateAuthenticationIdleTimerEnablement];
}

- (void)ambientTransientOverlayViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
}

- (id)widgetHostManagerForAmbientTransientOverlayViewController:(id)a3
{
  return self->_widgetHostManager;
}

- (id)ambientDefaultsForAmbientTransientOverlayViewController:(id)a3
{
  return self->_ambientDefaults;
}

- (void)ambientTransientOverlayViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5
{
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  [(SBAmbientPresentationController *)self _evaluateBumpToWakeEnablement];
  [(SBAmbientPresentationController *)self _evaluateAuthenticationIdleTimerEnablement];
  telemetryEmitter = self->_telemetryEmitter;
  BOOL presented = self->_presented;
  id v9 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay activeConfiguration];
  [(SBAmbientTelemetryEmitter *)telemetryEmitter logTelemetryForAmbientPresented:presented withBacklightState:a4 screenOffWithConfiguration:v9];
}

- (SBWakeDestinationHandling)wakeDestinationHandler
{
  if (self->_presentationRequested) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return (SBWakeDestinationHandling *)v2;
}

- (BOOL)wakeToContentForWakeDestination:(id)a3 unlockSource:(int)a4
{
  if (a4 == 32) {
    return 0;
  }
  [(SBAmbientPresentationController *)self _evaluatePresentationStateIgnoreLockState:0 animated:0 withCompletion:0];
  return [(SBAmbientPresentationController *)self isPresented];
}

- (void)ambientIdleTimerController:(id)a3 didChangeIdleTimerBehavior:(id)a4
{
  id v6 = a3;
  [(SBAmbientTransientOverlayViewController *)self->_transientOverlay setAmbientIdleTimerBehaviorProvider:a4];
  if ([(SBAmbientPresentationController *)self isPresented]) {
    -[SBAmbientTelemetryEmitter logTelemetryForSleepSuppressionActive:](self->_telemetryEmitter, "logTelemetryForSleepSuppressionActive:", [v6 isAmbientSuppressed]);
  }
}

- (void)ambientIdleTimerControllerSuppressionDidEnd:(id)a3
{
  if (self->_presented || self->_presentationRequested) {
    [(SBLockScreenManager *)self->_lockScreenManager requestUserAttentionScreenWakeFromSource:13 reason:@"Ambient suppression ended"];
  }
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4 = a4;
  [v4 updateOrientationPreferencesWithBlock:&__block_literal_global_357];
  [v4 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_96];
}

void __75__SBAmbientPresentationController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSupportedOrientations:24];
  [v2 setCanDetermineActiveOrientation:1];
}

uint64_t __75__SBAmbientPresentationController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:*MEMORY[0x1E4F43CF8] + 5.0];
}

- (id)timeIntervalsWithReasonsForScheduledTimersForAmbientScheduledAlarmObserver:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"SBAmbientAlarmScheduledTimerReasonRedModeOverride";
  v5[1] = @"SBAmbientAlarmScheduledTimerReasonDisplayWake";
  v6[0] = &unk_1F3348E28;
  v6[1] = &unk_1F3348E28;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)scheduledAlarmObserver:(id)a3 timerFiredForReason:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"SBAmbientAlarmScheduledTimerReasonRedModeOverride"])
  {
    id v6 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing ambient red mode for upcoming alarm", buf, 2u);
    }

    self->_suppressRedModeDisplayStyleForUpcomingAlarm = 1;
    [(SBAmbientPresentationController *)self _setAmbientDisplayStyle:0 forReason:@"Alarm"];
    [(SBAmbientPresentationController *)self _evaluateRedModeTriggerDetectionState];
  }
  else if ([v5 isEqualToString:@"SBAmbientAlarmScheduledTimerReasonDisplayWake"] {
         && [(SBAmbientSettings *)self->_ambientSettings enableSuppression])
  }
  {
    uint64_t v7 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Waking up display for upcoming alarm", v8, 2u);
    }

    self->_suppressIdleTimerForUpcomingAlarm = 1;
    [(SBAmbientPresentationController *)self _evaluateIdleTimerEnablement];
    [(SBAmbientPresentationController *)self _evaluateIdleTimerDisablement];
    if ([(SBBacklightController *)self->_backlightController shouldTurnOnScreenForBacklightSource:42])
    {
      [(SBBacklightController *)self->_backlightController setBacklightState:1 source:42];
    }
  }
}

- (void)secureAppOfTypeDidBegin:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(SBAmbientPresentationController *)self isPresented])
  {
    id v4 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = secureAppTypeName();
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing Ambient for secure app %{public}@ begin", (uint8_t *)&v6, 0xCu);
    }
    [(SBAmbientPresentationController *)self _setPresented:0 animated:1];
  }
}

- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if (!a4 || !a5) {
    [(SBAmbientPresentationController *)self _evaluatePresentationState];
  }
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  if (a4 == 4) {
    -[SBAmbientTelemetryEmitter logTelemetryForBumpEventIgnored:](self->_telemetryEmitter, "logTelemetryForBumpEventIgnored:", 0, 4, a5);
  }
}

- (void)liftToWakeController:(id)a3 didIgnoreTransition:(int64_t)a4
{
  if (a4 == 4) {
    [(SBAmbientTelemetryEmitter *)self->_telemetryEmitter logTelemetryForBumpEventIgnored:1];
  }
}

- (NSString)coverSheetIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  uint64_t v5 = 0;
  if (v4 == 9 || v4 == 25) {
    goto LABEL_5;
  }
  if (v4 == 36)
  {
    uint64_t v5 = 1;
LABEL_5:
    [(SBAmbientPresentationController *)self _setCoverSheetPresentedByUserGesture:v5];
  }
  return 0;
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

uint64_t __65__SBAmbientPresentationController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayTransientLockElementIfNecessaryForKeyBagState:*(void *)(a1 + 40)];
}

- (void)_lockStateDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 valueForKey:@"SBAggregateLockStateKey"];
  uint64_t v6 = [v5 integerValue];

  if (v6 || !self->_presentationRequested) {
    [(SBAmbientPresentationController *)self _evaluateTriggerDetectionState];
  }
  [(SBAmbientPresentationController *)self _updateViewObstructedSuppressionManager];
}

- (void)_carPlayPresentationDidChange:(id)a3
{
  if ([(SBAmbientPresentationController *)self isPresented])
  {
    id v4 = [(id)SBApp notificationDispatcher];
    int v5 = [v4 isCarDestinationActive];

    if (v5)
    {
      [(SBAmbientPresentationController *)self _evaluatePresentationState];
    }
  }
}

- (BOOL)_isAmbientPresentationAllowedIgnoreLockState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBAmbientPresentationController *)self _isAmbientModeUserSettingEnabled];
  uint64_t v6 = +[SBLockStateAggregator sharedInstance];
  uint64_t v7 = [v6 lockState];

  BOOL v9 = (v7 & 4) == 0 && v7 != 0;
  BOOL v36 = v9;
  int v10 = [(id)SBApp authenticationController];
  int v35 = [v10 hasAuthenticatedAtLeastOnceSinceBoot];

  uint64_t v11 = [(id)SBApp notificationDispatcher];
  int v34 = [v11 isCarDestinationActive];

  id v12 = +[SBUIController sharedInstanceIfExists];
  int v33 = [v12 isConnectedToWindowedAccessory];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v14 = [WeakRetained coverSheetViewController];

  if ([(SBSecureAppManager *)self->_secureAppManager hasSecureApp]) {
    int v32 = 1;
  }
  else {
    int v32 = [v14 isHostingAnApp];
  }
  v15 = +[SBSetupManager sharedInstance];
  int v31 = [v15 isInSetupMode];

  int64_t v16 = [(SBPocketStateMonitor *)self->_pocketStateMonitor pocketState];
  BOOL isViewObstructedSuppressionActive = self->_isViewObstructedSuppressionActive;
  v17 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  int v18 = [v17 hasBeenDismissedSinceKeybagLock];

  if (v18)
  {
    int v19 = [v14 isInteractingWithNotificationList];
    BOOL v20 = [(SBAmbientPresentationController *)self _isCoverSheetPresentedByUserGesture];
  }
  else
  {
    int v19 = 0;
    BOOL v20 = 0;
  }
  v21 = [v14 coverSheetSpotlightPresenter];
  int v22 = [v21 isSpotlightPresented];

  int v23 = [v14 isShowingTodayView];
  int v24 = v23;
  BOOL v25 = v5;
  if (v5)
  {
    BOOL v26 = v3;
    if (!(((v36 || v3) & v35 ^ 1 | v34 | v33 | v32) & 1 | v31 & 1 | (v16 != 0) | isViewObstructedSuppressionActive | v19 & 1 | v20))
    {
      int v27 = (v22 | v23) ^ 1;
      goto LABEL_18;
    }
  }
  else
  {
    BOOL v26 = v3;
  }
  int v27 = 0;
LABEL_18:
  uint64_t v28 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67112704;
    int v38 = v27;
    __int16 v39 = 1024;
    BOOL v40 = v25;
    __int16 v41 = 1024;
    BOOL v42 = v36;
    __int16 v43 = 1024;
    BOOL v44 = v26;
    __int16 v45 = 1024;
    int v46 = v35;
    __int16 v47 = 1024;
    int v48 = v34;
    __int16 v49 = 1024;
    int v50 = v33;
    __int16 v51 = 1024;
    int v52 = v32;
    __int16 v53 = 1024;
    int v54 = v31;
    __int16 v55 = 1024;
    BOOL v56 = v16 == 0;
    __int16 v57 = 1024;
    BOOL v58 = isViewObstructedSuppressionActive;
    __int16 v59 = 1024;
    int v60 = v19;
    __int16 v61 = 1024;
    BOOL v62 = v20;
    __int16 v63 = 1024;
    int v64 = v22;
    __int16 v65 = 1024;
    int v66 = v24;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Ambient presentation allowed = %{BOOL}d [ enabled:%{BOOL}d ; lockedButNotBlocked:%{BOOL}d ; ignoreLockState:%{BOOL"
      "}d ; unlockedSinceBoot:%{BOOL}d ; carplay:%{BOOL}d ; screenOccludingAccessory:%{BOOL}d ; hostingApp:%{BOOL}d ; isI"
      "nSetupMode:%{BOOL}d ; isOutOfPocket:%{BOOL}d ; isViewObstructed:%{BOOL}d ; listInteraction:%{BOOL}d ; pullDownCove"
      "rSheet:%{BOOL}d ; spotlight:%{BOOL}d ; todayView:%{BOOL}d ]",
      buf,
      0x5Cu);
  }

  return v27;
}

- (void)_updateAmbientTriggerState:(int64_t)a3 analogousTriggerEvents:(BOOL)a4 withReason:(id)a5
{
  BOOL v5 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = AMStringForAmbientTriggerState();
    int v11 = 138543874;
    id v12 = v10;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Updating ambient presentation trigger state to '%{public}@' with reason: '%{public}@' [ analogousTriggerEvents : %{BOOL}d ]", (uint8_t *)&v11, 0x1Cu);
  }
  self->_presentationRequested = a3 == 1;
  [(SBAmbientPresentationController *)self _evaluatePresentationState];
  [(SBAmbientPresentationController *)self _updateScheduledAlarmObserverForPresentationRequested:self->_presentationRequested];
}

- (void)_updateAmbientMountState:(int64_t)a3 withReason:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = AMStringForAmbientMountState();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Updating ambient presentation mount state to '%{public}@' with reason: '%{public}@'", (uint8_t *)&v9, 0x16u);
  }
  [(SBAmbientPresentationController *)self _updatePresentationPossibleForMountState:a3];
}

- (void)_evaluateTriggerDetectionState
{
}

- (void)_evaluateTriggerDetectionStateIgnoreLockState:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBAmbientPresentationController *)self _isAmbientPresentationAllowedIgnoreLockState:a3];
  BOOL v5 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Evaluating trigger detection state [ shouldEnable : %{BOOL}d ]", (uint8_t *)v6, 8u);
  }

  [(AMAmbientPresentationTriggerManager *)self->_ambientTriggerManager setPresentationDetectionEnabled:v4];
  [(SBAmbientPresentationController *)self _evaluateRedModeTriggerDetectionState];
}

- (void)_evaluateRedModeTriggerDetectionState
{
  if ([(AMAmbientPresentationTriggerManager *)self->_ambientTriggerManager isPresentationDetectionEnabled]&& [(SBAmbientPresentationController *)self _isNightModeUserSettingEffectivelyEnabled]&& !self->_suppressRedModeDisplayStyleForUpcomingAlarm)
  {
    transientOverlay = self->_transientOverlay;
    if (transientOverlay) {
      uint64_t v3 = [(SBAmbientTransientOverlayViewController *)transientOverlay isConfiguringUIVisible] ^ 1;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  redModeTriggerManager = self->_redModeTriggerManager;
  [(AMRedModeTriggerManager *)redModeTriggerManager setRedModeDetectionEnabled:v3];
}

- (BOOL)_evaluatePresentationState
{
  return [(SBAmbientPresentationController *)self _evaluatePresentationStateIgnoreLockState:0 animated:1 withCompletion:0];
}

- (BOOL)_evaluatePresentationStateIgnoreLockState:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = self->_presentationRequested
    && [(SBAmbientPresentationController *)self _isAmbientPresentationAllowedIgnoreLockState:v6];
  [(SBAmbientPresentationController *)self _setPresented:v9 animated:v5 withCompletion:v8];
  disableAlwaysOnAssertion = self->_disableAlwaysOnAssertion;
  if (self->_presentationRequested)
  {
    if (!disableAlwaysOnAssertion)
    {
      __int16 v11 = (void *)MEMORY[0x1E4F4F4C0];
      id v12 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
      v18[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      id v14 = [v11 acquireWithExplanation:@"ambient" observer:0 attributes:v13];
      __int16 v15 = self->_disableAlwaysOnAssertion;
      self->_disableAlwaysOnAssertion = v14;
    }
  }
  else if (disableAlwaysOnAssertion)
  {
    [(BLSAssertion *)disableAlwaysOnAssertion invalidate];
    BOOL v16 = self->_disableAlwaysOnAssertion;
    self->_disableAlwaysOnAssertion = 0;
  }
  [(SBAmbientPresentationController *)self _updateSleepSuppression];
  [(SBAmbientPresentationController *)self _evaluateBumpToWakeEnablement];
  [(SBAmbientPresentationController *)self _updateMotionDetection];
  [(SBAmbientPresentationController *)self _evaluateIdleTimerEnablement];
  [(SBAmbientPresentationController *)self _evaluateTriggerDetectionStateIgnoreLockState:v6];

  return v9;
}

- (void)_evaluateBumpToWakeEnablement
{
  if (![(SBBacklightController *)self->_backlightController screenIsOn]
    && self->_presentationRequested
    && [(SBAmbientPresentationController *)self _isBumpToWakeUserSettingEnabled])
  {
    if (self->_bumpToWakeAssertion) {
      return;
    }
    uint64_t v3 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Enabling bump-to-wake", buf, 2u);
    }

    BOOL v4 = [(SBLiftToWakeController *)self->_liftToWakeController acquireBumpToWakeEnableAssertionForReason:@"Ambient"];
    bumpToWakeAssertion = self->_bumpToWakeAssertion;
    self->_bumpToWakeAssertion = v4;
  }
  else
  {
    if (!self->_bumpToWakeAssertion) {
      return;
    }
    BOOL v6 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Disabling bump-to-wake", v7, 2u);
    }

    [(BSInvalidatable *)self->_bumpToWakeAssertion invalidate];
    bumpToWakeAssertion = self->_bumpToWakeAssertion;
    self->_bumpToWakeAssertion = 0;
  }
}

- (void)_evaluateIdleTimerEnablement
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_presentationRequested && !self->_suppressIdleTimerForUpcomingAlarm) {
    int v3 = ![(SBAmbientPresentationController *)self _isAmbientAlwaysOnUserSettingEnabled];
  }
  else {
    int v3 = 0;
  }
  BOOL v4 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL presentationRequested = self->_presentationRequested;
    BOOL suppressIdleTimerForUpcomingAlarm = self->_suppressIdleTimerForUpcomingAlarm;
    BOOL v7 = [(SBAmbientPresentationController *)self _isAmbientAlwaysOnUserSettingEnabled];
    BOOL v8 = self->_enableIdleTimerAssertion != 0;
    *(_DWORD *)buf = 67110144;
    int v17 = v3;
    __int16 v18 = 1024;
    BOOL v19 = presentationRequested;
    __int16 v20 = 1024;
    BOOL v21 = suppressIdleTimerForUpcomingAlarm;
    __int16 v22 = 1024;
    BOOL v23 = v7;
    __int16 v24 = 1024;
    BOOL v25 = v8;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Evaluating idle timer enablement - Enable = %{BOOL}d [ presentationRequested:%{BOOL}d ; suppressForAlarm:%{BOOL}d "
      "; userSetting:%{BOOL}d ; assertion=%{BOOL}d ]",
      buf,
      0x20u);
  }

  enableIdleTimerAssertion = self->_enableIdleTimerAssertion;
  if (v3)
  {
    if (enableIdleTimerAssertion) {
      return;
    }
    int v10 = (void *)MEMORY[0x1E4F4F4C0];
    __int16 v11 = [MEMORY[0x1E4F4A450] allowAmbientIdleTimer];
    __int16 v15 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    uint64_t v13 = [v10 acquireWithExplanation:@"Ambient Always-On Setting" observer:0 attributes:v12];
    id v14 = self->_enableIdleTimerAssertion;
    self->_enableIdleTimerAssertion = v13;
  }
  else
  {
    if (!enableIdleTimerAssertion) {
      return;
    }
    [(BLSAssertion *)enableIdleTimerAssertion invalidate];
    __int16 v11 = self->_enableIdleTimerAssertion;
    self->_enableIdleTimerAssertion = 0;
  }
}

- (void)_evaluateIdleTimerDisablement
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_presentationRequested
    && self->_suppressIdleTimerForUpcomingAlarm
    && [(SBAmbientSettings *)self->_ambientSettings enableSuppression];
  BOOL v4 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL presentationRequested = self->_presentationRequested;
    BOOL suppressIdleTimerForUpcomingAlarm = self->_suppressIdleTimerForUpcomingAlarm;
    BOOL v7 = [(SBAmbientSettings *)self->_ambientSettings enableSuppression];
    BOOL v8 = self->_disableIdleTimerAssertion != 0;
    v13[0] = 67110144;
    v13[1] = v3;
    __int16 v14 = 1024;
    BOOL v15 = presentationRequested;
    __int16 v16 = 1024;
    BOOL v17 = suppressIdleTimerForUpcomingAlarm;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Evaluating idle timer disablement - Disable = %{BOOL}d [ presentationRequested:%{BOOL}d ; suppressForAlarm:%{BOOL}"
      "d ; suppressionEnabled:%{BOOL}d ; assertion=%{BOOL}d ]",
      (uint8_t *)v13,
      0x20u);
  }

  disableIdleTimerAssertion = self->_disableIdleTimerAssertion;
  if (v3)
  {
    if (disableIdleTimerAssertion) {
      return;
    }
    int v10 = +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists];
    __int16 v11 = [v10 acquireIdleTimerDisableAssertionForReason:@"Ambient Suppression"];
    id v12 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = v11;
  }
  else
  {
    if (!disableIdleTimerAssertion) {
      return;
    }
    [(BSInvalidatable *)disableIdleTimerAssertion invalidate];
    int v10 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = 0;
  }
}

- (void)_evaluateAuthenticationIdleTimerEnablement
{
  BOOL v3 = [(SBAmbientPresentationController *)self isPresented];
  BOOL v4 = [(SBBacklightController *)self->_backlightController screenIsOn];
  BOOL v5 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay isConfiguringUIVisible];
  uint64_t v6 = (v3 && v4) & ((v5 | [(SBAmbientTransientOverlayViewController *)self->_transientOverlay wantsIdleTimerDisabled]) ^ 1);
  authenticationIdleTimer = self->_authenticationIdleTimer;
  [(SBAmbientAuthenticationIdleTimer *)authenticationIdleTimer setEnabled:v6];
}

- (void)_setSystemApertureProudLockElementHidden:(BOOL)a3
{
  systemApertureLockElementSuppressionAssertion = self->_systemApertureLockElementSuppressionAssertion;
  if (a3)
  {
    if (systemApertureLockElementSuppressionAssertion) {
      return;
    }
    BOOL v5 = [(SBLockScreenManager *)self->_lockScreenManager acquireSystemApertureLockElementSuppressionAssertionWithReason:@"Ambient presented"];
  }
  else
  {
    if (!systemApertureLockElementSuppressionAssertion) {
      return;
    }
    [(BSInvalidatable *)systemApertureLockElementSuppressionAssertion invalidate];
    BOOL v5 = 0;
  }
  uint64_t v6 = self->_systemApertureLockElementSuppressionAssertion;
  self->_systemApertureLockElementSuppressionAssertion = v5;
}

- (void)_displayTransientLockElementIfNecessaryForKeyBagState:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFMobileKeyBagState *)self->_lastKeyBagState isEffectivelyLocked];
  int v6 = [v4 isEffectivelyLocked];
  if ((v5 & 1) == 0 && v6 && !self->_shouldSuppressTransientLockIfKeyBagLocks)
  {
    [(SBAmbientPresentationController *)self _setSystemApertureProudLockElementHidden:0];
    if ((SBUIIsSystemApertureEnabled() & 1) == 0) {
      [(SBAmbientTransientOverlayViewController *)self->_transientOverlay displayTransientProudLock];
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideLockElement object:0];
    [(SBAmbientPresentationController *)self performSelector:sel__hideLockElement withObject:0 afterDelay:2.0];
  }
  [(SBAmbientPresentationController *)self _resetTransientLockSuppressionFlag];
  lastKeyBagState = self->_lastKeyBagState;
  self->_lastKeyBagState = (SBFMobileKeyBagState *)v4;
}

- (void)_hideLockElement
{
  if (self->_presented) {
    [(SBAmbientPresentationController *)self _setSystemApertureProudLockElementHidden:1];
  }
}

- (void)_resetTransientLockSuppressionFlag
{
  if (self->_shouldSuppressTransientLockIfKeyBagLocks) {
    self->_shouldSuppressTransientLockIfKeyBagLocks = 0;
  }
}

- (void)_updateSleepSuppression
{
  ambientIdleTimerController = self->_ambientIdleTimerController;
  BOOL v3 = self->_presentationRequested
    && [(SBAmbientPresentationController *)self _shouldSuppressForSleep];
  [(SBAmbientIdleTimerController *)ambientIdleTimerController setSuppressForSleep:v3];
}

- (void)_setPresented:(BOOL)a3
{
}

- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = (void (**)(void, void))v8;
  if (self->_presented == v6)
  {
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    unint64_t v10 = self->_presentationGeneration + 1;
    self->_presentationGeneration = v10;
    [(SBAmbientPresentationController *)self _updateTraitsArbiterParticipantForPresented:v6];
    uint64_t v11 = [(SBAmbientPresentationController *)self _connectedChargerIdentifier];
    id v12 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v67 = v6;
      __int16 v68 = 2114;
      uint64_t v69 = v11;
      __int16 v70 = 2048;
      unint64_t v71 = v10;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Setting ambient overlay BOOL presented = %{BOOL}d with chargerId = %{public}@ (generation %lu)", buf, 0x1Cu);
    }

    self->_BOOL presented = v6;
    if (v6) {
      [(SBAmbientPresentationController *)self _updatePosterBoardWithChargerIdentifier:v11];
    }
    else {
      [(SBAmbientPresentationController *)self _setAmbientTransientOverlayIsShowingPasscode:0];
    }
    BOOL v40 = (void *)v11;
    __int16 v41 = [(SBAmbientPresentationController *)self windowScene];
    if ([v41 isMainDisplayWindowScene]) {
      [(SBAmbientPresentationController *)self _setSystemApertureProudLockElementHidden:v6];
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v13 = self->_observers;
    uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v18 ambientPresentationController:self willUpdatePresented:self->_presented];
          }
        }
        uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v15);
    }

    BOOL presented = self->_presented;
    [(SBAmbientPresentationController *)self _dismissAllOtherAmbientTransientOverlays];
    if (presented)
    {
      [(SBAmbientPresentationController *)self _setAmbientDisplayStyle:[(SBAmbientPresentationController *)self _isRedModeTriggered] forReason:@"Presentation"];
      __int16 v20 = objc_alloc_init(SBAmbientTransientOverlayViewController);
      transientOverlay = self->_transientOverlay;
      self->_transientOverlay = v20;

      [(SBAmbientTransientOverlayViewController *)self->_transientOverlay setDelegate:self];
      uint64_t v22 = self->_transientOverlay;
      BOOL v23 = [(SBAmbientIdleTimerController *)self->_ambientIdleTimerController idleTimerBehaviorProvider];
      [(SBAmbientTransientOverlayViewController *)v22 setAmbientIdleTimerBehaviorProvider:v23];

      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke;
      v59[3] = &unk_1E6AF4AC0;
      v59[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v59];
      __int16 v24 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:self->_transientOverlay];
      BOOL v25 = +[SBWorkspace mainWorkspace];
      uint64_t v26 = [v41 _sbDisplayConfiguration];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2;
      v53[3] = &unk_1E6B0B9A0;
      unint64_t v57 = v10;
      BOOL v58 = a4;
      int v54 = v24;
      __int16 v55 = self;
      BOOL v56 = v9;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_6;
      v52[3] = &unk_1E6AFF3C0;
      v52[4] = self;
      v52[5] = v10;
      int v27 = v24;
      [v25 requestTransitionWithOptions:0 displayConfiguration:v26 builder:v53 validator:v52];
    }
    else
    {
      uint64_t v28 = +[SBControlCenterController sharedInstanceIfExists];
      if ([v28 isPresented]) {
        [v28 dismissAnimated:1];
      }
      [(SBAmbientPresentationController *)self _invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded];
      if (self->_transientOverlay)
      {
        id v29 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:self->_transientOverlay];
        v30 = +[SBWorkspace mainWorkspace];
        int v31 = [v41 _sbDisplayConfiguration];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_137;
        v47[3] = &unk_1E6B0B9C8;
        unint64_t v50 = v10;
        int v48 = v29;
        BOOL v51 = a4;
        __int16 v49 = v9;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5_146;
        v46[3] = &unk_1E6AFF3C0;
        v46[4] = self;
        v46[5] = v10;
        int v32 = v29;
        [v30 requestTransitionWithOptions:0 displayConfiguration:v31 builder:v47 validator:v46];
      }
      else if (v9)
      {
        v9[2](v9, 0);
      }
      int v33 = self->_transientOverlay;
      self->_transientOverlay = 0;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v34 = self->_observers;
    uint64_t v35 = [(NSHashTable *)v34 countByEnumeratingWithState:&v42 objects:v64 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          __int16 v39 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v39 ambientPresentationController:self didUpdatePresented:self->_presented];
          }
        }
        uint64_t v36 = [(NSHashTable *)v34 countByEnumeratingWithState:&v42 objects:v64 count:16];
      }
      while (v36);
    }

    [v41 isMainDisplayWindowScene];
    IOPMUpdateDominoState();
    [(SBAmbientPresentationController *)self _updateTelemetryIsPresented:self->_presented];
  }
  [(SBAmbientPresentationController *)self _evaluateAuthenticationIdleTimerEnablement];
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) view];
  [v1 layoutIfNeeded];
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", @"PresentAmbientTransientOverlay(%llu)", *(void *)(a1 + 56));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3;
  v10[3] = &unk_1E6AF6050;
  id v4 = *(id *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v4;
  uint64_t v12 = v5;
  [v3 modifyTransientOverlayContext:v10];
  [v3 modifyApplicationContext:&__block_literal_global_133_0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5;
  v8[3] = &unk_1E6AF5AA0;
  BOOL v6 = *(void **)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v6;
  id v7 = (id)[v3 addCompletionHandler:v8];
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:0];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 48)];
  objc_msgSend(v3, "setShouldDismissSiriUponPresentation:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "dismissesSiriForPresentation"));
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 136) lockScreenEnvironment];
  id v4 = [v2 passcodeViewPresenter];

  if ([v4 isPasscodeLockVisible]) {
    [v4 setPasscodeLockVisible:0 animated:0];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
}

BOOL __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 280);
  if (v2 != v1)
  {
    id v4 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 280);
      int v8 = 134218240;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Skipping superseded ambient overlay presentation (current generation %lu  request generation %lu)", (uint8_t *)&v8, 0x16u);
    }
  }
  return v2 == v1;
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_137(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", @"DismissAmbientTransientOverlay(%llu)", *(void *)(a1 + 48));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2_141;
  v7[3] = &unk_1E6AF5C58;
  id v8 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 56);
  [v3 modifyTransientOverlayContext:v7];
  [v3 modifyApplicationContext:&__block_literal_global_144];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4_145;
  v5[3] = &unk_1E6AF5A50;
  id v6 = *(id *)(a1 + 40);
  id v4 = (id)[v3 addCompletionHandler:v5];
}

void __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_2_141(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_3_142(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_4_145(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_5_146(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 280) != *(void *)(a1 + 40))
  {
    id v3 = a2;
    id v4 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 280);
      int v8 = 134218240;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Forcing superseded ambient overlay dismissal to be unanimated (current generation %lu  request generation %lu)", (uint8_t *)&v8, 0x16u);
    }

    [v3 modifyTransientOverlayContext:&__block_literal_global_149];
  }
  return 1;
}

uint64_t __73__SBAmbientPresentationController__setPresented_animated_withCompletion___block_invoke_147(uint64_t a1, void *a2)
{
  return [a2 setAnimated:0];
}

- (void)_dismissAllOtherAmbientTransientOverlays
{
  id v7 = [a2 succinctDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_fault_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_FAULT, "Found untracked transient overlay instance %@. Dismissing.", a1, 0xCu);
}

- (BOOL)_isRedModeTriggered
{
  int v3 = [(SBAmbientPresentationController *)self _isNightModeUserSettingEffectivelyEnabled];
  if (v3)
  {
    redModeTriggerManager = self->_redModeTriggerManager;
    LOBYTE(v3) = [(AMRedModeTriggerManager *)redModeTriggerManager isRedModeTriggered];
  }
  return v3;
}

- (void)_setAmbientDisplayStyle:(int64_t)a3
{
}

- (void)_setAmbientDisplayStyle:(int64_t)a3 forReason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_ambientDisplayStyle != a3)
  {
    id v7 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = AMUIAmbientDisplayStyleString();
      *(_DWORD *)buf = 138543618;
      BOOL v21 = v8;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting ambient display style to %{public}@ for reason %{public}@", buf, 0x16u);
    }
    self->_ambientDisplayStyle = a3;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = self->_observers;
    uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "ambientPresentationController:didUpdateAmbientDisplayStyle:", self, a3, (void)v15);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if ([(SBAmbientPresentationController *)self isPresented]) {
      [(SBAmbientTelemetryEmitter *)self->_telemetryEmitter logTelemetryForAmbientPresented:self->_presented displayStyle:self->_ambientDisplayStyle];
    }
  }
}

- (void)_setAmbientTransientOverlayIsShowingPasscode:(BOOL)a3
{
  if (self->_ambientTransientOverlayIsShowingPasscode != a3)
  {
    self->_ambientTransientOverlayIsShowingPasscode = a3;
    id v4 = @"Dismissed";
    if (a3) {
      id v4 = @"Presented";
    }
    id v5 = [NSString stringWithFormat:@"Ambient Passcode %@", v4];
    [(SBLockScreenManager *)self->_lockScreenManager reevaluateSystemApertureLockElementSuppressionWithReason:v5];
  }
}

- (void)_setCoverSheetPresentedByUserGesture:(BOOL)a3
{
  if (self->_coverSheetPresentedByUserGesture != a3)
  {
    self->_coverSheetPresentedByUserGesture = a3;
    [(SBAmbientPresentationController *)self _evaluatePresentationState];
  }
}

- (void)_updatePresentationPossibleForMountState:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_presentationPossible)
  {
    self->_presentationPossible = a3 == 1;
    if (!a3)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v4 = self->_observers;
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v25;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
            if (objc_opt_respondsToSelector()) {
              [v9 ambientPresentationControllerCancelledPossiblePresentation:self];
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v6);
      }
    }
  }
  else if (a3 == 1)
  {
    self->_presentationPossible = 1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = self->_observers;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 ambientPresentationControllerWillPossiblyPresent:self];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v12);
    }

    if (!self->_presentationPossibleTimeoutConfigured)
    {
      self->_presentationPossibleTimeoutConfigured = 1;
      objc_initWeak(&location, self);
      dispatch_time_t v16 = dispatch_time(0, 5000000000);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__SBAmbientPresentationController__updatePresentationPossibleForMountState___block_invoke;
      v17[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v18, &location);
      dispatch_after(v16, MEMORY[0x1E4F14428], v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __76__SBAmbientPresentationController__updatePresentationPossibleForMountState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (*((unsigned char *)WeakRetained + 96))
  {
    *((_WORD *)WeakRetained + 48) = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = WeakRetained[4];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "ambientPresentationControllerCancelledPossiblePresentation:", v2, (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)_updatePosterBoardWithChargerIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [v5 substringToIndex:7];

  uint64_t v7 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing chargerId '%@' to PosterBoard", buf, 0x16u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F92380]);
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke;
    v10[3] = &unk_1E6AFE5B8;
    long long v11 = v6;
    id v12 = v3;
    [v8 notifyActiveChargerIdentifierDidUpdate:v12 completion:v10];

    long long v9 = v11;
  }
  else
  {
    long long v9 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBAmbientPresentationController _updatePosterBoardWithChargerIdentifier:]((uint64_t)v6, v9);
    }
  }
}

void __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogAmbientPresentation();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully pushed charger update of '%@' to PosterBoard", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateMotionDetection
{
  BOOL v3 = [(SBAmbientIdleTimerController *)self->_ambientIdleTimerController isUserSleepPredicted];
  BOOL v4 = [(SBAmbientMotionDetectionWakeAttributeMonitor *)self->_motionDetectionWakeAttributeMonitor shouldEnableMotionDetectionWake];
  BOOL v5 = !self->_presentationRequested || !v3 && !v4;
  if (!v5
    && [(SBAmbientPresentationController *)self _isMotionToWakePermitted]
    && [(SBAmbientPresentationController *)self _isMotionToWakeUserSettingEnabled])
  {
    if (self->_motionToWakeEnableAssertion) {
      return;
    }
    uint64_t v6 = [(SBLockScreenManager *)self->_lockScreenManager acquireMotionDetectionWakeEnableAssertionWithReason:@"Ambient Nighttime"];
    motionToWakeEnableAssertion = self->_motionToWakeEnableAssertion;
    self->_motionToWakeEnableAssertion = v6;

    telemetryEmitter = self->_telemetryEmitter;
    BOOL v9 = self->_motionToWakeEnableAssertion != 0;
  }
  else
  {
    __int16 v10 = self->_motionToWakeEnableAssertion;
    if (!v10) {
      return;
    }
    [(BSInvalidatable *)v10 invalidate];
    uint64_t v11 = self->_motionToWakeEnableAssertion;
    self->_motionToWakeEnableAssertion = 0;

    telemetryEmitter = self->_telemetryEmitter;
    BOOL v9 = 0;
  }
  [(SBAmbientTelemetryEmitter *)telemetryEmitter logTelemetryForMotionToWakeEnabled:v9];
}

- (void)_updateTraitsArbiterParticipantForPresented:(BOOL)a3
{
  traitsArbiterParticipant = self->_traitsArbiterParticipant;
  if (a3)
  {
    if (traitsArbiterParticipant) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    BOOL v9 = [WeakRetained traitsArbiter];

    uint64_t v6 = [v9 acquireParticipantWithRole:@"SBTraitsParticipantRoleAmbient" delegate:self];
    uint64_t v7 = self->_traitsArbiterParticipant;
    self->_traitsArbiterParticipant = v6;

    [(TRAParticipant *)self->_traitsArbiterParticipant setNeedsUpdatePreferencesWithReason:@"Ambient Presented"];
    int v8 = (TRAParticipant *)v9;
  }
  else
  {
    if (!traitsArbiterParticipant) {
      return;
    }
    [(TRAParticipant *)traitsArbiterParticipant invalidate];
    int v8 = self->_traitsArbiterParticipant;
    self->_traitsArbiterParticipant = 0;
  }
}

- (void)_invalidateTransientOverlayWindowTraitsArbiterParticipantIfNeeded
{
  BOOL v3 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay viewIfLoaded];
  BOOL v4 = [v3 window];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v11 = v7;

  BOOL v8 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay isForegroundActive];
  BOOL v9 = v11;
  if (v11 && v8)
  {
    __int16 v10 = [v11 traitsParticipant];
    [v10 invalidate];

    BOOL v9 = v11;
  }
}

- (void)_updateTelemetryIsPresented:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(AMAmbientDefaults *)self->_ambientDefaults setLifetimePresentationCounter:[(AMAmbientDefaults *)self->_ambientDefaults lifetimePresentationCounter] + 1];
  }
  [(SBAmbientTelemetryEmitter *)self->_telemetryEmitter logTelemetryForAmbientPresented:self->_presented displayStyle:self->_ambientDisplayStyle];
  if (v3)
  {
    telemetryEmitter = self->_telemetryEmitter;
    id v6 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay activeConfiguration];
    uint64_t v7 = [(SBAmbientTransientOverlayViewController *)self->_transientOverlay activeConfigurationMetadata];
    [(SBAmbientTelemetryEmitter *)telemetryEmitter logTelemetryForAmbientConfigurationUpdate:v6 metadata:v7];

    BOOL v8 = self->_telemetryEmitter;
    BOOL v9 = [(SBAmbientIdleTimerController *)self->_ambientIdleTimerController isAmbientSuppressed];
    [(SBAmbientTelemetryEmitter *)v8 logTelemetryForSleepSuppressionActive:v9];
  }
}

- (void)_presentLockUIAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v14[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13[0] = @"SBUILockOptionsAnimateLockScreenActivationKey";
  uint64_t v7 = [NSNumber numberWithBool:v4];
  v14[0] = v7;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[1] = @"SBUILockOptionsPreserveTransientOverlaysKey";
  _DWORD v13[2] = @"SBUILockOptionsUseScreenOffModeKey";
  v14[2] = MEMORY[0x1E4F1CC28];
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  lockScreenManager = self->_lockScreenManager;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__SBAmbientPresentationController__presentLockUIAnimated_withCompletion___block_invoke;
  v11[3] = &unk_1E6AF5A50;
  id v12 = v6;
  id v10 = v6;
  [(SBLockScreenManager *)lockScreenManager lockUIFromSource:13 withOptions:v8 completion:v11];
}

uint64_t __73__SBAmbientPresentationController__presentLockUIAnimated_withCompletion___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_fetchDefaultWidgetStacks
{
  BOOL v3 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = self;
  [v3 performAfterFirstUnlockSinceBootUsingBlock:v4];
}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F4AF88] sharedInstance];
  BOOL v3 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Fetching ambient default stacks from proactive after first unlock", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_181;
  v4[3] = &unk_1E6B0B9F0;
  v4[4] = *(void *)(a1 + 32);
  [v2 fetchSmartStackOfVariant:3 completionHandler:v4];
}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (unint64_t)[v5 count] > 1)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    BOOL v8 = [v5 objectAtIndexedSubscript:1];
    BOOL v9 = [*(id *)(a1 + 32) _widgetDescriptorsForATXStack:v7];
    id v10 = [*(id *)(a1 + 32) _widgetDescriptorsForATXStack:v8];
    id v11 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Setting ambient default proactive stacks: Leading:%@ Trailing:%@", buf, 0x16u);
    }

    if (v9 && v10)
    {
      id v12 = *(void **)(a1 + 32);
      v14[0] = v9;
      v14[1] = v10;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      [v12 setDefaultWidgetStacks:v13];
    }
  }
  else
  {
    uint64_t v7 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_181_cold_1(v6, v7);
    }
  }
}

- (id)_widgetDescriptorsForATXStack:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 smallDefaultStack];
  id v5 = v4;
  if (!v4 || ![v4 count])
  {
    id v6 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBAmbientPresentationController _widgetDescriptorsForATXStack:]((uint64_t)v5, v6);
    }
    goto LABEL_20;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v7)
  {
LABEL_20:
    id v9 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = v7;
  __int16 v17 = v5;
  id v18 = v3;
  id v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "avocadoDescriptor", v17, v18);
      uint64_t v14 = [v13 sanitizedDescriptor];

      if (v14)
      {
        if (!v9) {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v9 addObject:v14];
      }
      else
      {
        __int16 v15 = SBLogAmbientPresentation();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v24 = v12;
          _os_log_error_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_ERROR, "Widget in proactive default stack is missing a descriptor:%@", buf, 0xCu);
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  }
  while (v8);
  id v5 = v17;
  id v3 = v18;
LABEL_21:

  return v9;
}

- (id)_connectedChargerIdentifier
{
  id v3 = +[SBUIController sharedInstance];
  BOOL v4 = [v3 connectedWirelessChargerIdentifier];

  if (!v4)
  {
    BOOL v4 = [(SBAmbientPresentationController *)self _fetchConnectedWirelessChargerIdentifier];
    if (!v4)
    {
      uint64_t v5 = [(SBAmbientPresentationController *)self _fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails];
      if (v5) {
        BOOL v4 = (__CFString *)v5;
      }
      else {
        BOOL v4 = @"DefaultChargerIdentifier";
      }
    }
  }
  id v6 = [NSString stringWithFormat:@"%@-%@", @"SBAmbientChargerId", v4];

  return v6;
}

- (id)_fetchConnectedWirelessChargerIdentifier
{
  CFDictionaryRef v3 = IOPSCopyExternalPowerAdapterDetails();
  if (v3)
  {
    BOOL v4 = [(SBAmbientPresentationController *)self _connectedWirelessChargerIdentifierForAdapterDetails:v3];
    uint64_t v5 = v4;
    if (v4) {
      id v6 = (void *)[v4 copy];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__106;
  uint64_t v14 = __Block_byref_object_dispose__106;
  id v15 = 0;
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v3);
    io_object_t v5 = MatchingService;
    if (MatchingService)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"AppleRawAdapterDetails", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __96__SBAmbientPresentationController__fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails__block_invoke;
      v9[3] = &unk_1E6B0BA18;
      v9[4] = self;
      v9[5] = &v10;
      [CFProperty enumerateObjectsUsingBlock:v9];
    }
    IOObjectRelease(v5);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __96__SBAmbientPresentationController__fetchConnectedWirelessChargerIdentifierFromRawAdapterDetails__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) _connectedWirelessChargerIdentifierForAdapterDetails:a2];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
    *a4 = 1;
  }
}

- (id)_connectedWirelessChargerIdentifierForAdapterDetails:(id)a3
{
  id v4 = a3;
  io_object_t v5 = [v4 objectForKey:@"FamilyCode"];
  if (-[SBAmbientPresentationController _isConnectedChargerInternalWirelessWithFamilyCode:](self, "_isConnectedChargerInternalWirelessWithFamilyCode:", [v5 intValue]))
  {
    id v6 = [v4 objectForKey:@"Source"];
    uint64_t v7 = v6;
    if (v6) {
      uint64_t v8 = (void *)[v6 copy];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_isConnectedChargerInternalWirelessWithFamilyCode:(int)a3
{
  return a3 == -536723450;
}

- (void)_observeAmbientUserSettingChanges
{
  v40[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  ambientDefaults = self->_ambientDefaults;
  id v4 = [NSString stringWithUTF8String:"enableAmbientMode"];
  v40[0] = v4;
  io_object_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v6 = MEMORY[0x1E4F14428];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke;
  v33[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v34, &location);
  id v7 = (id)[(AMAmbientDefaults *)ambientDefaults observeDefaults:v5 onQueue:MEMORY[0x1E4F14428] withBlock:v33];

  uint64_t v8 = self->_ambientDefaults;
  id v9 = [NSString stringWithUTF8String:"nightModeEnabled"];
  v39[0] = v9;
  id v10 = [NSString stringWithUTF8String:"alwaysOnMode"];
  v39[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_2;
  v31[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v32, &location);
  id v12 = (id)[(AMAmbientDefaults *)v8 observeDefaults:v11 onQueue:MEMORY[0x1E4F14428] withBlock:v31];

  uint64_t v13 = self->_ambientDefaults;
  uint64_t v14 = [NSString stringWithUTF8String:"alwaysOnMode"];
  int v38 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_3;
  v29[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v30, &location);
  id v16 = (id)[(AMAmbientDefaults *)v13 observeDefaults:v15 onQueue:MEMORY[0x1E4F14428] withBlock:v29];

  __int16 v17 = self->_ambientDefaults;
  id v18 = [NSString stringWithUTF8String:"bumpToWakeEnabled"];
  uint64_t v37 = v18;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_4;
  v27[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v28, &location);
  id v20 = (id)[(AMAmbientDefaults *)v17 observeDefaults:v19 onQueue:MEMORY[0x1E4F14428] withBlock:v27];

  long long v21 = self->_ambientDefaults;
  long long v22 = [NSString stringWithUTF8String:"motionToWakeEnabled"];
  uint64_t v36 = v22;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_5;
  v25[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v26, &location);
  id v24 = (id)[(AMAmbientDefaults *)v21 observeDefaults:v23 onQueue:MEMORY[0x1E4F14428] withBlock:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluatePresentationState];
  [WeakRetained _updateViewObstructedSuppressionManager];
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained _isNightModeUserSettingEffectivelyEnabled] & 1) == 0) {
    [WeakRetained _setAmbientDisplayStyle:0 forReason:@"Settings Change"];
  }
  [WeakRetained _evaluateTriggerDetectionState];
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateIdleTimerEnablement];
  [WeakRetained _updateSleepSuppression];
  [WeakRetained _updateMotionDetection];
  [WeakRetained _evaluateRedModeTriggerDetectionState];
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateBumpToWakeEnablement];
}

void __68__SBAmbientPresentationController__observeAmbientUserSettingChanges__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMotionDetection];
}

- (BOOL)_isAmbientModeUserSettingEnabled
{
  return [(AMAmbientDefaults *)self->_ambientDefaults enableAmbientMode];
}

- (int64_t)_effectiveAlwaysOnMode
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  ambientDefaults = self->_ambientDefaults;
  return [(AMAmbientDefaults *)ambientDefaults alwaysOnMode];
}

- (BOOL)_isAmbientAlwaysOnUserSettingEnabled
{
  return [(SBAmbientPresentationController *)self _effectiveAlwaysOnMode] != 0;
}

- (BOOL)_isNightModeUserSettingEnabled
{
  return [(AMAmbientDefaults *)self->_ambientDefaults nightModeEnabled];
}

- (BOOL)_isNightModeSettingMandatory
{
  return [(SBAmbientPresentationController *)self _effectiveAlwaysOnMode] == 2;
}

- (BOOL)_isNightModeUserSettingEffectivelyEnabled
{
  if ([(SBAmbientPresentationController *)self _isNightModeUserSettingEnabled]) {
    return 1;
  }
  return [(SBAmbientPresentationController *)self _isNightModeSettingMandatory];
}

- (BOOL)_isBumpToWakeUserSettingEnabled
{
  return [(AMAmbientDefaults *)self->_ambientDefaults bumpToWakeEnabled];
}

- (BOOL)_isMotionToWakeUserSettingEnabled
{
  return [(AMAmbientDefaults *)self->_ambientDefaults motionToWakeEnabled];
}

- (BOOL)_shouldSuppressForSleep
{
  return [(SBAmbientPresentationController *)self _effectiveAlwaysOnMode] == 1;
}

- (BOOL)_isMotionToWakePermitted
{
  return [(SBAmbientPresentationController *)self _effectiveAlwaysOnMode] == 1;
}

- (void)_updateScheduledAlarmObserverForPresentationRequested:(BOOL)a3
{
  [(SBAmbientScheduledAlarmObserver *)self->_scheduledAlarmObserver setObservationEnabled:self->_presentationRequested];
  if (!self->_presentationRequested)
  {
    [(SBAmbientPresentationController *)self _clearUpcomingAlarmSuppressionsIfNecessary];
  }
}

- (void)_clearUpcomingAlarmSuppressionsIfNecessary
{
  if (self->_suppressRedModeDisplayStyleForUpcomingAlarm)
  {
    CFDictionaryRef v3 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Clearing ambient red mode suppression for upcoming alarm", buf, 2u);
    }

    self->_suppressRedModeDisplayStyleForUpcomingAlarm = 0;
    [(SBAmbientPresentationController *)self _evaluateRedModeTriggerDetectionState];
  }
  if (self->_suppressIdleTimerForUpcomingAlarm)
  {
    id v4 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_object_t v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Clearing idle timer suppression for upcoming alarm", v5, 2u);
    }

    self->_BOOL suppressIdleTimerForUpcomingAlarm = 0;
    [(SBAmbientPresentationController *)self _evaluateIdleTimerEnablement];
    [(SBAmbientPresentationController *)self _evaluateIdleTimerDisablement];
  }
}

- (void)_setupStateCaptureBlock
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v4, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

id __58__SBAmbientPresentationController__setupStateCaptureBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([WeakRetained isPresented]) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  [v2 setObject:v3 forKeyedSubscript:@"presented"];
  if ([WeakRetained isPresentationRequested]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v2 setObject:v4 forKeyedSubscript:@"presentationRequested"];
  [WeakRetained ambientDisplayStyle];
  io_object_t v5 = AMUIAmbientDisplayStyleString();
  [v2 setObject:v5 forKeyedSubscript:@"displayStyle"];

  id v6 = [WeakRetained[3] activeConfiguration];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 providerBundleIdentifier];
    [v2 setObject:v8 forKeyedSubscript:@"activeFace"];

    id v9 = [v7 descriptorIdentifier];
    [v2 setObject:v9 forKeyedSubscript:@"activeFaceDescriptor"];
  }
  id v10 = [WeakRetained[3] activeConfigurationMetadata];
  if (v10) {
    [v2 setObject:v10 forKeyedSubscript:@"activeFaceMetadata"];
  }

  return v2;
}

- (void)_updateViewObstructedSuppressionManager
{
  id v3 = +[SBLockStateAggregator sharedInstance];
  uint64_t v4 = [v3 lockState];

  BOOL v5 = [(SBAmbientPresentationController *)self _isAmbientModeUserSettingEnabled];
  id v6 = +[SBUIController sharedInstanceIfExists];
  int v7 = [v6 isOnAC];

  if (v5)
  {
    if ((v4 & 4) != 0 || v4 == 0) {
      int v7 = 0;
    }
    int v9 = [MEMORY[0x1E4F22298] isAvailable];
    if (v7 == 1 && v9 != 0)
    {
      if (!self->_suppressionManager)
      {
        id v11 = (CMSuppressionManager *)[objc_alloc(MEMORY[0x1E4F22298]) initWithClientType:2];
        suppressionManager = self->_suppressionManager;
        self->_suppressionManager = v11;

        objc_initWeak(location, self);
        uint64_t v13 = SBLogAmbientPresentation();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Starting view obstructed suppression monitoring", buf, 2u);
        }

        [(CMSuppressionManager *)self->_suppressionManager startService];
        uint64_t v14 = self->_suppressionManager;
        id v15 = [MEMORY[0x1E4F28F08] mainQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __74__SBAmbientPresentationController__updateViewObstructedSuppressionManager__block_invoke;
        v18[3] = &unk_1E6B0BA40;
        objc_copyWeak(&v19, location);
        [(CMSuppressionManager *)v14 startSuppressionUpdatesToQueue:v15 withOptions:1 withHandler:v18];

        objc_destroyWeak(&v19);
        objc_destroyWeak(location);
      }
      return;
    }
  }
  else
  {
    [MEMORY[0x1E4F22298] isAvailable];
  }
  if (self->_suppressionManager)
  {
    id v16 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Stopping view obstructed suppression monitoring", (uint8_t *)location, 2u);
    }

    [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
    [(CMSuppressionManager *)self->_suppressionManager stopService];
    __int16 v17 = self->_suppressionManager;
    self->_suppressionManager = 0;

    self->_BOOL isViewObstructedSuppressionActive = 0;
  }
}

void __74__SBAmbientPresentationController__updateViewObstructedSuppressionManager__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (v3 && WeakRetained && ([v3 reason] & 1) != 0)
  {
    uint64_t v6 = [v3 type];
    int v7 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6 == 1;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Received view obstructed suppression event [ isSuppressed:%{BOOL}d ]", (uint8_t *)v8, 8u);
    }

    v5[248] = v6 == 1;
    [v5 _evaluatePresentationState];
  }
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (BOOL)ambientTransientOverlayIsShowingPasscode
{
  return self->_ambientTransientOverlayIsShowingPasscode;
}

- (BOOL)_isCoverSheetPresentedByUserGesture
{
  return self->_coverSheetPresentedByUserGesture;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (AMUIWidgetHostManager)widgetHostManager
{
  return self->_widgetHostManager;
}

- (void)setWidgetHostManager:(id)a3
{
}

- (NSArray)defaultWidgetStacks
{
  return self->_defaultWidgetStacks;
}

- (void)setDefaultWidgetStacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultWidgetStacks, 0);
  objc_storeStrong((id *)&self->_widgetHostManager, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_lastKeyBagState, 0);
  objc_storeStrong((id *)&self->_wirelessChargingIdleTimer, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_pocketStateMonitor, 0);
  objc_storeStrong((id *)&self->_telemetryEmitter, 0);
  objc_storeStrong((id *)&self->_systemApertureLockElementSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_scheduledAlarmObserver, 0);
  objc_storeStrong((id *)&self->_traitsArbiterParticipant, 0);
  objc_storeStrong((id *)&self->_authenticationIdleTimer, 0);
  objc_storeStrong((id *)&self->_enableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_motionToWakeEnableAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_bumpToWakeAssertion, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_redModeTriggerManager, 0);
  objc_storeStrong((id *)&self->_ambientIdleTimerController, 0);
  objc_storeStrong((id *)&self->_motionDetectionWakeAttributeMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayController, 0);
  objc_storeStrong((id *)&self->_disableAlwaysOnAssertion, 0);
  objc_destroyWeak((id *)&self->_alwaysOnPolicyCoordinator);
  objc_storeStrong((id *)&self->_secureAppManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_ambientTriggerManager, 0);
}

- (void)test_updateAmbientPresentationState:(int64_t)a3 withReason:(id)a4
{
  id v6 = a4;
  if ((unint64_t)a3 <= 3)
  {
    uint64_t v7 = qword_1D8FD30F8[a3];
    uint64_t v8 = qword_1D8FD3118[a3];
    id v9 = v6;
    [(SBAmbientPresentationController *)self _updateAmbientTriggerState:v7 analogousTriggerEvents:0 withReason:v6];
    [(SBAmbientPresentationController *)self _updateAmbientMountState:v8 withReason:v9];
    id v6 = v9;
  }
}

- (void)test_updateAmbientTriggerState:(int64_t)a3 withReason:(id)a4
{
}

- (void)_updatePosterBoardWithChargerIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Failed; PosterBoard Services does not support this call.",
    (uint8_t *)&v2,
    0xCu);
}

void __75__SBAmbientPresentationController__updatePosterBoardWithChargerIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to push charger update of '%@' to PosterBoard; error: %@",
    (uint8_t *)&v5,
    0x20u);
}

void __60__SBAmbientPresentationController__fetchDefaultWidgetStacks__block_invoke_181_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch default proactive widget stacks with error:%@", (uint8_t *)&v4, 0xCu);
}

- (void)_widgetDescriptorsForATXStack:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Proactive default stack:%@ is nil or empty", (uint8_t *)&v2, 0xCu);
}

@end