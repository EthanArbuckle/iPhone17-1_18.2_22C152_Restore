@interface SMSessionManager
+ (id)SessionHandoffRebootReconciliationDecisionToString:(unint64_t)a3;
+ (id)SessionHandoffRebootReconciliationStateToString:(unint64_t)a3;
- (BOOL)_canDeviceModifyState;
- (BOOL)_isActiveDevice;
- (BOOL)_isActiveSessionDetailsFetchAttemptFailed;
- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot;
- (BOOL)_isActiveSessionDetailsLocalRecordExpired;
- (BOOL)_isActiveSessionDetailsOutOfSync;
- (BOOL)_isEffectivePairedDeviceNearby;
- (BOOL)_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:(id)a3;
- (BOOL)_isEligibleOutOfOrderEndSessionMessage:(id)a3 currentSessionManagerState:(id)a4;
- (BOOL)_isEligibleOutOfOrderStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4;
- (BOOL)_isEligibleRecentHandoffMessage:(id)a3 currentSessionManagerState:(id)a4;
- (BOOL)_isEligibleToBecomeNonActiveDeviceForHandoffStateSyncMessage:(id)a3;
- (BOOL)_isEligibleToProcessSessionTypeKeyReleaseMessage:(id)a3;
- (BOOL)_isEligibleToSendStateUpdateReqMessageAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4;
- (BOOL)_isEligibleTransitionFromStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4;
- (BOOL)_isHandoffAllowedInSessionState:(unint64_t)a3;
- (BOOL)_isLocalStateInSyncWithActiveSessionDetails:(id)a3 deviceSessionManagerState:(id)a4;
- (BOOL)_isMultiDeviceSetupForLocalState:(id)a3;
- (BOOL)_isRemoteSessionEndForPreviousState:(id)a3 nextState:(id)a4;
- (BOOL)_isSessionManagerStateStaleToHandoff;
- (BOOL)_isWatchDeviceEligibleForHandoff;
- (BOOL)_isWatchInLowPowerMode;
- (BOOL)_isWatchOnWristEligibilityCriteriaSatisfied;
- (BOOL)_performStateTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5;
- (BOOL)_sessionSupportsHandoff;
- (BOOL)_shouldAlertNowWithTargetAlertDate:(id)a3;
- (BOOL)_shouldExitHysteresisState:(unint64_t)a3 nearbyDeviceConnected:(BOOL)a4;
- (BOOL)_shouldRetryForHandoffError:(id)a3 retryCount:(unint64_t)a4;
- (BOOL)_stateValidForSendSessionEndMessageRetry:(id)a3;
- (BOOL)_stateValidForSendingEndSessionMessage:(id)a3;
- (BOOL)_stateValidForSessionResume:(id)a3;
- (BOOL)statusStoreInProgress;
- (BOOL)statusStored;
- (BOOL)statusUpdatePending;
- (CLLocation)lastLocation;
- (NSHashTable)observers;
- (OS_dispatch_queue)initiatorEligibilityQueue;
- (OS_dispatch_queue)queue;
- (RTAuthorizationManager)authorizationManager;
- (RTBiomeManager)biomeManager;
- (RTContactsManager)contactsManager;
- (RTDefaultsManager)defaultsManager;
- (RTLocationAwarenessManager)locationAwarenessManager;
- (RTLocationManager)locationManager;
- (RTPlatform)platform;
- (RTStarkManager)starkManager;
- (RTTimer)activeSessionDetailsTimeoutTimer;
- (RTTimer)handoffRetryTimer;
- (RTTimerManager)timerManager;
- (RTWatchWristStateManager)wristStateManager;
- (RTXPCTimerAlarm)cacheReleaseXPCTimerAlarm;
- (RTXPCTimerAlarm)checkInXPCTimerAlarm;
- (RTXPCTimerAlarm)endAwarenessBeforeUnlockXPCTimerAlarm;
- (RTXPCTimerAlarm)endCarouselSessionXPCTimerAlarm;
- (RTXPCTimerAlarm)magnetBreakTimer;
- (SMActiveSessionDetails)activeSessionDetails;
- (SMActiveSessionZoneProtocol)activeSessionDetailsDelegate;
- (SMAnomalyAlertManager)anomalyAlertManager;
- (SMAppDeletionManager)appDeletionManager;
- (SMCarPlayAlertManager)carPlayAlertManager;
- (SMMessagingService)messagingService;
- (SMScreenLockMonitor)screenLockMonitor;
- (SMSessionManager)initWithAuthorizationManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 defaultsManager:(id)a6 locationManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 messagingService:(id)a11 carPlayAlertManager:(id)a12 observers:(id)a13 activeSessionDetailsDelegate:(id)a14 wristStateManager:(id)a15 appDeletionManager:(id)a16;
- (SMSessionManagerStatus)status;
- (SMSessionMetricManager)sessionMetricManager;
- (SMSessionStore)sessionStore;
- (TLAlert)cacheReleaseTLAlert;
- (double)activeSessionDetailsFetchTimeout;
- (double)cacheReleaseMaxDuration;
- (double)magnetBreakTimerInterval;
- (double)sendSessionEndMessageTimeout;
- (id)_checkDefaultsForCacheReleaseDateWithState:(id)a3;
- (id)_getMostRecentSessionState;
- (id)_stateTransitionDecisionToState:(id)a3 transitionType:(unint64_t)a4;
- (id)_updateDestinationForRoundTripSessionConfiguration:(id)a3;
- (id)checkSessionIDAndCanDeviceModifyStateWithSelector:(SEL)a3 sessionID:(id)a4;
- (id)checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:(SEL)a3 sessionID:(id)a4 validSessionStates:(id)a5;
- (id)checkSessionIDWithSelector:(SEL)a3 sessionID:(id)a4;
- (id)checkSessionStateWithSelector:(SEL)a3 validSessionStates:(id)a4;
- (id)localState;
- (id)state;
- (int64_t)cachedInitiatorEligibilty;
- (unint64_t)_evaluateHandoffRebootReconciliationState:(id)a3;
- (unint64_t)_getCurrentHysteresisStateType;
- (unint64_t)_getEndSessionStateWithReason:(unint64_t)a3;
- (unint64_t)_reconciliationDecisionForState:(id)a3 isActiveDevice:(BOOL)a4;
- (unint64_t)_reconciliationForDecisionForCKFetchCompleted:(id)a3;
- (unint64_t)handoffRebootReconciliationState;
- (unint64_t)sessionStoreAvailability;
- (unint64_t)wristState;
- (void)_addObserver:(id)a3;
- (void)_backdoorSetState:(id)a3;
- (void)_becomeActiveDeviceForSessionWithHandler:(id)a3;
- (void)_bootstrapHysteresisState;
- (void)_bootstrapToState;
- (void)_cancelMagnetBreakTimerAndExitHysteresisState;
- (void)_checkIfHandoffCriteriaSatisfiedForState:(id)a3 handler:(id)a4;
- (void)_checkInitiatorEligibilityWithIsHandoff:(BOOL)a3 completion:(id)a4;
- (void)_clearActiveSessionDetailsTimeoutTimer;
- (void)_clearHysteresisState;
- (void)_endRemoteSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)_handleMagnetBreakPhone;
- (void)_handleMagnetConnectPhone:(int64_t)a3;
- (void)_handleTransitionToStateAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4;
- (void)_handoffSessionForSessionID:(id)a3 retryCount:(unint64_t)a4 handler:(id)a5;
- (void)_initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5;
- (void)_invalidateScreenLockMonitor;
- (void)_invalidateSessionManagerXPCTimerAlarms;
- (void)_invalidateTimer:(id)a3;
- (void)_modifyRemoteSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)_notifyObserversForBecomingActiveDevice;
- (void)_notifyObserversForBecomingNonActiveDevice;
- (void)_notifyObserversForConfigurationChange;
- (void)_notifyObserversForLocalStateChange;
- (void)_notifyObserversForSecondarySOSTrigger;
- (void)_notifyObserversForSessionEndForActiveDevice:(BOOL)a3;
- (void)_notifyObserversForSessionResume;
- (void)_notifyObserversForStart;
- (void)_notifyObserversForStateChangeWithTransitionType:(unint64_t)a3;
- (void)_notifyObserversForTriggerResponse;
- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_onActiveSessionDetailsTimeoutTimerExpiry;
- (void)_onDeletedConversation:(id)a3 handler:(id)a4;
- (void)_onDeletedMessage:(id)a3 handler:(id)a4;
- (void)_onHandoffRetryTimerExpiry;
- (void)_onMessagesAppUninstalled;
- (void)_onScheduledSendForSessionID:(id)a3 handler:(id)a4;
- (void)_onSessionStoreNotification:(id)a3;
- (void)_onWristStateChangeNotification:(id)a3;
- (void)_performActionsAndUpdatesUponStateTransitionWithType:(unint64_t)a3;
- (void)_performStateSyncOriginatedTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5;
- (void)_playCacheReleaseAndUpdatingSound;
- (void)_postAnomalyAlert;
- (void)_postCacheReleaseAndUpdatingWithTargetDate:(id)a3;
- (void)_postEndAwarenessLiveActivity;
- (void)_processNearbyEffectivePairedDeviceChanged:(id)a3;
- (void)_registerForConnectivityNotifications;
- (void)_removeObserver:(id)a3;
- (void)_resetInitializationWithHandler:(id)a3;
- (void)_resetPendingSendSessionEndMessage;
- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)_respondToTriggerPromptWithRemoteControlSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)_sessionInitializedWithAllowReadToken:(id)a3 safetyCacheKey:(id)a4 scheduledSendMessageGUID:(id)a5 completionHandler:(id)a6;
- (void)_setHysteresisState:(unint64_t)a3;
- (void)_setPendingSendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4;
- (void)_setUpCacheReleaseTimer;
- (void)_setupAnomalyAlerts;
- (void)_setupAnomalyAlertsOnResume;
- (void)_setupTimerAndLockMonitorForEndAwareness;
- (void)_setupTimerForAnomaly;
- (void)_setupWarningStates;
- (void)_setupWithObservers:(id)a3;
- (void)_showUserDisabledConnectivityAlert;
- (void)_startActiveSessionDetailsTimerWithLatency:(double)a3;
- (void)_startHandoffRetryTimerWithLatency:(double)a3 sessionID:(id)a4 retryCount:(unint64_t)a5 handoffCompletion:(id)a6;
- (void)_stopPlayingCacheReleaseAndUpdatingSound;
- (void)_teardownAnomalyAlerts;
- (void)_terminateSessionWithSessionID:(id)a3;
- (void)_transitionToState:(id)a3 transitionType:(unint64_t)a4;
- (void)_updateActivityWithState:(id)a3;
- (void)_updateActivityWithState:(id)a3 shouldNotify:(BOOL)a4;
- (void)_updateConnectivityAndStatusSignalsObserverUponStateTransition;
- (void)_updateLastLocationWithLocations:(id)a3;
- (void)_updateLocationObserverUponStateTransition;
- (void)_updateReceiverWithEstimatedEndDate:(id)a3 coarseEstimatedEndDate:(id)a4 sessionID:(id)a5;
- (void)_updateReceiverWithLowPowerModeWarningStateUpdate:(int64_t)a3 sessionID:(id)a4;
- (void)_updateSessionWithConversation:(id)a3 sosReceivers:(id)a4 handler:(id)a5;
- (void)_updateTimersUponStateTransition:(unint64_t)a3;
- (void)_updateUnsupportedSeparationStateIfNeededWithNotify:(BOOL)a3;
- (void)_updateUnsupportedSeparationStateWithNewState:(BOOL)a3 shouldNotify:(BOOL)a4;
- (void)_updateUserDisabledConnectivityStatus;
- (void)addObserver:(id)a3;
- (void)bootstrapToState;
- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4;
- (void)cancelInitializationWithHandler:(id)a3;
- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3;
- (void)fetchCurrentSessionStateWithHandler:(id)a3;
- (void)fetchSOSReceiversWithCompletion:(id)a3;
- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4;
- (void)iMessageGroupDisplayNameChangedFor:(id)a3;
- (void)iMessageGroupMembershipChangedFor:(id)a3;
- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4;
- (void)initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5;
- (void)kickedFromIMessageGroupWith:(id)a3;
- (void)logSignPostForStateTransition:(id)a3;
- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)onDataSettingsChangedNotification;
- (void)onDeletedConversation:(id)a3 handler:(id)a4;
- (void)onDeletedMessage:(id)a3 handler:(id)a4;
- (void)onLocationNotification:(id)a3;
- (void)onMessagesAppUninstalled;
- (void)onScheduledSendForSessionID:(id)a3;
- (void)onScheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4;
- (void)onScheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5;
- (void)onSessionStartMessageSendResultWithMessage:(id)a3 messageGUID:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)onSessionStoreNotification:(id)a3;
- (void)onWristStateChangeNotification:(id)a3;
- (void)overrideMagnetBreakIntervalIfNeeded;
- (void)processEmergencyContactsNotifiedMessage:(id)a3;
- (void)processModifySessionConfigurationRemoteControlMessage:(id)a3;
- (void)processNearbyEffectivePairedDeviceChanged:(id)a3;
- (void)processResponseToTriggerPromptRemoteControlMessage:(id)a3;
- (void)processSessionEndRemoteControlMessage:(id)a3;
- (void)processSessionTypeKeyRelease:(id)a3;
- (void)processStateSyncMessage:(id)a3;
- (void)processStateSyncUpdateReqMessage:(id)a3;
- (void)promptDestinationAnomalyVerificationWithContext:(id)a3;
- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptDirectTriggerWithContext:(id)a3;
- (void)promptEstimatedEndDateUpdateWithContext:(id)a3;
- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3;
- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptSafeArrivalWithContext:(id)a3;
- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4;
- (void)promptTimerEndedVerificationWithContext:(id)a3;
- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3;
- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptWorkoutSessionEndVerificationWithContext:(id)a3 handlers:(id)a4;
- (void)removeObserver:(id)a3;
- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6;
- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4;
- (void)sendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4 state:(id)a5;
- (void)sessionInitializedWithSessionID:(id)a3 allowReadToken:(id)a4 safetyCacheKey:(id)a5 scheduledSendMessageGUID:(id)a6 completionHandler:(id)a7;
- (void)setActiveSessionDetails:(id)a3;
- (void)setActiveSessionDetailsDelegate:(id)a3;
- (void)setActiveSessionDetailsFetchTimeout:(double)a3;
- (void)setActiveSessionDetailsTimeoutTimer:(id)a3;
- (void)setAnomalyAlertManager:(id)a3;
- (void)setAppDeletionManager:(id)a3;
- (void)setBiomeManager:(id)a3;
- (void)setCacheReleaseMaxDuration:(double)a3;
- (void)setCacheReleaseTLAlert:(id)a3;
- (void)setCacheReleaseXPCTimerAlarm:(id)a3;
- (void)setCachedInitiatorEligibilty:(int64_t)a3;
- (void)setCarPlayAlertManager:(id)a3;
- (void)setCheckInXPCTimerAlarm:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setEndAwarenessBeforeUnlockXPCTimerAlarm:(id)a3;
- (void)setEndCarouselSessionXPCTimerAlarm:(id)a3;
- (void)setHandoffRebootReconciliationState:(unint64_t)a3;
- (void)setHandoffRetryTimer:(id)a3;
- (void)setInitiatorEligibilityQueue:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocationAwarenessManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMagnetBreakTimer:(id)a3;
- (void)setMagnetBreakTimerInterval:(double)a3;
- (void)setMessagingService:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setScreenLockMonitor:(id)a3;
- (void)setSendSessionEndMessageTimeout:(double)a3;
- (void)setSessionMetricManager:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSessionStoreAvailability:(unint64_t)a3;
- (void)setStarkManager:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusStoreInProgress:(BOOL)a3;
- (void)setStatusStored:(BOOL)a3;
- (void)setStatusUpdatePending:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)setWristState:(unint64_t)a3;
- (void)setWristStateManager:(id)a3;
- (void)setupWarningStates;
- (void)setupWithObservers:(id)a3;
- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)storeManagerStatusInStore:(unint64_t)a3 completion:(id)a4;
- (void)terminateSessionWithSessionID:(id)a3;
- (void)updateManagerStatusInStoreWithCompletion:(id)a3;
- (void)updateUserWithContext:(id)a3;
- (void)updateUserWithTriggerContext:(id)a3;
@end

@implementation SMSessionManager

- (SMSessionManager)initWithAuthorizationManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 defaultsManager:(id)a6 locationManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 messagingService:(id)a11 carPlayAlertManager:(id)a12 observers:(id)a13 activeSessionDetailsDelegate:(id)a14 wristStateManager:(id)a15 appDeletionManager:(id)a16
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v87 = a4;
  id v76 = a5;
  id v86 = a5;
  id v85 = a6;
  id v77 = a7;
  id v21 = a7;
  id v78 = a8;
  id v84 = a8;
  id v22 = a9;
  id v90 = a10;
  id v83 = a11;
  id v91 = a12;
  v23 = v21;
  id v89 = a13;
  id v82 = a14;
  id v81 = a15;
  id v80 = a16;
  if (!v21)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }

    v37 = 0;
    v24 = v90;
    goto LABEL_19;
  }
  if (!v22)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = v90;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: sessionMetricManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_18;
  }
  v24 = v90;
  if (!v90)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_17;
  }
  if (!v91)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v39 = "Invalid parameter not satisfying: carPlayAlertManager";
      goto LABEL_17;
    }
LABEL_18:

    v37 = 0;
LABEL_19:
    v40 = self;
    goto LABEL_20;
  }
  id v74 = v22;
  v92.receiver = self;
  v92.super_class = (Class)SMSessionManager;
  v25 = [(SMSessionManager *)&v92 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_authorizationManager, a3);
    objc_storeStrong((id *)&v26->_biomeManager, a4);
    objc_storeStrong((id *)&v26->_contactsManager, v76);
    objc_storeStrong((id *)&v26->_defaultsManager, a6);
    objc_storeStrong((id *)&v26->_locationManager, v77);
    objc_storeStrong((id *)&v26->_platform, v78);
    objc_storeStrong((id *)&v26->_sessionMetricManager, a9);
    objc_storeStrong((id *)&v26->_sessionStore, a10);
    v27 = (SMSessionManagerState *)objc_alloc_init(MEMORY[0x1E4F99950]);
    state = v26->_state;
    v26->_state = v27;

    v29 = (SMLocalSessionState *)objc_alloc_init(MEMORY[0x1E4F998C0]);
    localState = v26->_localState;
    v26->_localState = v29;

    uint64_t v31 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v26->_observers;
    v26->_observers = (NSHashTable *)v31;

    v33 = v26;
    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = (const char *)[v33 UTF8String];
    }
    else
    {
      id v42 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v33];
      v35 = (const char *)[v42 UTF8String];
    }
    dispatch_queue_t v43 = dispatch_queue_create(v35, v34);

    id v44 = v33[16];
    v33[16] = v43;

    objc_storeStrong(v33 + 34, a11);
    objc_storeStrong(v33 + 36, a12);
    objc_storeStrong(v33 + 44, a16);
    [v33[44] addObserver:v33];
    v33[10] = 0;
    v33[31] = 0;
    v33[32] = 0;
    defaultsManager = v26->_defaultsManager;
    double v46 = *MEMORY[0x1E4F999F8];
    v47 = [NSNumber numberWithDouble:*MEMORY[0x1E4F999F8]];
    v48 = [(RTDefaultsManager *)defaultsManager objectForKey:@"RTDefaultsSessionManagerCacheReleaseMaxDurationKey" value:v47];
    [v48 doubleValue];
    v33[9] = v49;

    if (*((double *)v33 + 9) != v46)
    {
      v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v51 = v33[9];
        *(_DWORD *)buf = 136316162;
        v94 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:appDeletionManager:]";
        __int16 v95 = 2080;
        v96 = "overriding cache release max duration";
        __int16 v97 = 2048;
        uint64_t v98 = *(void *)&v46;
        __int16 v99 = 2048;
        id v100 = v51;
        __int16 v101 = 2112;
        v102 = @"RTDefaultsSessionManagerCacheReleaseMaxDurationKey";
        _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }
    }
    v52 = [v33 defaultsManager];
    double v53 = *MEMORY[0x1E4F99B58];
    v54 = [NSNumber numberWithDouble:*MEMORY[0x1E4F99B58]];
    v55 = [v52 objectForKey:@"RTDefaultsSessionManagerSendSessionEndMessageTimeoutKey" value:v54];
    [v55 doubleValue];
    v33[14] = v56;

    if (*((double *)v33 + 14) != v53)
    {
      v57 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        id v58 = v33[14];
        *(_DWORD *)buf = 136316162;
        v94 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:appDeletionManager:]";
        __int16 v95 = 2080;
        v96 = "overriding send session end message timeout";
        __int16 v97 = 2048;
        uint64_t v98 = *(void *)&v53;
        __int16 v99 = 2048;
        id v100 = v58;
        __int16 v101 = 2112;
        v102 = @"RTDefaultsSessionManagerSendSessionEndMessageTimeoutKey";
        _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }
    }
    v59 = [v33 defaultsManager];
    v60 = [NSNumber numberWithDouble:*(double *)&SMMagnetBreakHysteresisCellularTimeInterval];
    v61 = [v59 objectForKey:@"RTDefaultsSessionManagerHysteresisMagnetBreakHysteresisTimeIntervalKey" value:v60];
    [v61 doubleValue];
    v33[13] = v62;

    if (*((double *)v33 + 13) != *(double *)&SMMagnetBreakHysteresisCellularTimeInterval)
    {
      v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        id v64 = v33[13];
        *(_DWORD *)buf = 136316162;
        v94 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:appDeletionManager:]";
        __int16 v95 = 2080;
        v96 = "overriding magnetBreak timer interval";
        __int16 v97 = 2048;
        uint64_t v98 = SMMagnetBreakHysteresisCellularTimeInterval;
        __int16 v99 = 2048;
        id v100 = v64;
        __int16 v101 = 2112;
        v102 = @"RTDefaultsSessionManagerHysteresisMagnetBreakHysteresisTimeIntervalKey";
        _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }
    }
    [v33 overrideMagnetBreakIntervalIfNeeded];
    v65 = [v33 defaultsManager];
    double v66 = *MEMORY[0x1E4F99B50];
    v67 = [NSNumber numberWithDouble:*MEMORY[0x1E4F99B50]];
    v68 = [v65 objectForKey:@"RTDefaultsSessionManagerHandoffActiveSessionDetailsFetchTimeout" value:v67];
    [v68 doubleValue];
    v33[7] = v69;

    if (*((double *)v33 + 7) != v66)
    {
      v70 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        id v71 = v33[7];
        *(_DWORD *)buf = 136316162;
        v94 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:appDeletionManager:]";
        __int16 v95 = 2080;
        v96 = "overriding active session details fech timeout";
        __int16 v97 = 2048;
        uint64_t v98 = *(void *)&v66;
        __int16 v99 = 2048;
        id v100 = v71;
        __int16 v101 = 2112;
        v102 = @"RTDefaultsSessionManagerHandoffActiveSessionDetailsFetchTimeout";
        _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }
    }
    objc_storeStrong(v33 + 17, a14);
    [v33[17] addObserver:v33];
    objc_storeStrong(v33 + 42, a15);
    uint64_t v72 = objc_opt_new();
    id v73 = v33[15];
    v33[15] = (id)v72;

    [v33 setupWithObservers:v89];
    [v33 setupWarningStates];
  }
  v40 = v26;
  v37 = v40;
  id v22 = v74;
  v24 = v90;
LABEL_20:

  return v37;
}

- (void)setupWarningStates
{
  v3 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SMSessionManager_setupWarningStates__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__SMSessionManager_setupWarningStates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupWarningStates];
}

- (void)_setupWarningStates
{
}

- (void)setupWithObservers:(id)a3
{
  id v4 = a3;
  v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SMSessionManager_setupWithObservers___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__SMSessionManager_setupWithObservers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupWithObservers:*(void *)(a1 + 40)];
}

- (void)_setupWithObservers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SMSessionManager *)self _addObserver:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  sessionStore = self->_sessionStore;
  v10 = +[RTNotification notificationName];
  [(RTNotifier *)sessionStore addObserver:self selector:sel_onSessionStoreNotification_ name:v10];
}

- (void)overrideMagnetBreakIntervalIfNeeded
{
  v3 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMSessionManager_overrideMagnetBreakIntervalIfNeeded__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__SMSessionManager_overrideMagnetBreakIntervalIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _overrideMagnetBreakIntervalIfNeeded];
}

- (void)processResponseToTriggerPromptRemoteControlMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    id v4 = [*(id *)(a1 + 32) sessionID];

    if (v4)
    {
      if ([*(id *)(a1 + 40) _isActiveDevice])
      {
        uint64_t v5 = *(void **)(a1 + 40);
        id v6 = [*(id *)(a1 + 32) sessionID];
        uint64_t v7 = [*(id *)(a1 + 32) response];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke_140;
        v12[3] = &unk_1E6B90840;
        long long v13 = *(id *)(a1 + 32);
        [v5 _respondToTriggerPromptForSessionID:v6 response:v7 handler:v12];

        id v8 = v13;
        goto LABEL_12;
      }
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      v10 = "%s,#RemoteControl, the device is not active and received a remoteControl endSessionMessage, %@ skipping any action";
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      v10 = "%s,#RemoteControl, invalid sessionEndRemoteMessage: %@";
    }
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    goto LABEL_12;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_12:
}

void __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke_140(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionID];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315650;
    id v6 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, triggerToPrompt for session with sessionID %@,  served remoteControl request message, %@", (uint8_t *)&v5, 0x20u);
  }
}

- (void)processSessionEndRemoteControlMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    id v4 = [*(id *)(a1 + 32) sessionID];

    if (v4)
    {
      if ([*(id *)(a1 + 40) _isActiveDevice])
      {
        int v5 = *(void **)(a1 + 40);
        id v6 = [*(id *)(a1 + 32) sessionID];
        uint64_t v7 = [*(id *)(a1 + 32) sessionEndReason];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke_142;
        v12[3] = &unk_1E6B90840;
        long long v13 = *(id *)(a1 + 32);
        [v5 _endSessionForSessionID:v6 reason:v7 handler:v12];

        id v8 = v13;
        goto LABEL_12;
      }
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      uint64_t v10 = "%s,#RemoteControl, the device is not active and received a remoteControl endSessionMessage, %@ skipping any action";
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      uint64_t v10 = "%s,#RemoteControl, invalid sessionEndRemoteMessage: %@";
    }
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    goto LABEL_12;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_12:
}

void __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke_142(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionID];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315650;
    id v6 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, Ended session with sessionID %@,  served remoteControl request message, %@", (uint8_t *)&v5, 0x20u);
  }
}

- (void)processModifySessionConfigurationRemoteControlMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    id v4 = [*(id *)(a1 + 32) sessionID];

    if (v4)
    {
      int v5 = [*(id *)(a1 + 40) _isActiveDevice];
      id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      __int16 v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v8 = [*(id *)(a1 + 32) updatedSessionConfiguration];
          *(_DWORD *)buf = 136315394;
          v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s,#RemoteControl, ready to call _modifySession, remoteControl updatedSessionConfiguration %@", buf, 0x16u);
        }
        __int16 v9 = *(void **)(a1 + 40);
        uint64_t v10 = [*(id *)(a1 + 32) updatedSessionConfiguration];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke_143;
        v16[3] = &unk_1E6B90840;
        uint64_t v17 = *(id *)(a1 + 32);
        [v9 _modifySessionWithConfiguration:v10 handler:v16];

        __int16 v7 = v17;
        goto LABEL_14;
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      v15 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      long long v12 = "This device is not an active and received a sessionModifyMessage, %@, skipping any action";
      long long v13 = v7;
      uint32_t v14 = 12;
    }
    else
    {
      __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      uint64_t v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v11;
      long long v12 = "%s, invalid sessionEndRemoteMessage: %@";
      long long v13 = v7;
      uint32_t v14 = 22;
    }
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_14;
  }
  __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_14:
}

void __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke_143(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionID];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315650;
    id v6 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, requested to modify session with sessionID %@, remoteControl modifyConfig %@", (uint8_t *)&v5, 0x20u);
  }
}

- (void)processStateSyncMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SMSessionManager_processStateSyncMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__SMSessionManager_processStateSyncMessage___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sessionManagerState];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) messagingService];
    id v4 = [v3 deviceIdentifier];
    int v5 = [*(id *)(a1 + 32) sessionManagerState];
    id v6 = [v5 activeDeviceIdentifier];
    int v7 = [v4 isEqual:v6];

    if (v7)
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v38 = 136315394;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        __int16 v40 = 2112;
        uint64_t v41 = v9;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, received state transition message from self, %@", (uint8_t *)&v38, 0x16u);
      }
      goto LABEL_33;
    }
    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 8) date];
    uint64_t v11 = [*(id *)(a1 + 32) sessionManagerState];
    long long v12 = [v11 date];
    if (![v10 isAfterDate:v12])
    {

LABEL_13:
LABEL_14:
      if (([*(id *)(a1 + 40) _isEligibleTransitionFromStateSyncMessage:*(void *)(a1 + 32) currentSessionManagerState:*(void *)(*(void *)(a1 + 40) + 8)] & 1) == 0)
      {
        id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = [*(id *)(a1 + 32) sessionManagerState];
          v32 = *(void **)(*(void *)(a1 + 40) + 8);
          int v38 = 136315650;
          v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
          __int16 v40 = 2112;
          uint64_t v41 = (uint64_t)v31;
          __int16 v42 = 2112;
          dispatch_queue_t v43 = v32;
          _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, stateSyncMessage contains invalid transition, stateSyncMessage.state, %@, current.state, %@", (uint8_t *)&v38, 0x20u);
        }
        goto LABEL_33;
      }
      if ([*(id *)(*(void *)(a1 + 40) + 8) isActiveState])
      {
        uint64_t v17 = [*(id *)(a1 + 32) sessionManagerState];
        if ([v17 isActiveState])
        {
          int v18 = [*(id *)(a1 + 40) _isEligibleToBecomeNonActiveDeviceForHandoffStateSyncMessage:*(void *)(a1 + 32)];

          if (v18)
          {
            v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v37 = [*(id *)(a1 + 32) stateTransitionType];
              int v38 = 136315394;
              v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
              __int16 v40 = 2048;
              uint64_t v41 = v37;
              _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "%s evaluating stateTransitionType %lu", (uint8_t *)&v38, 0x16u);
            }

            uint64_t v20 = [*(id *)(a1 + 32) stateTransitionType];
            if (v20 != 4)
            {
              if (v20 != 2)
              {
                id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v36 = *(void *)(a1 + 32);
                  int v38 = 136315394;
                  v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
                  __int16 v40 = 2112;
                  uint64_t v41 = v36;
                  _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, Received a modifying activeDeviceIdentifier stateSyncMessage, %@, that's not transitionType of SMStateTransitionTypeHandoffBecomeActive or SMStateTransitionTypeStateSyncUpdateReq", (uint8_t *)&v38, 0x16u);
                }
                goto LABEL_33;
              }
              id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                uint64_t v22 = [*(id *)(a1 + 32) sessionManagerState];
                v23 = [v22 activeDeviceIdentifier];
                v24 = [*(id *)(*(void *)(a1 + 40) + 8) activeDeviceIdentifier];
                int v38 = 136315650;
                v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
                __int16 v40 = 2112;
                uint64_t v41 = (uint64_t)v23;
                __int16 v42 = 2112;
                dispatch_queue_t v43 = v24;
                _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%s, received state transition message for a different device than expected: %@, current: %@", (uint8_t *)&v38, 0x20u);
              }
              v25 = *(void **)(a1 + 40);
              id v8 = [*(id *)(a1 + 32) sessionManagerState];
              id v26 = [v8 copy];
              v27 = &__block_literal_global_123;
              v28 = v25;
              id v29 = v26;
              uint64_t v30 = 3;
              goto LABEL_32;
            }
LABEL_31:
            v35 = *(void **)(a1 + 40);
            id v8 = [*(id *)(a1 + 32) sessionManagerState];
            id v26 = [v8 copy];
            v28 = v35;
            id v29 = v26;
            uint64_t v30 = 1;
            v27 = 0;
LABEL_32:
            [v28 _performStateSyncOriginatedTransitionTo:v29 transitionType:v30 handler:v27];

LABEL_33:
            return;
          }
        }
        else
        {
        }
      }
      v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        int v38 = 136315394;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        __int16 v40 = 2112;
        uint64_t v41 = v34;
        _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%s, notifying for state change in companion device, %@", (uint8_t *)&v38, 0x16u);
      }

      goto LABEL_31;
    }
    int v13 = [*(id *)(*(void *)(a1 + 40) + 8) isActiveState];

    if (!v13) {
      goto LABEL_14;
    }
    uint32_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [*(id *)(a1 + 32) sessionManagerState];
      __int16 v16 = *(void **)(*(void *)(a1 + 40) + 8);
      int v38 = 136315650;
      v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v15;
      __int16 v42 = 2112;
      dispatch_queue_t v43 = v16;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, received state transition message with older state: %@, current: %@", (uint8_t *)&v38, 0x20u);
    }
    if ([*(id *)(a1 + 40) _isEligibleOutOfOrderStateSyncMessage:*(void *)(a1 + 32) currentSessionManagerState:*(void *)(*(void *)(a1 + 40) + 8)])
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v38 = 136315138;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, ready to process an out of order message given it's eligible", (uint8_t *)&v38, 0xCu);
      }
      goto LABEL_13;
    }
  }
}

void __44__SMSessionManager_processStateSyncMessage___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, becoming Non Active handler  was called, with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)processStateSyncUpdateReqMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 136315394;
    uint64_t v9 = "-[SMSessionManager processStateSyncUpdateReqMessage:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, state update requested, %@", (uint8_t *)&v8, 0x16u);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F999A0]);
  int v5 = [*(id *)(a1 + 40) state];
  id v6 = (void *)[v4 initWithSessionManagerState:v5 stateTransitionType:4];

  id v7 = [*(id *)(a1 + 40) messagingService];
  [v7 sendIDSMessageToMyDevices:v6 completion:&__block_literal_global_149];
}

void __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke_146(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[SMSessionManager processStateSyncUpdateReqMessage:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, sent state message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)processSessionTypeKeyRelease:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isEligibleToProcessSessionTypeKeyReleaseMessage:*(void *)(a1 + 40)])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
    [v2 setSessionState:4];
    id v3 = objc_alloc(MEMORY[0x1E4F99968]);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    int v5 = [v4 sessionID];
    id v6 = (void *)[v3 initWithUpdateReason:1 triggerCategory:15 sessionID:v5];
    [v2 setMonitorContext:v6];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke_151;
    v13[3] = &unk_1E6B90840;
    id v7 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v7 _performStateSyncOriginatedTransitionTo:v2 transitionType:1 handler:v13];
  }
  else
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v8 = [*(id *)(a1 + 32) _isActiveDevice];
      int v9 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      __int16 v10 = [v9 sessionID];
      id v11 = [*(id *)(a1 + 40) sessionID];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      __int16 v16 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, isActiveDevice, %{Bool}d, sessionID, %@, message.sessionID, %@, not eligible to process directly SMKeyReleaseMessage, %@", buf, 0x30u);
    }
  }
}

void __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      int v8 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, " %s, unable to transition to SMSessionStateCacheReleasedAndUpdating due to, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 32);
    int v7 = 136315394;
    int v8 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, non active device transition completed for SMKeyReleaseMessage, %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)_isEligibleToProcessSessionTypeKeyReleaseMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SMSessionManager *)self _isActiveDevice];
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    int v14 = 136315394;
    v15 = "-[SMSessionManager _isEligibleToProcessSessionTypeKeyReleaseMessage:]";
    __int16 v16 = 2112;
    id v17 = v4;
    uint64_t v12 = "%s, active device, state transition has already been processed, ignores SMKeyReleaseMessage, %@";
LABEL_12:
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0x16u);
    goto LABEL_3;
  }
  if ([(SMSessionManagerState *)self->_state sessionState] == 4) {
    goto LABEL_9;
  }
  if ([(SMSessionManagerState *)self->_state isEndSessionState]) {
    goto LABEL_9;
  }
  int v8 = [(SMSessionManagerState *)self->_state configuration];
  __int16 v9 = [v8 sessionID];
  id v10 = [v4 sessionID];
  int v11 = [v9 isEqual:v10];

  if (!v11)
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    v15 = "-[SMSessionManager _isEligibleToProcessSessionTypeKeyReleaseMessage:]";
    __int16 v16 = 2112;
    id v17 = v4;
    uint64_t v12 = "%s, non-active device isEligible to process keyReleaseMessage %@";
    goto LABEL_12;
  }
LABEL_3:
  BOOL v7 = !v5;

LABEL_10:
  return v7;
}

- (void)processEmergencyContactsNotifiedMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SMSessionManager_processEmergencyContactsNotifiedMessage___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__SMSessionManager_processEmergencyContactsNotifiedMessage___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isActiveDevice]
    && ([*(id *)(*(void *)(a1 + 32) + 8) isActiveState] & 1) != 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = [*(id *)(a1 + 32) observers];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v7 onRemoteEmergencyContactsNotified:[*(id *)(a1 + 40) triggerCategory]];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v8 = [*(id *)(a1 + 32) _isActiveDevice];
      int v9 = [*(id *)(*(void *)(a1 + 32) + 8) isActiveState];
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "-[SMSessionManager processEmergencyContactsNotifiedMessage:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, not notifying observers, _isActiveDevice: %d, isActiveState: %d", buf, 0x18u);
    }
  }
}

- (id)state
{
  id v2 = (void *)[(SMSessionManagerState *)self->_state copy];

  return v2;
}

- (id)localState
{
  id v2 = (void *)[(SMLocalSessionState *)self->_localState copy];

  return v2;
}

- (void)_registerForConnectivityNotifications
{
  objc_initWeak(&location, self);
  int out_token = 0;
  [(SMSessionManager *)self _updateUserDisabledConnectivityStatus];
  uint64_t v3 = (const char *)[@"com.apple.commcenter.DataSettingsChangedNotification" UTF8String];
  uint64_t v4 = [(SMSessionManager *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __57__SMSessionManager__registerForConnectivityNotifications__block_invoke;
  handler[3] = &unk_1E6B954B0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &out_token, v4, handler);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SMSessionManager__registerForConnectivityNotifications__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onDataSettingsChangedNotification];

  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = @"com.apple.commcenter.DataSettingsChangedNotification";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)onDataSettingsChangedNotification
{
  int v3 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMSessionManager_onDataSettingsChangedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __53__SMSessionManager_onDataSettingsChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUserDisabledConnectivityStatus];
}

- (void)_updateUserDisabledConnectivityStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = [(SMSessionManager *)self queue];
  BOOL v4 = +[SMInitiatorEligibility checkAirplaneModeEnabledWithQueue:v3];

  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v10 = "-[SMSessionManager _updateUserDisabledConnectivityStatus]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s,Session Manager Data Settings Changed, AirplaneMode: %{Bool}d", buf, 0x12u);
  }

  id v6 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SMSessionManager__updateUserDisabledConnectivityStatus__block_invoke;
  v7[3] = &unk_1E6B9CC20;
  BOOL v8 = v4;
  void v7[4] = self;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:v6 handler:v7];
}

void __57__SMSessionManager__updateUserDisabledConnectivityStatus__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[SMSessionManager _updateUserDisabledConnectivityStatus]_block_invoke";
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s,Session Manager Data Settings Changed, check cellular eligibility %{Bool}d, error, %@", (uint8_t *)&v14, 0x1Cu);
  }

  if (a2) {
    BOOL v7 = *(unsigned char *)(a1 + 40) != 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 != [*(id *)(*(void *)(a1 + 32) + 16) userDisabledConnectivity])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setUserDisabledConnectivity:v7];
    BOOL v8 = (void *)MEMORY[0x1E4F99808];
    int v9 = [*(id *)(a1 + 32) state];
    [v8 updateActivityWithState:v9 localState:*(void *)(*(void *)(a1 + 32) + 16) shouldNotify:0];

    [*(id *)(a1 + 32) _notifyObserversForLocalStateChange];
    if (v7)
    {
      long long v10 = [*(id *)(a1 + 32) state];
      if ([v10 isMonitoringState])
      {
      }
      else
      {
        __int16 v11 = [*(id *)(a1 + 32) state];
        int v12 = [v11 isAnomalyState];

        if (!v12)
        {
LABEL_12:
          uint64_t v13 = [*(id *)(a1 + 32) sessionMetricManager];
          [v13 onUserDisabledConnectivity];

          goto LABEL_13;
        }
      }
      [*(id *)(a1 + 32) _showUserDisabledConnectivityAlert];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_showUserDisabledConnectivityAlert
{
  v21[4] = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F99908] disabledConnectivityAlertTitle];
  BOOL v4 = [MEMORY[0x1E4F99908] disabledConnectivityAlertOKButton];
  id v5 = [MEMORY[0x1E4F99908] disabledConnectivityAlertGenericMessage];
  id v6 = [(SMSessionManager *)self state];
  BOOL v7 = [v6 configuration];
  uint64_t v8 = [v7 sessionType];

  if (v8 == 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F99908] disabledConnectivityAlertDestinationMessage];

    id v5 = (void *)v9;
  }
  SInt32 error = 0;
  uint64_t v10 = *MEMORY[0x1E4F1D990];
  v20[0] = *MEMORY[0x1E4F1D9B8];
  v20[1] = v10;
  v21[0] = MEMORY[0x1E4F1CC38];
  v21[1] = v3;
  uint64_t v11 = *MEMORY[0x1E4F1D9E0];
  v20[2] = *MEMORY[0x1E4F1D9A8];
  v20[3] = v11;
  v21[2] = v5;
  v21[3] = v4;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  CFDictionaryRef v13 = (const __CFDictionary *)[v12 mutableCopy];

  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v15 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 3uLL, &error, v13);
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v14, v15, (CFUserNotificationCallBack)userDisabledConnectivityAlertCallBack, 0);
  if (RunLoopSource)
  {
    int v17 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v17, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v17);
  }
  else
  {
    CFUserNotificationCancel(v15);
  }
  CFRelease(v15);
}

- (void)bootstrapToState
{
  int v3 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SMSessionManager_bootstrapToState__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__SMSessionManager_bootstrapToState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bootstrapToState];
}

- (void)_bootstrapToState
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  int v3 = [(SMSessionManager *)self state];
  uint64_t v4 = [v3 sessionState];

  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(SMSessionManager *)self state];
      *(_DWORD *)buf = 136315394;
      v79 = "-[SMSessionManager _bootstrapToState]";
      __int16 v80 = 2112;
      id v81 = v6;
      BOOL v7 = "%s, Session State is not SMSessionStateUnknown, bootstrap not needed, %@";
LABEL_10:
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, v7, buf, 0x16u);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
  if ([(SMSessionManager *)self sessionStoreAvailability] == 2)
  {
    uint64_t v8 = [(SMSessionManager *)self status];
    id v5 = [v8 state];

    uint64_t v9 = [v5 activeDeviceIdentifier];
    uint64_t v10 = [(SMSessionManager *)self messagingService];
    uint64_t v11 = [v10 deviceIdentifier];
    uint64_t v12 = [v9 isEqual:v11];

    [(SMSessionManager *)self setHandoffRebootReconciliationState:[(SMSessionManager *)self _evaluateHandoffRebootReconciliationState:v5]];
    unint64_t v13 = [(SMSessionManager *)self _reconciliationDecisionForState:v5 isActiveDevice:v12];
    if (v13 == 1)
    {
      CFAllocatorRef v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [objc_opt_class() SessionHandoffRebootReconciliationStateToString:-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState")];
        __int16 v16 = [(id)objc_opt_class() SessionHandoffRebootReconciliationDecisionToString:1];
        *(_DWORD *)buf = 136315650;
        v79 = "-[SMSessionManager _bootstrapToState]";
        __int16 v80 = 2112;
        id v81 = v15;
        __int16 v82 = 2112;
        id v83 = v16;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, Deferring - Handoff Reboot Reconciliation state, %@, reconciliationDecision, %@", buf, 0x20u);

LABEL_36:
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    unint64_t v17 = v13;
    BOOL v18 = [(SMSessionManager *)self _stateValidForSessionResume:v5];
    if (v17 == 2 && v18)
    {
      [(SMSessionManager *)self _transitionToState:v5 transitionType:1];
      [(SMSessionManager *)self _handleTransitionToStateAfterBootstrap:v5 isActiveDevice:v12];
      goto LABEL_32;
    }
    BOOL v19 = [(SMSessionManager *)self _stateValidForSendingEndSessionMessage:v5];
    if (v17 == 2) {
      int v20 = v12;
    }
    else {
      int v20 = 0;
    }
    if (v19 && v20)
    {
      id v70 = objc_alloc(MEMORY[0x1E4F99950]);
      v67 = [v5 configuration];
      v65 = [v5 monitorContext];
      v75 = [MEMORY[0x1E4F1C9C8] date];
      v63 = [v5 location];
      uint64_t v72 = [v5 allowReadToken];
      v61 = [v5 safetyCacheKey];
      v59 = [v5 startMessageGUID];
      v57 = [v5 scheduledSendMessageGUID];
      uint64_t v21 = [v5 scheduledSendMessageDate];
      v55 = [v5 activeDeviceIdentifier];
      uint64_t v22 = [v5 estimatedEndDate];
      __int16 v23 = [v5 coarseEstimatedEndDate];
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v25 = objc_msgSend(v70, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v67, 0, v65, v75, v63, v72, v61, v59, v57, v21, v55, v22, v23,
                      0,
                      7,
                      v24,
                      0);

      [(SMSessionManager *)self _transitionToState:v25 transitionType:1];
      id v26 = [v25 startMessageGUID];
      [(SMSessionManager *)self sendSessionEndMessageWithReason:7 associatedGUID:v26 state:v25];

      goto LABEL_32;
    }
    if (v17 == 3)
    {
      uint64_t v27 = [(SMSessionManager *)self activeSessionDetails];
      if (v27)
      {
        v28 = (void *)v27;
        id v29 = [(SMSessionManager *)self activeSessionDetails];
        uint64_t v30 = [v29 activeDeviceIdentifier];
        uint64_t v31 = [(SMSessionManager *)self messagingService];
        v32 = [v31 deviceIdentifier];
        if ([v30 isEqual:v32])
        {
        }
        else
        {
          v33 = [(SMSessionManager *)self activeSessionDetails];
          uint64_t v34 = [v33 sessionID];
          v35 = [v5 configuration];
          [v35 sessionID];
          v36 = id v76 = v29;
          int v73 = [v34 isEqual:v36];

          if (v73)
          {
            uint64_t v37 = [(SMSessionManager *)self activeSessionDetails];
            id v77 = [v37 activeDeviceIdentifier];

            id v68 = objc_alloc(MEMORY[0x1E4F99950]);
            uint64_t v66 = [v5 sessionState];
            id v64 = [v5 configuration];
            v62 = [v5 monitorContext];
            v60 = [v5 date];
            id v58 = [v5 location];
            id v74 = [v5 allowReadToken];
            id v71 = [v5 safetyCacheKey];
            v56 = [v5 startMessageGUID];
            v54 = [v5 scheduledSendMessageGUID];
            double v53 = [v5 scheduledSendMessageDate];
            v52 = [v5 estimatedEndDate];
            int v38 = [v5 coarseEstimatedEndDate];
            v39 = [v5 sessionStateTransitionDate];
            __int16 v40 = [(SMSessionManager *)self messagingService];
            uint64_t v41 = [v40 deviceIdentifier];
            v69 = objc_msgSend(v68, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v66, v64, 0, v62, v60, v58, v74, v71, v56, v54, v53, v77, v52, v38,
                            0,
                            7,
                            v39,
                            v41);

            [(SMSessionManager *)self _transitionToState:v69 transitionType:5];
            goto LABEL_32;
          }
        }
      }
    }
    id v42 = objc_alloc(MEMORY[0x1E4F99950]);
    if (v5)
    {
      dispatch_queue_t v43 = [v5 configuration];
    }
    else
    {
      dispatch_queue_t v43 = 0;
    }
    uint64_t v44 = [MEMORY[0x1E4F1C9C8] date];
    v45 = [(SMSessionManager *)self messagingService];
    double v46 = [v45 deviceIdentifier];
    v47 = [MEMORY[0x1E4F1C9C8] date];
    v48 = objc_msgSend(v42, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v43, 0, 0, v44, 0, 0, 0, 0, 0, 0, v46, 0, 0,
                    0,
                    0,
                    v47,
                    0);

    if (v5) {
    [(SMSessionManager *)self _transitionToState:v48 transitionType:1];
    }

LABEL_32:
    v49 = [(SMSessionManager *)self defaultsManager];
    +[RTBootInfo setBootSessionIDWithDefaultsManager:v49 defaultsKey:@"SMDefaultsBootInfo"];

    CFAllocatorRef v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [(SMSessionManager *)self state];
      BOOL v50 = [(SMSessionManager *)self _isActiveDevice];
      id v51 = "NO";
      v79 = "-[SMSessionManager _bootstrapToState]";
      *(_DWORD *)buf = 136315650;
      if (v50) {
        id v51 = "YES";
      }
      __int16 v80 = 2112;
      id v81 = v15;
      __int16 v82 = 2080;
      id v83 = v51;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, bootstrapping complete with state, %@, activeDevice %s", buf, 0x20u);
      goto LABEL_36;
    }
LABEL_37:

    goto LABEL_38;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = +[RTStore availabilityToString:[(SMSessionManager *)self sessionStoreAvailability]];
    *(_DWORD *)buf = 136315394;
    v79 = "-[SMSessionManager _bootstrapToState]";
    __int16 v80 = 2112;
    id v81 = v6;
    BOOL v7 = "%s, Deferring - Session Store is not available, %@";
    goto LABEL_10;
  }
LABEL_38:
}

- (void)_handleTransitionToStateAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(SMSessionManager *)self defaultsManager];
  uint64_t v8 = [v7 objectForKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"];

  if (v8)
  {
    if ([(SMSessionManager *)self _stateValidForSendSessionEndMessageRetry:v6])
    {
      uint64_t v9 = [(SMSessionManager *)self defaultsManager];
      uint64_t v10 = [v9 objectForKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"];
      uint64_t v11 = [v10 unsignedIntegerValue];

      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v29 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]";
        __int16 v30 = 2048;
        uint64_t v31 = v11;
        __int16 v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, resending session end message, reason, %ld, associatedGUID, %@", buf, 0x20u);
      }

      [(SMSessionManager *)self sendSessionEndMessageWithReason:v11 associatedGUID:v8 state:v6];
    }
    else
    {
      [(SMSessionManager *)self _resetPendingSendSessionEndMessage];
    }
  }
  else if ([(SMSessionManager *)self _isEligibleToSendStateUpdateReqMessageAfterBootstrap:v6 isActiveDevice:v4])
  {
    unint64_t v13 = [v6 configuration];
    uint64_t v14 = [v13 sessionID];
    if (v14)
    {
      v15 = (void *)v14;
      __int16 v16 = [v6 activePairedDeviceIdentifier];

      if (v16)
      {
        unint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]";
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%s, Preparing SMSessionStateUpdateReqMessage", buf, 0xCu);
        }

        BOOL v18 = [v6 configuration];
        BOOL v19 = [v18 sessionID];

        int v20 = [v6 activeDeviceIdentifier];
        id v21 = objc_alloc(MEMORY[0x1E4F999A8]);
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        __int16 v23 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v24 = (void *)[v21 initWithDate:v22 messageID:v23 sessionID:v19 deviceToRequest:v20];

        uint64_t v25 = [(SMSessionManager *)self messagingService];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __74__SMSessionManager__handleTransitionToStateAfterBootstrap_isActiveDevice___block_invoke;
        v26[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
        BOOL v27 = v4;
        [v25 sendIDSMessageToPairedDevice:v24 completion:v26];
      }
    }
    else
    {
    }
  }
}

void __74__SMSessionManager__handleTransitionToStateAfterBootstrap_isActiveDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *(unsigned __int8 *)(a1 + 32);
    int v8 = 136315906;
    uint64_t v9 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v7;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, isActiveDevice, %{Bool}d, just completed bootstrap, sent state update request message with success: %d and error: %@", (uint8_t *)&v8, 0x22u);
  }
}

- (BOOL)_isEligibleToSendStateUpdateReqMessageAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  id v5 = [a3 configuration];
  char v6 = [v5 sessionSupportsHandoff];

  return v6 ^ 1;
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SMSessionManager *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__SMSessionManager_fetchCurrentSessionStateWithHandler___block_invoke;
    v7[3] = &unk_1E6B90D08;
    void v7[4] = self;
    int v8 = v4;
    dispatch_async(v5, v7);

    char v6 = v8;
  }
  else
  {
    char v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __56__SMSessionManager_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) state];
  (*(void (**)(uint64_t, id, uint64_t, void))(v2 + 16))(v2, v3, [*(id *)(a1 + 32) _canDeviceModifyState], 0);
}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SMSessionManager *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SMSessionManager_fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v7[3] = &unk_1E6B90D08;
    void v7[4] = self;
    int v8 = v4;
    dispatch_async(v5, v7);

    char v6 = v8;
  }
  else
  {
    char v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __61__SMSessionManager_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) localState];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)_getMostRecentSessionState
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__167;
  v48 = __Block_byref_object_dispose__167;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = (id *)&v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__167;
  id v42 = __Block_byref_object_dispose__167;
  id v43 = 0;
  sessionStore = self->_sessionStore;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__SMSessionManager__getMostRecentSessionState__block_invoke;
  v37[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v37[4] = a2;
  [(SMSessionStore *)sessionStore logStoreWithReason:@"Running sessionStore logStoreWithReason before _getMostRecentSessionState" handler:v37];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(SMSessionManager *)self sessionStore];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  __int16 v32 = __46__SMSessionManager__getMostRecentSessionState__block_invoke_180;
  v33 = &unk_1E6B9CC68;
  v35 = &v44;
  uint64_t v36 = &v38;
  char v6 = v4;
  uint64_t v34 = v6;
  [v5 fetchMostRecentSessionManagerStateWithHandler:&v30];

  int v7 = v6;
  int v8 = [MEMORY[0x1E4F1C9C8] now:v30, v31, v32, v33];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  __int16 v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  int v13 = objc_opt_new();
  __int16 v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1198];
  id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v16 = [v15 filteredArrayUsingPredicate:v14];
  unint64_t v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  BOOL v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  BOOL v19 = (void *)MEMORY[0x1E4F28C58];
  v55[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:1];
  id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;

    char v23 = 0;
  }
  else
  {
LABEL_6:
    id v22 = 0;
    char v23 = 1;
  }

  id v24 = v22;
  if ((v23 & 1) == 0) {
    objc_storeStrong(v39 + 5, v22);
  }
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = v45[5];
    id v27 = v39[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SMSessionManager _getMostRecentSessionState]";
    __int16 v51 = 2112;
    uint64_t v52 = v26;
    __int16 v53 = 2112;
    id v54 = v27;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%s, most recent state, %@, error, %@", buf, 0x20u);
  }

  if (v39[5]) {
    id v28 = 0;
  }
  else {
    id v28 = (id)v45[5];
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

void __46__SMSessionManager__getMostRecentSessionState__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Finished running sessionStore logStoreWithReason in %@", (uint8_t *)&v4, 0xCu);
  }
}

void __46__SMSessionManager__getMostRecentSessionState__block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_transitionToState:(id)a3 transitionType:(unint64_t)a4
{
  id v8 = (id)[a3 mutableCopy];
  id v6 = [(SMSessionManager *)self _stateTransitionDecisionToState:v8 transitionType:a4];
  uint64_t v7 = [v6 actionBlock];
  v7[2]();
}

- (void)_backdoorSetState:(id)a3
{
}

- (BOOL)_stateValidForSessionResume:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isValidState] & 1) == 0)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v4 sessionState]];
      int v21 = 136315394;
      id v22 = "-[SMSessionManager _stateValidForSessionResume:]";
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, invalid state for session resume, state, %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_9;
  }
  id v5 = [(SMSessionManager *)self defaultsManager];
  BOOL v6 = +[RTBootInfo isFirstRunSinceBootWithDefaultsManager:v5 defaultsKey:@"SMDefaultsBootInfo"];

  if (v6 && ([v4 sessionState] == 11 || objc_msgSend(v4, "sessionState") == 10))
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      id v22 = "-[SMSessionManager _stateValidForSessionResume:]";
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, ignoring persisted initialized state due to phone reboot", (uint8_t *)&v21, 0xCu);
    }
LABEL_9:

LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  id v11 = [(SMSessionManager *)self defaultsManager];
  id v12 = [v11 objectForKey:@"RTDefaultsSessionManagerSessionResumeWindowThresholdKey"];

  if (v12)
  {
    int v13 = [(SMSessionManager *)self defaultsManager];
    __int16 v14 = [v13 objectForKey:@"RTDefaultsSessionManagerSessionResumeWindowThresholdKey"];
    [v14 doubleValue];
    double v16 = v15;

    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    double v16 = *MEMORY[0x1E4F99B60];
    if (!v4) {
      goto LABEL_10;
    }
  }
  unint64_t v17 = [v4 configuration];
  if (v17)
  {
    BOOL v18 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v19 = [v4 date];
    [v18 timeIntervalSinceDate:v19];
    BOOL v9 = v20 <= v16;
  }
  else
  {
    BOOL v9 = 0;
  }

LABEL_11:
  return v9;
}

- (BOOL)_stateValidForSendSessionEndMessageRetry:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527A8, &unk_1F34527C0, 0];
  if (v3)
  {
    id v5 = [NSNumber numberWithUnsignedInteger:[v3 sessionState]];
    char v6 = [v4 containsObject:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_stateValidForSendingEndSessionMessage:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452838, &unk_1F3452850, 0];
  if (v4)
  {
    char v6 = [NSNumber numberWithUnsignedInteger:[v4 sessionState]];
    if ([v5 containsObject:v6])
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      id v8 = [v4 date];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;
      [(SMSessionManager *)self sendSessionEndMessageTimeout];
      BOOL v12 = v10 <= v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_updateDestinationForRoundTripSessionConfiguration:(id)a3
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__167;
  v61 = __Block_byref_object_dispose__167;
  id v62 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__167;
  v55 = __Block_byref_object_dispose__167;
  id v56 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  char v6 = [(SMSessionManager *)self locationManager];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __71__SMSessionManager__updateDestinationForRoundTripSessionConfiguration___block_invoke;
  v46[3] = &unk_1E6B9CC90;
  id v49 = &v51;
  BOOL v50 = &v57;
  id v7 = v4;
  id v47 = v7;
  id v8 = v5;
  v48 = v8;
  [v6 fetchCachedLocationWithHandler:v46];

  double v9 = v8;
  double v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11)) {
    goto LABEL_6;
  }
  BOOL v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;
  double v15 = objc_opt_new();
  double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1198];
  unint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
  BOOL v18 = [v17 filteredArrayUsingPredicate:v16];
  BOOL v19 = [v18 firstObject];

  [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
  double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  int v21 = (void *)MEMORY[0x1E4F28C58];
  v70[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v70 count:1];
  __int16 v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
LABEL_6:
    id v24 = 0;
  }

  id v25 = v24;
  if (v25)
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = v58[5];
      id v28 = (void *)MEMORY[0x1E4F99950];
      id v29 = [(SMSessionManager *)self state];
      uint64_t v30 = [v28 convertSessionStateToString:[v29 sessionState]];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager _updateDestinationForRoundTripSessionConfiguration:]";
      __int16 v64 = 2112;
      uint64_t v65 = v27;
      __int16 v66 = 2112;
      v67 = v30;
      __int16 v68 = 2112;
      id v69 = v25;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, current location fetch failed, %@, current state, %@, error, %@", buf, 0x2Au);
    }
  }
  if (v52[5])
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = v58[5];
      v33 = (void *)MEMORY[0x1E4F99950];
      uint64_t v34 = [(SMSessionManager *)self state];
      v35 = [v33 convertSessionStateToString:[v34 sessionState]];
      uint64_t v36 = (void *)v52[5];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager _updateDestinationForRoundTripSessionConfiguration:]";
      __int16 v64 = 2112;
      uint64_t v65 = v32;
      __int16 v66 = 2112;
      v67 = v35;
      __int16 v68 = 2112;
      id v69 = v36;
      _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%s, current location fetch failed, %@, current state, %@, error, %@", buf, 0x2Au);
    }
  }
  id v37 = objc_alloc(MEMORY[0x1E4F99918]);
  uint64_t v38 = [v7 conversation];
  v39 = [v7 sessionID];
  uint64_t v40 = v58[5];
  uint64_t v41 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v42 = [v7 sessionSupportsHandoff];
  id v43 = [v7 sosReceivers];
  uint64_t v44 = (void *)[v37 initRoundTripSessionConfigurationWithConversation:v38 sessionID:v39 destination:v40 sessionStartDate:v41 userResponseSafeDate:0 sessionSupportsHandoff:v42 sosReceivers:v43];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v44;
}

void __71__SMSessionManager__updateDestinationForRoundTripSessionConfiguration___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v14 = obj;
  id v6 = a2;
  id v7 = objc_alloc(MEMORY[0x1E4F99928]);
  double v8 = *MEMORY[0x1E4F99B20];
  double v9 = [*(id *)(a1 + 32) destination];
  double v10 = [v9 destinationMapItem];
  uint64_t v11 = [v7 initWithCLLocation:v6 eta:0 radius:4 destinationType:v10 destinationMapItem:v8];

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_invalidateTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v5 = [v3 identifier];
    int v6 = 136315394;
    id v7 = "-[SMSessionManager _invalidateTimer:]";
    __int16 v8 = 2112;
    double v9 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%s, invalidating timer with identifier, %@", (uint8_t *)&v6, 0x16u);
  }
  [v3 invalidate];
}

- (id)_checkDefaultsForCacheReleaseDateWithState:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = [v4 cacheReleaseDate];
  switch([v4 sessionState])
  {
    case 7:
      int v6 = [(SMSessionManager *)self defaultsManager];
      id v7 = v6;
      __int16 v8 = @"RTDefaultsSessionManagerDestinationAnomalyPromptTimerDurationKey";
      goto LABEL_8;
    case 8:
      int v6 = [(SMSessionManager *)self defaultsManager];
      id v7 = v6;
      __int16 v8 = @"RTDefaultsSessionManagerRoundTripAnomalyPromptTimerDurationKey";
      goto LABEL_8;
    case 9:
      int v6 = [(SMSessionManager *)self defaultsManager];
      id v7 = v6;
      __int16 v8 = @"RTDefaultsSessionManagerTimerEndedPromptTimerDurationKey";
      goto LABEL_8;
    case 14:
      int v6 = [(SMSessionManager *)self defaultsManager];
      id v7 = v6;
      __int16 v8 = @"RTDefaultsSessionManagerWorkoutAnomalyPromptTimerDurationKey";
LABEL_8:
      double v9 = [v6 objectForKey:v8];

      if (!v9) {
        goto LABEL_13;
      }
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        [v9 doubleValue];
        int v17 = 136315394;
        BOOL v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        __int16 v19 = 2048;
        double v20 = v12;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, modifying timer duration to cache release to, %f", (uint8_t *)&v17, 0x16u);
      }

      double v13 = [v4 sessionStateTransitionDate];
      [v9 doubleValue];
      uint64_t v14 = [v13 dateByAddingTimeInterval:];

      dispatch_semaphore_t v5 = (void *)v14;
LABEL_12:

LABEL_13:
      double v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315394;
        BOOL v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        __int16 v19 = 2112;
        double v20 = v5;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, cache release date set to, %@", (uint8_t *)&v17, 0x16u);
      }

      return v5;
    default:
      double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v4 sessionState]];
        int v17 = 136315394;
        BOOL v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        __int16 v19 = 2112;
        double v20 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%s, invalid session state, %@", (uint8_t *)&v17, 0x16u);
      }
      goto LABEL_12;
  }
}

- (void)_updateReceiverWithEstimatedEndDate:(id)a3 coarseEstimatedEndDate:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F99878]) initWithSessionID:v10 estimatedEndTime:v8 coarseEstimatedEndTime:v9];
  uint64_t v12 = [(SMSessionManager *)self messagingService];
  double v13 = [(SMSessionManager *)self state];
  uint64_t v14 = [v13 configuration];
  double v15 = [v14 conversation];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__SMSessionManager__updateReceiverWithEstimatedEndDate_coarseEstimatedEndDate_sessionID___block_invoke;
  v19[3] = &unk_1E6B972C8;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  [v12 sendIDSMessage:v11 toConversation:v15 completion:v19];
}

void __89__SMSessionManager__updateReceiverWithEstimatedEndDate_coarseEstimatedEndDate_sessionID___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      id v7 = @"succeeded";
    }
    else {
      id v7 = @"failed";
    }
    id v8 = [*(id *)(a1 + 32) stringFromDate];
    id v9 = [*(id *)(a1 + 40) stringFromDate];
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 136316418;
    uint64_t v12 = "-[SMSessionManager _updateReceiverWithEstimatedEndDate:coarseEstimatedEndDate:sessionID:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, estimatedEndDate, %@, coarseEstimatedEndDate, %@, sessionID, %@, error, %@", (uint8_t *)&v11, 0x3Eu);
  }
}

- (void)_updateReceiverWithLowPowerModeWarningStateUpdate:(int64_t)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F998D0]) initWithSessionID:v6 lowPowerModeWarningState:a3];
  id v8 = [(SMSessionManager *)self messagingService];
  id v9 = [(SMSessionManager *)self state];
  uint64_t v10 = [v9 configuration];
  int v11 = [v10 conversation];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__SMSessionManager__updateReceiverWithLowPowerModeWarningStateUpdate_sessionID___block_invoke;
  v13[3] = &unk_1E6B97C50;
  id v14 = v6;
  int64_t v15 = a3;
  id v12 = v6;
  [v8 sendIDSMessage:v7 toConversation:v11 completion:v13];
}

void __80__SMSessionManager__updateReceiverWithLowPowerModeWarningStateUpdate_sessionID___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [MEMORY[0x1E4F99850] convertLowPowerModeWarningStateToString:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136316162;
    uint64_t v10 = "-[SMSessionManager _updateReceiverWithLowPowerModeWarningStateUpdate:sessionID:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, send, %{Bool}d, lowPowerModeWarningState, %@, sessionID, %@, error, %@", (uint8_t *)&v9, 0x30u);
  }
}

- (void)setSessionStoreAvailability:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_sessionStoreAvailability != a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = +[RTStore availabilityToString:self->_sessionStoreAvailability];
      uint64_t v8 = +[RTStore availabilityToString:a3];
      *(_DWORD *)buf = 136315650;
      id v14 = "-[SMSessionManager setSessionStoreAvailability:]";
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Session Store availability change from , %@, to, %@", buf, 0x20u);
    }
    self->_sessionStoreAvailability = a3;
    if (a3 == 2)
    {
      int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[SMSessionManager setSessionStoreAvailability:]";
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Session Store available, fetch sessionManagerStatus", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      uint64_t v10 = [(SMSessionManager *)self sessionStore];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke;
      v11[3] = &unk_1E6B9CCB8;
      objc_copyWeak(v12, (id *)buf);
      v12[1] = (id)a2;
      [v10 fetchSessionStatusWithHandler:v11];

      objc_destroyWeak(v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __48__SMSessionManager_setSessionStoreAvailability___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_225;
    block[3] = &unk_1E6B92F80;
    __int16 v13 = v5;
    id v14 = v6;
    id v15 = v8;
    dispatch_async(v9, block);

    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412290;
      __int16 v17 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", buf, 0xCu);
    }
  }
}

uint64_t __48__SMSessionManager_setSessionStoreAvailability___block_invoke_225(uint64_t a1)
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    __int16 v82 = 2048;
    uint64_t v83 = v3;
    __int16 v84 = 2112;
    id v85 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s,fetched %lu sessionManagerStatus with error %@", buf, 0x20u);
  }

  uint64_t v66 = a1;
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = [*(id *)(a1 + 32) firstObject];
    [*(id *)(a1 + 48) setStatus:v5];

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v6 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v64 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v74 != v64) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          uint64_t v10 = [v9 state];
          if (v10)
          {
            __int16 v11 = (void *)v10;
            int v12 = [v9 state];
            __int16 v13 = [v12 date];
            id v14 = [*(id *)(v66 + 48) status];
            id v15 = [v14 state];
            uint64_t v16 = [v15 date];
            int v17 = [v13 isAfterDate:v16];

            if (v17) {
              [*(id *)(v66 + 48) setStatus:v9];
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v7);
    }

    uint64_t v18 = v66;
    [*(id *)(v66 + 48) setStatusStored:1];
  }
  else
  {
    uint64_t v19 = [*(id *)(a1 + 48) _getMostRecentSessionState];
    id v20 = objc_alloc(MEMORY[0x1E4F99958]);
    __int16 v21 = objc_opt_new();
    id v22 = (void *)[v20 initWithIdentifier:v21 stateQueryDate:0 lastSessionIDDuringMagnetBreak:0 state:v19];
    [*(id *)(a1 + 48) setStatus:v22];

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    id v24 = *(void **)(a1 + 48);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_227;
    v77[3] = &unk_1E6B90E70;
    id v25 = v23;
    id v78 = v25;
    [v24 updateManagerStatusInStoreWithCompletion:v77];
    uint64_t v26 = v25;
    uint64_t v27 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v28 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v26, v28))
    {
      uint64_t v65 = v19;
      id v29 = [MEMORY[0x1E4F1C9C8] now];
      [v29 timeIntervalSinceDate:v27];
      double v31 = v30;
      uint64_t v32 = objc_opt_new();
      v33 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1198];
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 filteredArrayUsingPredicate:v33];
      uint64_t v36 = [v35 firstObject];

      [v32 submitToCoreAnalytics:v36 type:1 duration:v31];
      id v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F5CFE8];
      v86[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v86 count:1];
      uint64_t v41 = [v38 errorWithDomain:v39 code:15 userInfo:v40];

      if (v41)
      {
        id v42 = v41;
      }
      else
      {
        id v42 = 0;
      }
      uint64_t v19 = v65;
    }
    else
    {
      id v42 = 0;
    }

    id v43 = v42;
    if (v43)
    {
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v62 = [*(id *)(v66 + 48) state];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke_2";
        __int16 v82 = 2112;
        uint64_t v83 = (uint64_t)v62;
        __int16 v84 = 2112;
        id v85 = v43;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%s, failed to store session state with timeout, %@, with error, %@", buf, 0x20u);
      }
    }

    uint64_t v18 = v66;
  }
  if ((unint64_t)[*(id *)(v18 + 32) count] >= 2)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
      _os_log_fault_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_FAULT, "%s, more than 1 sessionStatus found", buf, 0xCu);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v46 = *(id *)(v18 + 32);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v70 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          uint64_t v52 = [*(id *)(v18 + 48) status];
          uint64_t v53 = [v52 identifier];
          id v54 = [v51 identifier];
          char v55 = [v53 isEqual:v54];

          uint64_t v18 = v66;
          if ((v55 & 1) == 0)
          {
            id v56 = [*(id *)(v66 + 48) sessionStore];
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_229;
            v67[3] = &unk_1E6B90840;
            id v68 = *(id *)(v66 + 48);
            [v56 removeSessionManagerStatus:v51 handler:v67];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }
      while (v48);
    }
  }
  uint64_t v57 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    id v58 = [*(id *)(v18 + 48) status];
    uint64_t v59 = [v58 description];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v59;
    _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%s,loaded sessionManagerStatus %@", buf, 0x16u);
  }
  v60 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_INFO, "%s, Session Store available, Call bootstrapToState", buf, 0xCu);
  }

  return [*(id *)(v18 + 48) _bootstrapToState];
}

intptr_t __48__SMSessionManager_setSessionStoreAvailability___block_invoke_227(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__SMSessionManager_setSessionStoreAvailability___block_invoke_229(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) status];
    uint64_t v6 = [v5 description];
    int v7 = 136315650;
    uint64_t v8 = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s,removing sessionManagerStatus %@ with error %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_bootstrapHysteresisState
{
  id v3 = [(SMSessionManager *)self magnetBreakTimer];

  if (v3)
  {
    id v4 = [(SMSessionManager *)self magnetBreakTimer];
    [(SMSessionManager *)self _invalidateTimer:v4];

    [(SMSessionManager *)self setMagnetBreakTimer:0];
  }
  id v5 = [(SMSessionManager *)self messagingService];
  id v6 = [v5 effectivePairedDevice];

  [(SMSessionManager *)self _processNearbyEffectivePairedDeviceChanged:v6];
}

- (unint64_t)_getEndSessionStateWithReason:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return 1;
  }
  else {
    return qword_1DA100948[a3 - 1];
  }
}

- (void)_postEndAwarenessLiveActivity
{
  id v3 = [(SMSessionManager *)self state];
  [(SMSessionManager *)self _updateActivityWithState:v3];
}

- (void)_initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = v10;
  if (v10)
  {
    id v37 = v10;
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v9 receiverHandles];
      id v14 = [v9 identifier];
      *(_DWORD *)buf = 136315906;
      uint64_t v39 = "-[SMSessionManager _initializeSessionWithSessionID:conversation:handler:]";
      __int16 v40 = 2112;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 2112;
      v45 = v14;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, transitioning to Initializing, sessionID, %@, handles, %@, groupID, %@", buf, 0x2Au);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F99918]);
    LOBYTE(v32) = [MEMORY[0x1E4F99880] zelkovaHandoffEnabled];
    uint64_t v16 = [v15 initWithConversation:v9 sessionID:v8 sessionStartDate:0 sessionType:0 time:0 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v32 sosReceivers:v9 sessionWorkoutType:0];
    id v33 = objc_alloc(MEMORY[0x1E4F99948]);
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
    v35 = [(SMSessionManager *)self messagingService];
    uint64_t v18 = [v35 deviceIdentifier];
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    __int16 v21 = self;
    uint64_t v34 = self;
    id v22 = (void *)v20;
    dispatch_semaphore_t v23 = [(SMSessionManager *)v21 messagingService];
    [v23 effectivePairedDevice];
    v24 = id v36 = v8;
    [v24 uniqueIDOverride];
    uint64_t v26 = v25 = v9;
    uint64_t v27 = (void *)[v22 initWithUUIDString:v26];
    dispatch_time_t v28 = v16;
    uint64_t v29 = v16;
    double v30 = (void *)v17;
    double v31 = objc_msgSend(v33, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 10, v29, 0, 0, v17, 0, 0, 0, 0, 0, 0, v18, 0, 0,
                    0,
                    0,
                    v19,
                    v27);

    id v9 = v25;
    id v8 = v36;

    __int16 v11 = v37;
    [(SMSessionManager *)v34 _performStateTransitionTo:v31 transitionType:1 handler:v37];
  }
  else
  {
    dispatch_time_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

- (void)_resetInitializationWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)MEMORY[0x1E4F99950];
      int v7 = [(SMSessionManager *)self state];
      id v8 = [v6 convertSessionStateToString:[v7 sessionState]];
      id v9 = [(SMSessionManager *)self state];
      id v10 = [v9 configuration];
      __int16 v11 = [v10 sessionID];
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "-[SMSessionManager _resetInitializationWithHandler:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s, resetting initialization for previous session with session state, %@, sessionID, %@", buf, 0x20u);
    }
    id v12 = [(SMSessionManagerState *)self->_state mutableCopy];
    [v12 setSessionState:1];
    [v12 setStartMessageGUID:0];
    [v12 setScheduledSendMessageGUID:0];
    [v12 setScheduledSendMessageDate:0];
    [v12 setActiveDeviceIdentifier:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__SMSessionManager__resetInitializationWithHandler___block_invoke;
    v13[3] = &unk_1E6B92690;
    void v13[4] = self;
    id v14 = v4;
    [(SMSessionManager *)self _performStateTransitionTo:v12 transitionType:1 handler:v13];
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __52__SMSessionManager__resetInitializationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1E4F99950];
    id v6 = [*(id *)(a1 + 32) state];
    int v7 = [v5 convertSessionStateToString:[v6 sessionState]];
    int v8 = 136315650;
    id v9 = "-[SMSessionManager _resetInitializationWithHandler:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%s, resetting initialization finished with sessionState, %@, error, %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)SessionHandoffRebootReconciliationStateToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B9D018[a3 - 1];
  }
}

+ (id)SessionHandoffRebootReconciliationDecisionToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9D038[a3 - 1];
  }
}

- (void)storeManagerStatusInStore:(unint64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v7 = (void (**)(void))a4;
  BOOL v8 = [(SMSessionManager *)self statusStoreInProgress];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      __int16 v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      __int16 v19 = v11;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@,Update already in progress", buf, 0xCu);
    }
    [(SMSessionManager *)self setStatusUpdatePending:1];
    v7[2](v7);
  }
  else
  {
    if (v10)
    {
      __int16 v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      __int16 v19 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@,storing SessionManagerStatus in store", buf, 0xCu);
    }
    [(SMSessionManager *)self setStatusStoreInProgress:1];
    objc_initWeak((id *)buf, self);
    id v13 = [(SMSessionManager *)self sessionStore];
    uint64_t v14 = [(SMSessionManager *)self status];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke;
    v15[3] = &unk_1E6B9CCE0;
    objc_copyWeak(v17, (id *)buf);
    v17[1] = (id)a2;
    uint64_t v16 = v7;
    v17[2] = (id)a3;
    [v13 storeSessionManagerStatus:v14 handler:v15];

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }
}

void __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", buf, 0xCu);
    }
    goto LABEL_15;
  }
  [WeakRetained setStatusStoreInProgress:0];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  int v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@,Successfully stored status", buf, 0xCu);
    }
    [v5 setStatusStored:1];
    if ([v5 statusUpdatePending])
    {
      [v5 setStatusUpdatePending:0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke_253;
      v14[3] = &__block_descriptor_40_e5_v8__0l;
      v14[4] = *(void *)(a1 + 48);
      [v5 updateManagerStatusInStoreWithCompletion:v14];
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 1024;
    int v20 = v12;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@,Stored with error %@, retries left %d", buf, 0x1Cu);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (!v8)
  {
    [v5 setStatusUpdatePending:0];
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_16;
  }
  [v5 storeManagerStatusInStore:v8 - 1 completion:*(void *)(a1 + 32)];
LABEL_16:
}

void __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke_253(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@,Successfully flushed status", (uint8_t *)&v4, 0xCu);
  }
}

- (void)updateManagerStatusInStoreWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SMSessionManager *)self statusStored])
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@,Attempting to update sessionManagerStatus, transaction,%@", buf, 0x16u);
    }
    id v9 = [(SMSessionManager *)self sessionStore];
    BOOL v10 = [(SMSessionManager *)self status];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __61__SMSessionManager_updateManagerStatusInStoreWithCompletion___block_invoke;
    v12[3] = &unk_1E6B916B8;
    SEL v15 = a2;
    id v13 = v6;
    id v14 = v5;
    id v11 = v6;
    [v9 updateSessionManagerStatus:v10 handler:v12];
  }
  else
  {
    [(SMSessionManager *)self storeManagerStatusInStore:2 completion:v5];
  }
}

void __61__SMSessionManager_updateManagerStatusInStoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412802;
      BOOL v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@,Update returned error %@, transaction,%@", (uint8_t *)&v9, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = *(void **)(a1 + 32);
    int v9 = 138412546;
    BOOL v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@,Successfully updated sessionManagerStatus, transaction,%@", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)checkSessionIDWithSelector:(SEL)a3 sessionID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6
    && ([(SMSessionManagerState *)self->_state configuration],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 sessionID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v6 isEqual:v8],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = NSStringFromSelector(a3);
      uint64_t v20 = [(SMSessionManagerState *)self->_state configuration];
      uint64_t v21 = [v20 sessionID];
      *(_DWORD *)buf = 138412802;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, invalid session ID %@, current sessionID, %@", buf, 0x20u);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v14 = NSString;
    uint64_t v15 = NSStringFromSelector(a3);
    uint64_t v16 = [v14 stringWithFormat:@"%@ cannot be completed since sessionID passed in does not match current sessionID", v15];
    dispatch_semaphore_t v23 = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    BOOL v10 = (void *)[v12 initWithDomain:v13 code:7 userInfo:v17];
  }

  return v10;
}

- (id)checkSessionIDAndCanDeviceModifyStateWithSelector:(SEL)a3 sessionID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(SMSessionManager *)self checkSessionIDWithSelector:a3 sessionID:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (sel__endSessionForSessionID_reason_handler_ == a3 {
         || [(SMSessionManager *)self _canDeviceModifyState])
  }
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = NSStringFromSelector(a3);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, User requested on non active device with sessionID %@", buf, 0x16u);
    }
    uint64_t v18 = *MEMORY[0x1E4F28568];
    __int16 v11 = NSString;
    id v12 = NSStringFromSelector(a3);
    uint64_t v13 = [v11 stringWithFormat:@"%@ cannot be completed since current device is not active", v12];
    __int16 v19 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (id)[v15 initWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v14];
  }

  return v9;
}

- (id)checkSessionStateWithSelector:(SEL)a3 validSessionStates:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  state = self->_state;
  if (state)
  {
    uint64_t v8 = [[NSNumber numberWithUnsignedInteger:-[SMSessionManagerState sessionState](state, "sessionState")];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v6 containsObject:v8])
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = NSString;
    __int16 v11 = NSStringFromSelector(a3);
    id v12 = [v10 stringWithFormat:@"%@ cannot run as session is not currently in an appropriate state for this function.", v11];

    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [[MEMORY[0x1E4F99950] convertSessionStateToString:-[SMSessionManagerState sessionState](self->_state, "sessionState")];
      *(_DWORD *)buf = 138412546;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F99A48];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v9 = [v14 errorWithDomain:v15 code:11 userInfo:v16];
  }

  return v9;
}

- (id)checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:(SEL)a3 sessionID:(id)a4 validSessionStates:(id)a5
{
  id v8 = a5;
  id v9 = [(SMSessionManager *)self checkSessionIDAndCanDeviceModifyStateWithSelector:a3 sessionID:a4];
  BOOL v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(SMSessionManager *)self checkSessionStateWithSelector:a3 validSessionStates:v8];
  }
  id v12 = v11;

  return v12;
}

- (void)onSessionStoreNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SMSessionManager_onSessionStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__SMSessionManager_onSessionStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onSessionStoreNotification:(id)a3
{
  id v7 = a3;
  id v4 = [v7 name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    -[SMSessionManager setSessionStoreAvailability:](self, "setSessionStoreAvailability:", [v7 availability]);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SMSessionManager_addObserver___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __32__SMSessionManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObserver:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SMSessionManager_removeObserver___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__SMSessionManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_addObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = "-[SMSessionManager _addObserver:]";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, adding observer, %@", (uint8_t *)&v10, 0x20u);
  }
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)_removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = "-[SMSessionManager _removeObserver:]";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, removing observer, %@", (uint8_t *)&v10, 0x20u);
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)_notifyObserversForStart
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _registerForNotifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(SMSessionManager *)self state];
          int v10 = [v9 configuration];
          [v8 onSessionStartedWithConfiguration:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversForBecomingActiveDevice
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _registerForNotifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(SMSessionManager *)self state];
          int v10 = (void *)[v9 copy];
          [v8 onBecomingActiveDevice:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversForBecomingNonActiveDevice
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _unregisterForNotifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(SMSessionManager *)self state];
          int v10 = (void *)[v9 copy];
          [v8 onBecomingNonActiveDevice:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversForConfigurationChange
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(SMSessionManager *)self state];
  uint64_t v4 = [v3 configuration];
  uint64_t v5 = [v4 sessionType];

  if (v5 == 1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v7 = [(SMSessionManager *)self state];
    id v8 = [v7 configuration];
    id v9 = [v8 time];
    int v10 = [v9 timeBound];
    long long v11 = [v6 roundingUpDate:v10 bucketDurationMinute:*MEMORY[0x1E4F99A30]];

    long long v12 = [(SMSessionManager *)self state];
    long long v13 = [v12 configuration];
    long long v14 = [v13 time];
    uint64_t v15 = [v14 timeBound];
    uint64_t v16 = [(SMSessionManager *)self state];
    __int16 v17 = [v16 configuration];
    uint64_t v18 = [v17 sessionID];
    [(SMSessionManager *)self _updateReceiverWithEstimatedEndDate:v15 coarseEstimatedEndDate:v11 sessionID:v18];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v19 = [(SMSessionManager *)self observers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v27 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v25 = [(SMSessionManager *)self state];
          __int16 v26 = [v25 configuration];
          [v24 onSessionChangedWithConfiguration:v26];
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v21);
  }
}

- (void)_notifyObserversForSessionResume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _registerForNotifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(SMSessionManager *)self state];
          [v8 onSessionResumedWithState:v9 forActiveDevice:[SMSessionManager _isActiveDevice]];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversForSessionEndForActiveDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _unregisterForNotifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(SMSessionManager *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 onSessionEndedForActiveDevice:v3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversForStateChangeWithTransitionType:(unint64_t)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [(SMSessionManager *)self state];
  uint64_t v6 = [(SMSessionManager *)self status];
  [v6 setState:v5];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke;
  v50[3] = &unk_1E6B90E70;
  uint64_t v7 = v4;
  uint64_t v51 = v7;
  [(SMSessionManager *)self updateManagerStatusInStoreWithCompletion:v50];
  uint64_t v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  v45 = v8;
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  long long v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  long long v14 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1198];
  uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v17 = [v16 filteredArrayUsingPredicate:v15];
  uint64_t v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F5CFE8];
  v58[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
  uint64_t v23 = [v20 errorWithDomain:v21 code:15 userInfo:v22];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
LABEL_6:
    id v24 = 0;
  }

  id v25 = v24;
  if (v25)
  {
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = [(SMSessionManager *)self state];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager _notifyObserversForStateChangeWithTransitionType:]";
      __int16 v54 = 2112;
      char v55 = v42;
      __int16 v56 = 2112;
      id v57 = v25;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%s, failed to store most recent session state with timeout, %@, with error, %@", buf, 0x20u);
    }
  }
  __int16 v44 = v25;
  BOOL v27 = [(SMSessionManager *)self _isActiveDevice];
  if (v27)
  {
    long long v28 = [(SMSessionManager *)self state];
    if ([v28 sessionState] != 10)
    {
      long long v29 = [(SMSessionManager *)self state];
      uint64_t v30 = [v29 sessionState];

      if (v30 == 11) {
        goto LABEL_16;
      }
      id v31 = objc_alloc(MEMORY[0x1E4F999A0]);
      uint64_t v32 = [(SMSessionManager *)self state];
      long long v28 = (void *)[v31 initWithSessionManagerState:v32 stateTransitionType:a3];

      id v33 = [(SMSessionManager *)self messagingService];
      [v33 sendIDSMessageToMyDevices:v28 completion:&__block_literal_global_282];
    }
  }
LABEL_16:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v34 = [(SMSessionManager *)self observers];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v47;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v46 + 1) + 8 * v38);
        if (objc_opt_respondsToSelector())
        {
          __int16 v40 = [(SMSessionManager *)self state];
          id v41 = (void *)[v40 copy];
          [v39 onSessionStateChanged:v41 forActiveDevice:v27];
        }
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v36);
  }
}

intptr_t __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke_280(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[SMSessionManager _notifyObserversForStateChangeWithTransitionType:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, sent state sync message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)_updateUnsupportedSeparationStateIfNeededWithNotify:(BOOL)a3
{
  uint64_t v5 = [(SMSessionManager *)self state];
  int v6 = [v5 isActiveState];

  LODWORD(v5) = [(SMSessionManager *)self _isEffectivePairedDeviceNearby];
  unint64_t v7 = [(SMSessionManager *)self _getCurrentHysteresisStateType];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__SMSessionManager__updateUnsupportedSeparationStateIfNeededWithNotify___block_invoke;
  v14[3] = &unk_1E6B9CD08;
  v14[4] = self;
  BOOL v15 = a3;
  __int16 v8 = (void (**)(void, void))MEMORY[0x1E016DB00](v14);
  int v9 = [(SMSessionManager *)self state];
  __int16 v10 = [v9 configuration];
  uint64_t v11 = [v10 sessionType];

  unsigned int v12 = v6 & ~v5;
  if (v7 == 2) {
    unsigned int v12 = 0;
  }
  if (v11 == 4) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v8[2](v8, v13);
}

uint64_t __72__SMSessionManager__updateUnsupportedSeparationStateIfNeededWithNotify___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) defaultsManager];
  uint64_t v5 = [NSNumber numberWithBool:a2];
  [v4 setObject:v5 forKey:@"RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"];

  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 40);

  return [v6 _updateUnsupportedSeparationStateWithNewState:a2 shouldNotify:v7];
}

- (void)_updateUnsupportedSeparationStateWithNewState:(BOOL)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v7 = [(SMLocalSessionState *)self->_localState unsupportedDeviceSeparationState];
  __int16 v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    BOOL v15 = "-[SMSessionManager _updateUnsupportedSeparationStateWithNewState:shouldNotify:]";
    __int16 v16 = 1024;
    BOOL v17 = v5;
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, newState:%{Bool}d, oldState:%{Bool}d", (uint8_t *)&v14, 0x18u);
  }

  if ([(SMLocalSessionState *)self->_localState unsupportedDeviceSeparationState] != v5)
  {
    [(SMLocalSessionState *)self->_localState setUnsupportedDeviceSeparationState:v5];
    int v9 = [(SMSessionManager *)self defaultsManager];
    __int16 v10 = [NSNumber numberWithBool:-[SMLocalSessionState unsupportedDeviceSeparationState](self->_localState, "unsupportedDeviceSeparationState")];
    [v9 setObject:v10 forKey:@"RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"];

    [(SMSessionManager *)self _notifyObserversForLocalStateChange];
    if (v5)
    {
      uint64_t v11 = [(SMSessionManager *)self sessionMetricManager];
      [v11 onUnsupportedDeviceSeparation];
    }
  }
  unsigned int v12 = (void *)MEMORY[0x1E4F99808];
  uint64_t v13 = [(SMSessionManager *)self state];
  [v12 updateActivityWithState:v13 localState:self->_localState shouldNotify:v5 & v4];
}

- (void)_notifyObserversForLocalStateChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          int v9 = [(SMSessionManager *)self localState];
          __int16 v10 = (void *)[v9 copy];
          [v8 onLocalSessionStateChanged:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversForSecondarySOSTrigger
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SMSessionManager *)self _isActiveDevice];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(SMSessionManager *)self observers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector())
        {
          __int16 v10 = [(SMSessionManager *)self state];
          long long v11 = (void *)[v10 copy];
          [v9 onSecondarySOSTriggerWithState:v11 forActiveDevice:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isActiveDevice
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(SMSessionManager *)self state];
    uint64_t v5 = [v4 activeDeviceIdentifier];
    uint64_t v6 = [(SMSessionManager *)self messagingService];
    uint64_t v7 = [v6 deviceIdentifier];
    uint64_t v8 = [(SMSessionManager *)self state];
    int v9 = [v8 activeDeviceIdentifier];
    __int16 v10 = [(SMSessionManager *)self messagingService];
    long long v11 = [v10 deviceIdentifier];
    int v12 = [v9 isEqual:v11];
    long long v13 = "NO";
    int v20 = 136315906;
    uint64_t v21 = "-[SMSessionManager _isActiveDevice]";
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    if (v12) {
      long long v13 = "YES";
    }
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2080;
    BOOL v27 = v13;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, activeDeviceIdentifier, %@, messaging service device identifier, %@, result, %s", (uint8_t *)&v20, 0x2Au);
  }
  long long v14 = [(SMSessionManager *)self state];
  long long v15 = [v14 activeDeviceIdentifier];
  uint64_t v16 = [(SMSessionManager *)self messagingService];
  uint64_t v17 = [v16 deviceIdentifier];
  char v18 = [v15 isEqual:v17];

  return v18;
}

- (BOOL)_canDeviceModifyState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SMSessionManager *)self _isActiveDevice];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(SMSessionManager *)self state];
    int v6 = [v5 isActiveState];
    uint64_t v7 = [(SMSessionManager *)self state];
    uint64_t v8 = [v7 activeDeviceIdentifier];
    int v13 = 136315906;
    long long v14 = "-[SMSessionManager _canDeviceModifyState]";
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2112;
    char v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, isActiveState, %{Bool}d, activeDeviceIdentifier, %@, isActiveDevice, %{Bool}d", (uint8_t *)&v13, 0x22u);
  }
  int v9 = [(SMSessionManager *)self state];
  if ([v9 isActiveState])
  {
    __int16 v10 = [(SMSessionManager *)self state];
    long long v11 = [v10 activeDeviceIdentifier];
    if (!v11) {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (void)_notifyObserversForTriggerResponse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(SMSessionManager *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          int v9 = [(SMSessionManager *)self state];
          [v8 onUserTriggerResponse:[v9 userTriggerResponse]];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SMSessionManager handoffSessionForSessionID:handler:]";
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, request to handoff the session to this device", buf, 0xCu);
    }

    int v9 = [(SMSessionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SMSessionManager_handoffSessionForSessionID_handler___block_invoke;
    block[3] = &unk_1E6B92118;
    long long v13 = v7;
    void block[4] = self;
    id v12 = v6;
    dispatch_async(v9, block);

    long long v10 = v13;
  }
  else
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __55__SMSessionManager_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F99880] zelkovaHandoffEnabled] & 1) == 0)
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[SMSessionManager handoffSessionForSessionID:handler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s: Zelkova Handoff is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F99A48];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithFormat:@"Zelkova Handoff is not enabled"];
    BOOL v20 = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v7 = v11;
    uint64_t v8 = v12;
    uint64_t v9 = 1;
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) _isActiveDevice])
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[SMSessionManager handoffSessionForSessionID:handler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s: This device is active and thus cannot handoff to itself; skip and do nothing",
        buf,
        0xCu);
    }

    id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v4 = *MEMORY[0x1E4F99A48];
    [NSString stringWithFormat:@"This device is active and thus cannot handoff to itself; skip and do nothing"];
    uint64_t v5 = *MEMORY[0x1E4F28568]);
    char v18 = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = v3;
    uint64_t v8 = v4;
    uint64_t v9 = 43;
LABEL_9:
    long long v13 = (void *)[v7 initWithDomain:v8 code:v9 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  long long v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);

  [v14 _handoffSessionForSessionID:v15 retryCount:2 handler:v16];
}

- (void)_handoffSessionForSessionID:(id)a3 retryCount:(unint64_t)a4 handler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]";
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, Request to handoff session to this device", buf, 0xCu);
    }

    if ([(SMSessionManager *)self _sessionSupportsHandoff])
    {
      id v11 = [(SMSessionManager *)self defaultsManager];
      [v11 setObject:MEMORY[0x1E4F1CC38] forKey:@"RTDefaultsSessionManagerHandoffInProgressKey"];

      id v25 = [(SMSessionManager *)self state];
      objc_initWeak((id *)buf, self);
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
      long long v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      long long v14 = [(SMSessionManager *)self state];
      uint64_t v15 = [v14 configuration];
      uint64_t v16 = [v15 sessionID];
      uint64_t v17 = (char *)os_signpost_id_make_with_pointer(v13, v16);

      char v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      uint64_t v19 = v18;
      if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)id v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v17, "SMHandoffSessionCriteriaInitiatorEligibilityCheckLatency", " enableTelemetry=YES ", v33, 2u);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke;
      v26[3] = &unk_1E6B9CD58;
      v32[1] = v17;
      id v20 = v12;
      id v27 = v20;
      uint64_t v28 = self;
      objc_copyWeak(v32, (id *)buf);
      id v31 = v9;
      uint64_t v21 = v25;
      long long v29 = v21;
      v32[2] = (id)a4;
      id v30 = v8;
      [(SMSessionManager *)self _checkInitiatorEligibilityWithIsHandoff:1 completion:v26];

      objc_destroyWeak(v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v23 = [NSString stringWithFormat:@"Session State configuration does not support handoff"];
      uint64_t v35 = v23;
      __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      uint64_t v21 = [v22 initWithDomain:*MEMORY[0x1E4F99A48] code:1 userInfo:v24];

      (*((void (**)(id, NSObject *))v9 + 2))(v9, v21);
    }
  }
  else
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCriteriaInitiatorEligibilityCheckLatency", " enableTelemetry=YES ", buf, 2u);
  }

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v11 = v10;

  [*(id *)(*(void *)(a1 + 40) + 24) addMetricForLatencyEligibilityChecks:v11];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = @"NO";
      *(_DWORD *)buf = 136315650;
      long long v46 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
      __int16 v47 = 2112;
      if (a2) {
        long long v14 = @"YES";
      }
      long long v48 = v14;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, check general initiator eligibility callback, isEligible %@, error %@ ", buf, 0x20u);
    }

    if (v5 || !a2)
    {
      long long v29 = [WeakRetained defaultsManager];
      [v29 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsSessionManagerHandoffInProgressKey"];

      uint64_t v30 = *(void *)(a1 + 64);
      if (v5)
      {
        (*(void (**)(uint64_t, id))(v30 + 16))(v30, v5);
      }
      else
      {
        id v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F99A48];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        __int16 v44 = @"initiator eligibility failed";
        id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        uint64_t v34 = [v31 errorWithDomain:v32 code:26 userInfo:v33];
        (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v34);
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      uint64_t v17 = v16;
      os_signpost_id_t v18 = *(void *)(a1 + 80);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMHandoffSessionCheckIfHandoffCriteriaSatisfiedSPILatency", " enableTelemetry=YES ", buf, 2u);
      }

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke_316;
      v35[3] = &unk_1E6B9CD30;
      uint64_t v41 = *(void *)(a1 + 80);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      id v36 = v15;
      uint64_t v37 = v19;
      id v38 = WeakRetained;
      id v21 = *(id *)(a1 + 64);
      uint64_t v22 = *(void *)(a1 + 88);
      id v40 = v21;
      uint64_t v42 = v22;
      id v39 = *(id *)(a1 + 56);
      id v23 = v15;
      [v38 _checkIfHandoffCriteriaSatisfiedForState:v20 handler:v35];
    }
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v25 = *MEMORY[0x1E4F99A48];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"SMSessionManager was destroyed during eligibility check";
    __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    id v27 = (void *)[v24 initWithDomain:v25 code:24 userInfo:v26];

    uint64_t v28 = [0 defaultsManager];
    [v28 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsSessionManagerHandoffInProgressKey"];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke_316(uint64_t a1, int a2, void *a3)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCheckIfHandoffCriteriaSatisfiedSPILatency", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v11 = v10;

  [*(id *)(*(void *)(a1 + 40) + 24) addMetricForLatencyHandoffCriteria:v11];
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
    __int16 v18 = 1024;
    *(_DWORD *)uint64_t v19 = a2;
    v19[2] = 2112;
    *(void *)&v19[3] = v5;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, handoffCriteriaSatisfied, %{Bool}d, eligibilityError, %@", (uint8_t *)&v16, 0x1Cu);
  }

  if (v5 || !a2)
  {
    if ([*(id *)(a1 + 40) _shouldRetryForHandoffError:v5 retryCount:*(void *)(a1 + 80)])
    {
      long long v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 80);
        int v16 = 136315394;
        uint64_t v17 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
        __int16 v18 = 2048;
        *(void *)uint64_t v19 = v14;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, Handoff is elibile to retry, pendingRetryCount, %lu, retrying...", (uint8_t *)&v16, 0x16u);
      }

      [*(id *)(a1 + 40) _startHandoffRetryTimerWithLatency:*(void *)(a1 + 56) sessionID:*(void *)(a1 + 80) retryCount:*(void *)(a1 + 64) handoffCompletion:10.0];
    }
    else
    {
      uint64_t v15 = [*(id *)(a1 + 48) defaultsManager];
      [v15 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsSessionManagerHandoffInProgressKey"];

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 48) _becomeActiveDeviceForSessionWithHandler:*(void *)(a1 + 64)];
  }
}

- (BOOL)_shouldRetryForHandoffError:(id)a3 retryCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    LOBYTE(a4) = [v5 code] == 3
  }
              || [v6 code] == 4
              || [v6 code] == 7
              || [v6 code] == 36;

  return a4;
}

- (void)_startHandoffRetryTimerWithLatency:(double)a3 sessionID:(id)a4 retryCount:(unint64_t)a5 handoffCompletion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  handoffRetryTimer = self->_handoffRetryTimer;
  if (handoffRetryTimer)
  {
    [(RTTimer *)handoffRetryTimer invalidate];
    uint64_t v14 = self->_handoffRetryTimer;
    self->_handoffRetryTimer = 0;
  }
  timerManager = self->_timerManager;
  int v16 = [(SMSessionManager *)self queue];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __94__SMSessionManager__startHandoffRetryTimerWithLatency_sessionID_retryCount_handoffCompletion___block_invoke;
  uint64_t v28 = &unk_1E6B90C40;
  long long v29 = self;
  id v17 = v11;
  id v30 = v17;
  unint64_t v32 = a5;
  id v18 = v12;
  id v31 = v18;
  uint64_t v19 = [(RTTimerManager *)timerManager timerWithIdentifier:@"SMHandoffRetryTimerIdentifier" queue:v16 handler:&v25];
  uint64_t v20 = self->_handoffRetryTimer;
  self->_handoffRetryTimer = v19;

  -[RTTimer fireWithInterval:](self->_handoffRetryTimer, "fireWithInterval:", a3, v25, v26, v27, v28, v29);
  [(RTTimer *)self->_handoffRetryTimer resume];
  id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    id v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = v23;
    __int16 v35 = 2112;
    id v36 = v24;
    __int16 v37 = 2048;
    double v38 = a3;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, handoff retry timer interval, %.2f", buf, 0x20u);
  }
}

uint64_t __94__SMSessionManager__startHandoffRetryTimerWithLatency_sessionID_retryCount_handoffCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _onHandoffRetryTimerExpiry];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56) - 1;

  return [v2 _handoffSessionForSessionID:v3 retryCount:v5 handler:v4];
}

- (void)_onHandoffRetryTimerExpiry
{
  [(RTTimer *)self->_handoffRetryTimer invalidate];
  handoffRetryTimer = self->_handoffRetryTimer;
  self->_handoffRetryTimer = 0;
}

- (BOOL)_isHandoffAllowedInSessionState:(unint64_t)a3
{
  return (a3 < 0xA) & (0x294u >> a3);
}

- (void)_startActiveSessionDetailsTimerWithLatency:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_activeSessionDetailsTimeoutTimer) {
    [(SMSessionManager *)self _clearActiveSessionDetailsTimeoutTimer];
  }
  timerManager = self->_timerManager;
  id v7 = [(SMSessionManager *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__SMSessionManager__startActiveSessionDetailsTimerWithLatency___block_invoke;
  v14[3] = &unk_1E6B90E70;
  v14[4] = self;
  os_signpost_id_t v8 = [(RTTimerManager *)timerManager timerWithIdentifier:@"SMHandoffActiveSessionDetailsTimeoutTimerIdentifier" queue:v7 handler:v14];
  activeSessionDetailsTimeoutTimer = self->_activeSessionDetailsTimeoutTimer;
  self->_activeSessionDetailsTimeoutTimer = v8;

  [(RTTimer *)self->_activeSessionDetailsTimeoutTimer fireWithInterval:a3];
  [(RTTimer *)self->_activeSessionDetailsTimeoutTimer resume];
  double v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    long long v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    int v16 = v12;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, ActiveSessionDetails fetch timeout / interval, %.2f", buf, 0x20u);
  }
}

uint64_t __63__SMSessionManager__startActiveSessionDetailsTimerWithLatency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onActiveSessionDetailsTimeoutTimerExpiry];
}

- (void)_onActiveSessionDetailsTimeoutTimerExpiry
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(SMSessionManager *)self _clearActiveSessionDetailsTimeoutTimer];
  if ([(SMSessionManager *)self handoffRebootReconciliationState] == 2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [objc_opt_class() SessionHandoffRebootReconciliationStateToString:-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState")];
      int v7 = 136315394;
      os_signpost_id_t v8 = "-[SMSessionManager _onActiveSessionDetailsTimeoutTimerExpiry]";
      __int16 v9 = 2112;
      double v10 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s timer expiry and handoffRebootReconciliationState, %@, declaring timeout and ActiveSessionDetailsFetchFailure", (uint8_t *)&v7, 0x16u);
    }
    defaultsManager = self->_defaultsManager;
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [(RTDefaultsManager *)defaultsManager setObject:v6 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"];

    [(SMSessionManager *)self _bootstrapToState];
  }
}

- (void)_clearActiveSessionDetailsTimeoutTimer
{
  [(RTTimer *)self->_activeSessionDetailsTimeoutTimer invalidate];
  activeSessionDetailsTimeoutTimer = self->_activeSessionDetailsTimeoutTimer;
  self->_activeSessionDetailsTimeoutTimer = 0;
}

- (void)_checkIfHandoffCriteriaSatisfiedForState:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 1;
  os_signpost_id_t v8 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  os_signpost_id_t v32 = 0;
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  double v10 = [(SMSessionManager *)self state];
  uint64_t v11 = [v10 configuration];
  id v12 = [v11 sessionID];
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v9, v12);

  os_signpost_id_t v32 = v13;
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v15 = v14;
  os_signpost_id_t v16 = v30[3];
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SMHandoffSessionCriteriaFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v17 = [(SMSessionManager *)self activeSessionDetailsDelegate];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke;
  v21[3] = &unk_1E6B9CDF8;
  uint64_t v26 = &v29;
  id v18 = v8;
  id v22 = v18;
  id v23 = self;
  id v19 = v6;
  id v24 = v19;
  id v27 = v33;
  id v20 = v7;
  id v25 = v20;
  [v17 fetchActiveSessionDetailsWithHandler:v21];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  double v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SMHandoffSessionCriteriaFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v14 = v13;

  [*(id *)(*(void *)(a1 + 40) + 24) addMetricForLatencyFetchActiveSessionDetailsCK:v14];
  uint64_t v15 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_323;
  block[3] = &unk_1E6B9CDD0;
  char v29 = a3;
  id v23 = v7;
  id v24 = v8;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  id v25 = v16;
  uint64_t v26 = v17;
  uint64_t v28 = *(void *)(a1 + 72);
  long long v21 = *(_OWORD *)(a1 + 56);
  id v18 = (id)v21;
  long long v27 = v21;
  id v19 = v8;
  id v20 = v7;
  dispatch_async(v15, block);
}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_323(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 88))
  {
    id v30 = [*(id *)(a1 + 32) cacheReleasedDate];
    char v29 = [*(id *)(a1 + 32) scheduledSendGUID];
  }
  else
  {
    char v29 = 0;
    id v30 = 0;
  }
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 88);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v39 = "-[SMSessionManager _checkIfHandoffCriteriaSatisfiedForState:handler:]_block_invoke";
    __int16 v40 = 2112;
    uint64_t v41 = v4;
    __int16 v42 = 1024;
    int v43 = v3;
    __int16 v44 = 2112;
    uint64_t v45 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, currentActiveSessionDetails %@, fethSuccess, %{Bool}d, read existing CK activeSessionDetails record to determine CK details, fetchError, %@", buf, 0x26u);
  }

  id v27 = objc_alloc(MEMORY[0x1E4F99800]);
  id v25 = [*(id *)(a1 + 48) configuration];
  id v6 = [v25 sessionID];
  id v7 = [*(id *)(a1 + 56) messagingService];
  id v8 = [v7 deviceIdentifier];
  __int16 v9 = [*(id *)(a1 + 48) configuration];
  double v10 = [v9 conversation];
  os_signpost_id_t v11 = [v10 receiverHandles];
  id v12 = [v11 firstObject];
  double v13 = [v12 primaryHandle];
  __int16 v37 = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  uint64_t v28 = (void *)[v27 initWithSessionID:v6 activeDeviceIdentifier:v8 cacheReleasedDate:v30 scheduledSendGUID:v29 receiverHandles:v14];

  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v17 = v16;
  os_signpost_id_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMHandoffSessionCriteriaWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = [*(id *)(a1 + 56) activeSessionDetailsDelegate];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_326;
  v31[3] = &unk_1E6B9CDA8;
  uint64_t v20 = *(void *)(a1 + 56);
  id v32 = v15;
  uint64_t v33 = v20;
  uint64_t v21 = *(void *)(a1 + 80);
  id v34 = v28;
  uint64_t v36 = v21;
  long long v26 = *(_OWORD *)(a1 + 64);
  id v22 = (id)v26;
  long long v35 = v26;
  id v23 = v28;
  id v24 = v15;
  [v19 writeActiveSessionDetailOnCloudToInitiateHandoff:v23 handler:v31];
}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_326(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCriteriaWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v11 = v10;

  [*(id *)(*(void *)(a1 + 40) + 24) addMetricForLatencyWriteActiveSessionDetailsCK:v11];
  id v12 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_327;
  block[3] = &unk_1E6B9CD80;
  id v13 = *(id *)(a1 + 48);
  char v20 = a2;
  id v16 = v13;
  id v17 = v5;
  uint64_t v19 = *(void *)(a1 + 72);
  id v18 = *(id *)(a1 + 56);
  id v14 = v5;
  dispatch_async(v12, block);
}

uint64_t __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_327(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v9 = 136315906;
    double v10 = "-[SMSessionManager _checkIfHandoffCriteriaSatisfiedForState:handler:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, newCkInitiateHandoffActiveSessionDetails  %@, write operation returned callback, with success %{Bool}d, error %@ ", (uint8_t *)&v9, 0x26u);
  }

  char v6 = *(unsigned char *)(a1 + 64);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v6) {
    char v6 = *(unsigned char *)(v7 + 24) != 0;
  }
  *(unsigned char *)(v7 + 24) = v6;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_checkInitiatorEligibilityWithIsHandoff:(BOOL)a3 completion:(id)a4
{
  BOOL v21 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SMSessionManager _checkInitiatorEligibilityWithIsHandoff:completion:]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, check initiator eligibility for handoff", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v7 = NSString;
  os_signpost_id_t v8 = [(SMSessionManager *)self state];
  int v9 = [v8 configuration];
  double v10 = [v9 sessionID];
  __int16 v11 = [v7 stringWithFormat:@"com.apple.SafetyMonitor.SessionManager.handoff.InitiatorEligibility.%@", v10];

  id v22 = v11;
  dispatch_queue_t v12 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
  [(SMSessionManager *)self setInitiatorEligibilityQueue:v12];

  objc_initWeak(&location, self);
  __int16 v13 = [(SMSessionManager *)self initiatorEligibilityQueue];
  int v14 = [(SMSessionManager *)self authorizationManager];
  __int16 v15 = [(SMSessionManager *)self messagingService];
  uint64_t v16 = [v15 effectivePairedDevice];
  uint64_t v17 = [(SMSessionManager *)self defaultsManager];
  id v18 = [(SMSessionManager *)self platform];
  uint64_t v19 = [(SMSessionManager *)self appDeletionManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke;
  v23[3] = &unk_1E6B9CE48;
  objc_copyWeak(&v26, &location);
  id v20 = v5;
  id v24 = v20;
  p_long long buf = &buf;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:v13 authorizationManager:v14 effectivePairedDevice:v16 isHandoff:v21 defaultsManager:v17 platform:v18 appDeletionManager:v19 handler:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

void __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      BOOL v21 = "-[SMSessionManager _checkInitiatorEligibilityWithIsHandoff:completion:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s Initiator eligibility check complete, returning to the queue of the SessionManager, error, %@", buf, 0x16u);
    }

    os_signpost_id_t v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke_335;
    block[3] = &unk_1E6B9CE20;
    id v16 = WeakRetained;
    uint64_t v19 = a2;
    long long v14 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v14;
    long long v18 = v14;
    id v17 = v5;
    dispatch_async(v8, block);

    double v10 = v16;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F99A48];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"SMSessionManager was destroyed before eligibility check";
    __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    double v10 = (void *)[v11 initWithDomain:v12 code:24 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke_335(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitiatorEligibilityQueue:0];
  if (*(void *)(a1 + 64) == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (BOOL)_isWatchDeviceEligibleForHandoff
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(SMSessionManager *)self _isWatchOnWristEligibilityCriteriaSatisfied];
  int v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    char v6 = "-[SMSessionManager _isWatchDeviceEligibleForHandoff]";
    __int16 v7 = 1024;
    BOOL v8 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s isWatchOnWrist, %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

- (BOOL)_sessionSupportsHandoff
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    __int16 v7 = NSStringFromSelector(a2);
    __int16 v22 = [(SMSessionManager *)self state];
    BOOL v21 = [v22 configuration];
    BOOL v8 = [v21 sessionID];
    id v20 = [(SMSessionManager *)self state];
    uint64_t v19 = [v20 configuration];
    int v18 = [v19 sessionSupportsHandoff];
    uint64_t v9 = (void *)MEMORY[0x1E4F99950];
    double v10 = [(SMSessionManager *)self state];
    id v11 = [v9 convertSessionStateToString:[v10 sessionState]];
    uint64_t v12 = [(SMSessionManager *)self state];
    *(_DWORD *)long long buf = 138414082;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    __int16 v29 = 1024;
    int v30 = v18;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 1024;
    BOOL v34 = -[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", [v12 sessionState]);
    __int16 v35 = 1024;
    BOOL v36 = [(SMSessionManager *)self _isSessionManagerStateStaleToHandoff];
    __int16 v37 = 1024;
    int v38 = [MEMORY[0x1E4F99880] zelkovaHandoffEnabled];
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, config %d, sessionState, %@, _isHandoffAllowedInSessionState, %{Bool}d, _isSessionManagerStateStaleToHandoff, %{Bool}d, feature %d", buf, 0x42u);
  }
  __int16 v13 = [(SMSessionManager *)self state];
  long long v14 = [v13 configuration];
  if ([v14 sessionSupportsHandoff]
    && [MEMORY[0x1E4F99880] zelkovaHandoffEnabled])
  {
    __int16 v15 = [(SMSessionManager *)self state];
    if (-[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", [v15 sessionState]))
    {
      BOOL v16 = ![(SMSessionManager *)self _isSessionManagerStateStaleToHandoff];
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_isSessionManagerStateStaleToHandoff
{
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(SMSessionManagerState *)self->_state date];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 > 172800.0;

  return v6;
}

- (void)onWristStateChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(SMSessionManager *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SMSessionManager_onWristStateChangeNotification___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = [v4 name];
      *(_DWORD *)long long buf = 138412290;
      __int16 v13 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 name];
      *(_DWORD *)long long buf = 138412802;
      __int16 v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[SMSessionManager onWristStateChangeNotification:]";
      __int16 v16 = 1024;
      int v17 = 2335;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __51__SMSessionManager_onWristStateChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWristStateChangeNotification:*(void *)(a1 + 40)];
}

- (void)_onWristStateChangeNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    __int16 v7 = "-[SMSessionManager _onWristStateChangeNotification:]";
    __int16 v8 = 2048;
    uint64_t v9 = [v4 wristState];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, received wrist state, %ld", (uint8_t *)&v6, 0x16u);
  }

  -[SMSessionManager setWristState:](self, "setWristState:", [v4 wristState]);
}

- (BOOL)_isWatchOnWristEligibilityCriteriaSatisfied
{
  return [(SMSessionManager *)self wristState] == 2;
}

- (BOOL)_isWatchInLowPowerMode
{
  return 0;
}

- (unint64_t)_evaluateHandoffRebootReconciliationState:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SMSessionManager *)self _stateValidForSessionResume:v4])
  {
    unint64_t v11 = 1;
    goto LABEL_31;
  }
  if (![(SMSessionManager *)self _isActiveSessionDetailsFetchedFromCloudKitSinceBoot]&& ![(SMSessionManager *)self _isActiveSessionDetailsFetchAttemptFailed])
  {
    __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      BOOL v36 = [(SMSessionManager *)self _isActiveSessionDetailsFetchedFromCloudKitSinceBoot];
      __int16 v37 = [(id)objc_opt_class() SessionHandoffRebootReconciliationStateToString:2];
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v36;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v37;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsFetchedFromCloudKitSinceBoot, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);
    }
    [(SMSessionManager *)self _startActiveSessionDetailsTimerWithLatency:self->_activeSessionDetailsFetchTimeout];
    goto LABEL_28;
  }
  if ([(SMSessionManager *)self _isActiveSessionDetailsOutOfSync])
  {
    BOOL v5 = [(SMSessionManager *)self _isActiveSessionDetailsFetchAttemptFailed];
    int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        BOOL v8 = [(SMSessionManager *)self _isActiveSessionDetailsOutOfSync];
        BOOL v9 = [(SMSessionManager *)self _isActiveSessionDetailsFetchAttemptFailed];
        uint64_t v10 = [(id)objc_opt_class() SessionHandoffRebootReconciliationStateToString:4];
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        *(_WORD *)&buf[24] = 2112;
        *(void *)&buf[26] = v10;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, _isActiveSessionDetailsFetchAttemptFailed, %{Bool}d setting handoffRebootReconciliationState to, %@", buf, 0x22u);
      }
      unint64_t v11 = 4;
      goto LABEL_31;
    }
    if (v7)
    {
      BOOL v39 = [(SMSessionManager *)self _isActiveSessionDetailsOutOfSync];
      __int16 v40 = [(id)objc_opt_class() SessionHandoffRebootReconciliationStateToString:2];
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v39;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v40;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);
    }
    uint64_t v41 = [(SMSessionManager *)self activeSessionDetailsDelegate];
    [v41 fetchActiveSessionDetailsWithHandler:&__block_literal_global_340];

    [(SMSessionManager *)self _startActiveSessionDetailsTimerWithLatency:self->_activeSessionDetailsFetchTimeout];
LABEL_28:
    unint64_t v11 = 2;
    goto LABEL_31;
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = [(SMSessionManager *)self _isActiveSessionDetailsOutOfSync];
    __int16 v14 = [(id)objc_opt_class() SessionHandoffRebootReconciliationStateToString:3];
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v14;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__167;
  *(void *)&buf[32] = __Block_byref_object_dispose__167;
  id v54 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__167;
  uint64_t v51 = __Block_byref_object_dispose__167;
  id v52 = 0;
  __int16 v16 = [(SMSessionManager *)self activeSessionDetailsDelegate];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke;
  v43[3] = &unk_1E6B9CE70;
  uint64_t v45 = &v47;
  uint64_t v46 = buf;
  int v17 = v15;
  __int16 v44 = v17;
  [v16 fetchActiveSessionDetailsWithHandler:v43];

  uint64_t v18 = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v20 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v18, v20)) {
    goto LABEL_20;
  }
  BOOL v21 = [MEMORY[0x1E4F1C9C8] now];
  [v21 timeIntervalSinceDate:v19];
  double v23 = v22;
  uint64_t v24 = objc_opt_new();
  __int16 v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1198];
  id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v27 = [v26 filteredArrayUsingPredicate:v25];
  uint64_t v28 = [v27 firstObject];

  [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
  __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int16 v56 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v56, 2u);
  }

  int v30 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v55 = *MEMORY[0x1E4F28568];
  *(void *)__int16 v56 = @"semaphore wait timeout";
  __int16 v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
  id v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

  if (v32)
  {
    id v33 = v32;

    char v34 = 0;
  }
  else
  {
LABEL_20:
    id v33 = 0;
    char v34 = 1;
  }

  id v38 = v33;
  if ((v34 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)&buf[8] + 40), v33);
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    unint64_t v11 = 4;
  }
  else
  {
    [(SMSessionManager *)self setActiveSessionDetails:v48[5]];
    unint64_t v11 = 3;
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);

LABEL_31:
  return v11;
}

void __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315906;
    int v17 = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, activeSessionDetails record inSync, retrieved activeSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v16, 0x26u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v8;
  id v15 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke_338(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    uint64_t v10 = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 1024;
    int v14 = a3;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, callback from fetchActiveSessionDetailsWithHandler when CK record got stale (outofSync), activeSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v9, 0x26u);
  }
}

- (unint64_t)_reconciliationDecisionForState:(id)a3 isActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v4 || ![(SMSessionManager *)self _isMultiDeviceSetupForLocalState:v6])
  {
LABEL_6:
    unint64_t v8 = 2;
    goto LABEL_7;
  }
  unint64_t v7 = [(SMSessionManager *)self handoffRebootReconciliationState];
  if (v7 != 2)
  {
    if (v7 == 3)
    {
      unint64_t v8 = [(SMSessionManager *)self _reconciliationForDecisionForCKFetchCompleted:v6];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unint64_t v8 = 1;
LABEL_7:
  int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = [objc_opt_class() SessionHandoffRebootReconciliationStateToString:-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState")];
    int v14 = [(SMSessionManager *)self activeSessionDetails];
    int v15 = 136316162;
    id v16 = "-[SMSessionManager _reconciliationDecisionForState:isActiveDevice:]";
    __int16 v17 = 1024;
    *(_DWORD *)__int16 v18 = v4;
    *(_WORD *)&v18[4] = 2112;
    *(void *)&v18[6] = v13;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%s, isActiveDevice, %{Bool}d, self.handoffRebootReconciliationState, %@,\n activeSessionDetails, %@,\n sessionManagerState, %@", (uint8_t *)&v15, 0x30u);
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = [(id)objc_opt_class() SessionHandoffRebootReconciliationDecisionToString:v8];
    int v15 = 136315394;
    id v16 = "-[SMSessionManager _reconciliationDecisionForState:isActiveDevice:]";
    __int16 v17 = 2112;
    *(void *)__int16 v18 = v11;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, bootstrapDecision, %@", (uint8_t *)&v15, 0x16u);
  }
  return v8;
}

- (BOOL)_isMultiDeviceSetupForLocalState:(id)a3
{
  int v3 = [a3 activePairedDeviceIdentifier];

  return v3 != 0;
}

- (unint64_t)_reconciliationForDecisionForCKFetchCompleted:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SMSessionManager *)self activeSessionDetails];
  LODWORD(self) = [(SMSessionManager *)self _isLocalStateInSyncWithActiveSessionDetails:v5 deviceSessionManagerState:v4];

  if (self) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 3;
  }

  return v6;
}

- (BOOL)_isLocalStateInSyncWithActiveSessionDetails:(id)a3 deviceSessionManagerState:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 sessionID];
  unint64_t v8 = [v6 configuration];
  int v9 = [v8 sessionID];
  if ([v7 isEqual:v9])
  {
    uint64_t v10 = [v5 activeDeviceIdentifier];
    __int16 v11 = [v6 activeDeviceIdentifier];
    int v12 = [v10 isEqual:v11];
  }
  else
  {
    int v12 = 0;
  }

  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315906;
    id v16 = "-[SMSessionManager _isLocalStateInSyncWithActiveSessionDetails:deviceSessionManagerState:]";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, activeSessionDetails %@, deviceSessionManagerState, %@, isLocalStateInSync %{Bool}d", (uint8_t *)&v15, 0x26u);
  }

  return v12;
}

- (void)onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    __int16 v19 = "-[SMSessionManager onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s activeSessionDetails, %@, success, %{Bool}d, error, %@", buf, 0x26u);
  }

  __int16 v11 = [(SMSessionManager *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__SMSessionManager_onActiveSessionDetailsFetchAttemptFromCKCompleted_success_error___block_invoke;
  v14[3] = &unk_1E6B972A0;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = v6;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

uint64_t __84__SMSessionManager_onActiveSessionDetailsFetchAttemptFromCKCompleted_success_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onActiveSessionDetailsFetchAttemptFromCKCompleted:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = [objc_opt_class() SessionHandoffRebootReconciliationStateToString:-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState")];
    int v15 = 136316162;
    id v16 = "-[SMSessionManager _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s activeSessionDetails, %@, success, %{Bool}d, current handoffRebootReconciliationState, %@,error, %@", (uint8_t *)&v15, 0x30u);
  }
  if (!v9)
  {
    id v12 = v8;
    if (v6) {
      goto LABEL_8;
    }
  }
  if (!v6 && objc_msgSend(v9, "code", v12) == 11)
  {
    id v12 = 0;
LABEL_8:
    [(SMSessionManager *)self setActiveSessionDetails:v12];
  }
  if ([(SMSessionManager *)self handoffRebootReconciliationState] == 2)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [objc_opt_class() SessionHandoffRebootReconciliationStateToString:-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState")];
      int v15 = 136315394;
      id v16 = "-[SMSessionManager _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, handoffRebootReconciliationState, %@, ActiveSessionDetails fetch attempt completed, clearing ActiveSessionDetailsTimeoutTimer, calling _bootstrapToState", (uint8_t *)&v15, 0x16u);
    }
    [(SMSessionManager *)self _clearActiveSessionDetailsTimeoutTimer];
    [(SMSessionManager *)self _bootstrapToState];
  }
}

- (BOOL)_isActiveSessionDetailsFetchAttemptFailed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(SMSessionManager *)self defaultsManager];
  int v3 = [v2 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    BOOL v6 = v5 < 1800.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = @"NO";
    if (v6) {
      id v9 = @"YES";
    }
    int v10 = 136315394;
    __int16 v11 = "-[SMSessionManager _isActiveSessionDetailsFetchAttemptFailed]";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails,  fetch attempt, didFail, %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (BOOL)_isActiveSessionDetailsOutOfSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SMSessionManager *)self _isActiveSessionDetailsLocalRecordExpired]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = ![(SMSessionManager *)self _isActiveSessionDetailsFetchedFromCloudKitSinceBoot];
  }
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v7 = 136315394;
    id v8 = "-[SMSessionManager _isActiveSessionDetailsOutOfSync]";
    __int16 v9 = 2112;
    int v10 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isOutOfSync, %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)_isActiveSessionDetailsLocalRecordExpired
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(SMSessionManager *)self defaultsManager];
  BOOL v3 = [v2 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    BOOL v6 = v5 < 1800.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = @"YES";
    if (v6) {
      __int16 v9 = @"NO";
    }
    int v10 = 136315394;
    uint64_t v11 = "-[SMSessionManager _isActiveSessionDetailsLocalRecordExpired]";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isExpired, %@", (uint8_t *)&v10, 0x16u);
  }

  return !v6;
}

- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(SMSessionManager *)self defaultsManager];
  BOOL v3 = [v2 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"];
  int v4 = [v3 BOOLValue];

  double v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = @"NO";
    if (v4) {
      int v7 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[SMSessionManager _isActiveSessionDetailsFetchedFromCloudKitSinceBoot]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isRecordFetchedFromCKSinceBoot, %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (id)_stateTransitionDecisionToState:(id)a3 transitionType:(unint64_t)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(SMSessionManager *)self state];
    *(_DWORD *)long long buf = 136315650;
    v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
    __int16 v149 = 2112;
    uint64_t v150 = (uint64_t)v8;
    __int16 v151 = 2112;
    id v152 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, attempting state transition from state, %@, to state, %@", buf, 0x20u);
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_6;
  }
  __int16 v9 = [(SMSessionManager *)self state];
  uint64_t v10 = [v9 sessionState];
  uint64_t v11 = [v6 sessionState];

  if (v10 != v11)
  {
    __int16 v22 = [SMSessionStateTransitionDecision alloc];
    __int16 v23 = &__block_literal_global_349;
LABEL_70:
    BOOL v20 = [(SMSessionStateTransitionDecision *)v22 initWithIsAllowed:0 actionBlock:v23];
    goto LABEL_75;
  }
  uint64_t v12 = [(SMSessionManager *)self state];
  BOOL v13 = -[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", [v12 sessionState]);

  if (!v13)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      state = self->_state;
      *(_DWORD *)long long buf = 136315650;
      v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
      __int16 v149 = 2112;
      uint64_t v150 = (uint64_t)state;
      __int16 v151 = 2112;
      id v152 = v6;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, invalid and not allowed for a handoff operation", buf, 0x20u);
    }

    __int16 v22 = [SMSessionStateTransitionDecision alloc];
    __int16 v23 = &__block_literal_global_352;
    goto LABEL_70;
  }
LABEL_6:
  uint64_t v14 = [(SMSessionManager *)self state];
  uint64_t v15 = [v14 sessionState];

  switch(v15)
  {
    case 0:
      switch([v6 sessionState])
      {
        case 1:
          uint64_t v55 = [SMSessionStateTransitionDecision alloc];
          v144[0] = MEMORY[0x1E4F143A8];
          v144[1] = 3221225472;
          v144[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2;
          v144[3] = &unk_1E6B91220;
          v144[4] = self;
          id v145 = v6;
          unint64_t v146 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v55 initWithIsAllowed:1 actionBlock:v144];
          __int16 v21 = v145;
          goto LABEL_74;
        case 2:
          __int16 v56 = [SMSessionStateTransitionDecision alloc];
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4;
          v138[3] = &unk_1E6B91220;
          v138[4] = self;
          id v139 = v6;
          unint64_t v140 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v56 initWithIsAllowed:1 actionBlock:v138];
          __int16 v21 = v139;
          goto LABEL_74;
        case 4:
          uint64_t v57 = [SMSessionStateTransitionDecision alloc];
          v129[0] = MEMORY[0x1E4F143A8];
          v129[1] = 3221225472;
          v129[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7;
          v129[3] = &unk_1E6B91220;
          v129[4] = self;
          id v130 = v6;
          unint64_t v131 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v57 initWithIsAllowed:1 actionBlock:v129];
          __int16 v21 = v130;
          goto LABEL_74;
        case 7:
        case 8:
        case 9:
          uint64_t v26 = [SMSessionStateTransitionDecision alloc];
          v135[0] = MEMORY[0x1E4F143A8];
          v135[1] = 3221225472;
          v135[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5;
          v135[3] = &unk_1E6B91220;
          v135[4] = self;
          id v136 = v6;
          unint64_t v137 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v26 initWithIsAllowed:1 actionBlock:v135];
          __int16 v21 = v136;
          goto LABEL_74;
        case 10:
        case 11:
          id v50 = [SMSessionStateTransitionDecision alloc];
          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v141[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3;
          v141[3] = &unk_1E6B91220;
          v141[4] = self;
          id v142 = v6;
          unint64_t v143 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v50 initWithIsAllowed:1 actionBlock:v141];
          __int16 v21 = v142;
          goto LABEL_74;
        case 12:
          id v58 = [SMSessionStateTransitionDecision alloc];
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8;
          v126[3] = &unk_1E6B91220;
          v126[4] = self;
          id v127 = v6;
          unint64_t v128 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v58 initWithIsAllowed:1 actionBlock:v126];
          __int16 v21 = v127;
          goto LABEL_74;
        case 14:
          uint64_t v59 = [SMSessionStateTransitionDecision alloc];
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6;
          v132[3] = &unk_1E6B91220;
          v132[4] = self;
          id v133 = v6;
          unint64_t v134 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v59 initWithIsAllowed:1 actionBlock:v132];
          __int16 v21 = v133;
          goto LABEL_74;
        default:
          __int16 v22 = [SMSessionStateTransitionDecision alloc];
          __int16 v23 = &__block_literal_global_354;
          goto LABEL_70;
      }
    case 1:
      uint64_t v27 = [v6 sessionState];
      uint64_t v28 = [SMSessionStateTransitionDecision alloc];
      if (v27 == 10)
      {
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_10;
        v123[3] = &unk_1E6B91220;
        v123[4] = self;
        id v124 = v6;
        unint64_t v125 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v28 initWithIsAllowed:1 actionBlock:v123];
        __int16 v21 = v124;
        goto LABEL_74;
      }
      __int16 v23 = &__block_literal_global_356;
      goto LABEL_37;
    case 2:
      switch([v6 sessionState])
      {
        case 1:
          uint64_t v51 = [SMSessionStateTransitionDecision alloc];
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_17;
          v111[3] = &unk_1E6B91220;
          v111[4] = self;
          id v112 = v6;
          unint64_t v113 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v51 initWithIsAllowed:1 actionBlock:v111];
          __int16 v21 = v112;
          goto LABEL_74;
        case 2:
          id v52 = [SMSessionStateTransitionDecision alloc];
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_21;
          v99[3] = &unk_1E6B91220;
          v99[4] = self;
          id v100 = v6;
          unint64_t v101 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v52 initWithIsAllowed:1 actionBlock:v99];
          __int16 v21 = v100;
          goto LABEL_74;
        case 4:
          uint64_t v53 = [SMSessionStateTransitionDecision alloc];
          v102[0] = MEMORY[0x1E4F143A8];
          v102[1] = 3221225472;
          v102[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_20;
          v102[3] = &unk_1E6B91220;
          v102[4] = self;
          id v103 = v6;
          unint64_t v104 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v53 initWithIsAllowed:1 actionBlock:v102];
          __int16 v21 = v103;
          goto LABEL_74;
        case 7:
        case 8:
        case 9:
        case 14:
          __int16 v29 = [SMSessionStateTransitionDecision alloc];
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_19;
          v105[3] = &unk_1E6B91220;
          v105[4] = self;
          id v106 = v6;
          unint64_t v107 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v29 initWithIsAllowed:1 actionBlock:v105];
          __int16 v21 = v106;
          goto LABEL_74;
        case 12:
          id v54 = [SMSessionStateTransitionDecision alloc];
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_18;
          v108[3] = &unk_1E6B91220;
          v108[4] = self;
          id v109 = v6;
          unint64_t v110 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v54 initWithIsAllowed:1 actionBlock:v108];
          __int16 v21 = v109;
          goto LABEL_74;
        default:
          __int16 v22 = [SMSessionStateTransitionDecision alloc];
          __int16 v23 = &__block_literal_global_363;
          goto LABEL_70;
      }
    case 4:
      uint64_t v31 = [v6 sessionState];
      switch(v31)
      {
        case 12:
          long long v48 = [SMSessionStateTransitionDecision alloc];
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_365;
          v93[3] = &unk_1E6B91220;
          v93[4] = self;
          id v94 = v6;
          unint64_t v95 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v48 initWithIsAllowed:1 actionBlock:v93];
          __int16 v21 = v94;
          goto LABEL_74;
        case 4:
          uint64_t v49 = [SMSessionStateTransitionDecision alloc];
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_366;
          v90[3] = &unk_1E6B91220;
          v90[4] = self;
          id v91 = v6;
          unint64_t v92 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v49 initWithIsAllowed:1 actionBlock:v90];
          __int16 v21 = v91;
          goto LABEL_74;
        case 1:
          id v32 = [SMSessionStateTransitionDecision alloc];
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_364;
          v96[3] = &unk_1E6B91220;
          v96[4] = self;
          id v97 = v6;
          unint64_t v98 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v32 initWithIsAllowed:1 actionBlock:v96];
          __int16 v21 = v97;
          goto LABEL_74;
      }
      __int16 v22 = [SMSessionStateTransitionDecision alloc];
      __int16 v23 = &__block_literal_global_369;
      goto LABEL_70;
    case 7:
    case 8:
    case 9:
      id v16 = [(SMSessionManager *)self state];
      uint64_t v17 = [v16 sessionState];
      uint64_t v18 = [v6 sessionState];

      if (v17 == v18)
      {
        switch(a4)
        {
          case 1uLL:
            __int16 v19 = [SMSessionStateTransitionDecision alloc];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8_372;
            v81[3] = &unk_1E6B91220;
            v81[4] = self;
            id v82 = v6;
            uint64_t v83 = 1;
            BOOL v20 = [(SMSessionStateTransitionDecision *)v19 initWithIsAllowed:1 actionBlock:v81];
            __int16 v21 = v82;
            goto LABEL_74;
          case 2uLL:
            BOOL v39 = [SMSessionStateTransitionDecision alloc];
            v87[0] = MEMORY[0x1E4F143A8];
            v87[1] = 3221225472;
            v87[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6_370;
            v87[3] = &unk_1E6B91220;
            v87[4] = self;
            id v88 = v6;
            uint64_t v89 = 2;
            BOOL v20 = [(SMSessionStateTransitionDecision *)v39 initWithIsAllowed:1 actionBlock:v87];
            __int16 v21 = v88;
            goto LABEL_74;
          case 3uLL:
            __int16 v40 = [SMSessionStateTransitionDecision alloc];
            v84[0] = MEMORY[0x1E4F143A8];
            v84[1] = 3221225472;
            v84[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_371;
            v84[3] = &unk_1E6B91220;
            v84[4] = self;
            id v85 = v6;
            uint64_t v86 = 3;
            BOOL v20 = [(SMSessionStateTransitionDecision *)v40 initWithIsAllowed:1 actionBlock:v84];
            __int16 v21 = v85;
            goto LABEL_74;
          case 5uLL:
            uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "SMStateTransitionTypeNonActiveBootstrapWaitStateSync self transition, Unexpected transition, it should have never happened", buf, 2u);
            }

            goto LABEL_46;
          default:
            goto LABEL_46;
        }
      }
      goto LABEL_46;
    case 10:
      uint64_t v33 = [v6 sessionState];
      if (v33 == 11 || v33 == 1)
      {
        char v34 = [SMSessionStateTransitionDecision alloc];
        v120[0] = MEMORY[0x1E4F143A8];
        v120[1] = 3221225472;
        v120[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_12;
        v120[3] = &unk_1E6B91220;
        v120[4] = self;
        id v121 = v6;
        unint64_t v122 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v34 initWithIsAllowed:1 actionBlock:v120];
        __int16 v21 = v121;
        goto LABEL_74;
      }
      __int16 v22 = [SMSessionStateTransitionDecision alloc];
      __int16 v23 = &__block_literal_global_358;
      goto LABEL_70;
    case 11:
      uint64_t v35 = [v6 sessionState];
      if (v35 == 2)
      {
        id v38 = [SMSessionStateTransitionDecision alloc];
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_15;
        v114[3] = &unk_1E6B91220;
        v114[4] = self;
        id v115 = v6;
        unint64_t v116 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v38 initWithIsAllowed:1 actionBlock:v114];
        __int16 v21 = v115;
        goto LABEL_74;
      }
      if (v35 == 1)
      {
        BOOL v36 = [SMSessionStateTransitionDecision alloc];
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_14;
        v117[3] = &unk_1E6B91220;
        v117[4] = self;
        id v118 = v6;
        unint64_t v119 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v36 initWithIsAllowed:1 actionBlock:v117];
        __int16 v21 = v118;
        goto LABEL_74;
      }
      __int16 v22 = [SMSessionStateTransitionDecision alloc];
      __int16 v23 = &__block_literal_global_360_0;
      goto LABEL_70;
    case 12:
      uint64_t v37 = [v6 sessionState];
      uint64_t v28 = [SMSessionStateTransitionDecision alloc];
      if (v37 == 1)
      {
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_381;
        v63[3] = &unk_1E6B91220;
        v63[4] = self;
        id v64 = v6;
        unint64_t v65 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v28 initWithIsAllowed:1 actionBlock:v63];
        __int16 v21 = v64;
        goto LABEL_74;
      }
      __int16 v23 = &__block_literal_global_384;
LABEL_37:
      __int16 v22 = v28;
      goto LABEL_70;
    case 14:
LABEL_46:
      uint64_t v42 = [v6 sessionState];
      if (v42 <= 3)
      {
        if (v42 == 1)
        {
          uint64_t v47 = [SMSessionStateTransitionDecision alloc];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_373;
          v78[3] = &unk_1E6B91220;
          v78[4] = self;
          id v79 = v6;
          unint64_t v80 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v47 initWithIsAllowed:1 actionBlock:v78];
          __int16 v21 = v79;
          goto LABEL_74;
        }
        if (v42 == 2)
        {
          __int16 v44 = [SMSessionStateTransitionDecision alloc];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_375;
          v72[3] = &unk_1E6B91220;
          v72[4] = self;
          id v73 = v6;
          unint64_t v74 = a4;
          BOOL v20 = [(SMSessionStateTransitionDecision *)v44 initWithIsAllowed:1 actionBlock:v72];
          __int16 v21 = v73;
          goto LABEL_74;
        }
LABEL_57:
        __int16 v22 = [SMSessionStateTransitionDecision alloc];
        __int16 v23 = &__block_literal_global_380;
        goto LABEL_70;
      }
      if (v42 == 4)
      {
        uint64_t v45 = [SMSessionStateTransitionDecision alloc];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_376;
        v69[3] = &unk_1E6B91220;
        v69[4] = self;
        id v70 = v6;
        unint64_t v71 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v45 initWithIsAllowed:1 actionBlock:v69];
        __int16 v21 = v70;
        goto LABEL_74;
      }
      if (v42 == 12)
      {
        uint64_t v46 = [SMSessionStateTransitionDecision alloc];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_374;
        v75[3] = &unk_1E6B91220;
        v75[4] = self;
        id v76 = v6;
        unint64_t v77 = a4;
        BOOL v20 = [(SMSessionStateTransitionDecision *)v46 initWithIsAllowed:1 actionBlock:v75];
        __int16 v21 = v76;
        goto LABEL_74;
      }
      if (v42 != 14) {
        goto LABEL_57;
      }
      int v43 = [SMSessionStateTransitionDecision alloc];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5_377;
      v66[3] = &unk_1E6B91220;
      v66[4] = self;
      id v67 = v6;
      unint64_t v68 = a4;
      BOOL v20 = [(SMSessionStateTransitionDecision *)v43 initWithIsAllowed:1 actionBlock:v66];
      __int16 v21 = v67;
LABEL_74:

LABEL_75:
      return v20;
    default:
      int v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v61 = [(SMSessionManager *)self state];
        uint64_t v62 = [v61 sessionState];
        *(_DWORD *)long long buf = 136315394;
        v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
        __int16 v149 = 2048;
        uint64_t v150 = v62;
        _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "%s, UNHANDLED FROM STATE, %lu", buf, 0x16u);
      }
      __int16 v22 = [SMSessionStateTransitionDecision alloc];
      __int16 v23 = &__block_literal_global_387;
      goto LABEL_70;
  }
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [MEMORY[0x1E4F99808] endActivities];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  [*(id *)(a1 + 32) _bootstrapHysteresisState];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  [*(id *)(a1 + 32) _bootstrapHysteresisState];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  if (*(void *)(a1 + 48) != 5) {
    [*(id *)(a1 + 32) _setupAnomalyAlertsOnResume];
  }
  [*(id *)(a1 + 32) _bootstrapHysteresisState];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  [*(id *)(a1 + 32) _setupAnomalyAlertsOnResume];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  [*(id *)(a1 + 32) _bootstrapHysteresisState];
  [*(id *)(a1 + 32) _reconnectCarouselSessionAndSetupTimer];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForSessionResume];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [*(id *)(a1 + 32) _updateUnsupportedSeparationStateIfNeededWithNotify:0];
  [*(id *)(a1 + 32) _notifyObserversForStart];
  [MEMORY[0x1E4F99808] startActivityWithState:*(void *)(a1 + 40) localState:*(void *)(*(void *)(a1 + 32) + 16)];
  double v5 = [*(id *)(a1 + 32) sessionMetricManager];
  [v5 onSessionStartedWithState:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v6 _performActionsAndUpdatesUponStateTransitionWithType:v7];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [MEMORY[0x1E4F99808] endActivities];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [*(id *)(a1 + 32) _postEndAwarenessLiveActivity];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _postAnomalyAlert];
  [*(id *)(a1 + 32) _performActionsAndUpdatesUponStateTransitionWithType:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) sessionMetricManager];
  double v5 = [*(id *)(*(void *)(a1 + 32) + 8) monitorContext];
  [v6 onDeclareAnomalyForTriggerCategory:[v5 triggerCategory]];
}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_20(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _checkDefaultsForCacheReleaseDateWithState:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _postCacheReleaseAndUpdatingWithTargetDate:v5];
  [*(id *)(a1 + 32) _performActionsAndUpdatesUponStateTransitionWithType:*(void *)(a1 + 48)];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_21(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = [v2 configuration];
  int v4 = [*(id *)(a1 + 40) configuration];
  int v5 = [v3 isEqual:v4];

  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    BOOL v13 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]_block_invoke_21";
    __int16 v14 = 1024;
    int v15 = v5 ^ 1;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, isSessionConfigChanged, %{Bool}d", (uint8_t *)&v12, 0x12u);
  }

  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v7;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:*(void *)(a1 + 48)];
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10 == 3)
  {
    [*(id *)(a1 + 32) _notifyObserversForBecomingNonActiveDevice];
  }
  else if (v10 == 2)
  {
    [*(id *)(a1 + 32) _notifyObserversForBecomingActiveDevice];
  }
  else if (v10 == 1 && (v5 & 1) == 0)
  {
    [*(id *)(a1 + 32) _notifyObserversForConfigurationChange];
  }
  return [*(id *)(a1 + 32) _performActionsAndUpdatesUponStateTransitionWithType:*(void *)(a1 + 48)];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_364(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [*(id *)(a1 + 32) _stopPlayingCacheReleaseAndUpdatingSound];
  [MEMORY[0x1E4F99808] endActivities];
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_365(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopPlayingCacheReleaseAndUpdatingSound];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [*(id *)(a1 + 32) _postEndAwarenessLiveActivity];
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_366(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5 == 3)
  {
    [*(id *)(a1 + 32) _notifyObserversForBecomingNonActiveDevice];
  }
  else if (v5 == 2)
  {
    [*(id *)(a1 + 32) _notifyObserversForBecomingActiveDevice];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v6 _performActionsAndUpdatesUponStateTransitionWithType:v7];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6_370(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:2];
  [*(id *)(a1 + 32) _notifyObserversForBecomingActiveDevice];
  [*(id *)(a1 + 32) _bootstrapHysteresisState];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_371(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:3];
  [*(id *)(a1 + 32) _notifyObserversForBecomingNonActiveDevice];
  [*(id *)(a1 + 32) _teardownAnomalyAlerts];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8_372(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:*(void *)(a1 + 48)];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_373(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownAnomalyAlerts];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [MEMORY[0x1E4F99808] endActivities];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_374(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownAnomalyAlerts];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForSessionEndForActiveDevice:[*(id *)(a1 + 32) _isActiveDevice]];
  [*(id *)(a1 + 32) _initializeUserDisabledConnectivityWatchDefault];
  [*(id *)(a1 + 32) _postEndAwarenessLiveActivity];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_375(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownAnomalyAlerts];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForTriggerResponse];
  [*(id *)(a1 + 32) _notifyObserversForConfigurationChange];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_376(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownAnomalyAlerts];
  id v5 = [*(id *)(a1 + 32) _checkDefaultsForCacheReleaseDateWithState:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [*(id *)(a1 + 32) _notifyObserversForTriggerResponse];
  [*(id *)(a1 + 32) _postCacheReleaseAndUpdatingWithTargetDate:v5];
  [*(id *)(a1 + 32) _performActionsAndUpdatesUponStateTransitionWithType:*(void *)(a1 + 48)];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5_377(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:*(void *)(a1 + 48)];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_381(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateScreenLockMonitor];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1 + 32) _notifyObserversForStateChangeWithTransitionType:1];
  [MEMORY[0x1E4F99808] endActivities];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _performActionsAndUpdatesUponStateTransitionWithType:v6];
}

- (void)_setPendingSendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "-[SMSessionManager _setPendingSendSessionEndMessageWithReason:associatedGUID:]";
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, reason, %ld, associatedGUID, %@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v8 = [(SMSessionManager *)self defaultsManager];
  __int16 v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"];

  uint64_t v10 = [(SMSessionManager *)self defaultsManager];
  [v10 setObject:v6 forKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"];
}

- (void)_resetPendingSendSessionEndMessage
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SMSessionManager _resetPendingSendSessionEndMessage]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [(SMSessionManager *)self defaultsManager];
  [v4 setObject:0 forKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"];

  id v5 = [(SMSessionManager *)self defaultsManager];
  [v5 setObject:0 forKey:@"RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"];
}

- (void)_setupTimerAndLockMonitorForEndAwareness
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMSessionManager *)self endAwarenessBeforeUnlockXPCTimerAlarm];
  [(SMSessionManager *)self _invalidateTimer:v3];

  [(SMSessionManager *)self _invalidateScreenLockMonitor];
  objc_initWeak(&location, self);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__167;
  v42[4] = __Block_byref_object_dispose__167;
  int v4 = [(SMSessionManagerState *)self->_state configuration];
  id v43 = [v4 sessionID];

  id v5 = [RTXPCTimerAlarm alloc];
  int v6 = [(SMSessionManager *)self queue];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke;
  v40[3] = &unk_1E6B9CEB8;
  v40[4] = self;
  objc_copyWeak(&v41, &location);
  v40[5] = v42;
  uint64_t v7 = [(RTXPCTimerAlarm *)v5 initWithIdentifier:@"com.apple.routined.safetyMonitor.sessionManager.endAwarenessBeforeUnlock" queue:v6 handler:v40];
  [(SMSessionManager *)self setEndAwarenessBeforeUnlockXPCTimerAlarm:v7];

  uint64_t v8 = [(SMSessionManager *)self defaultsManager];
  __int16 v9 = [v8 objectForKey:@"RTDefaultsSessionManagerEndAwarenessBeforeUnlockTimerDurationKey"];

  if (v9)
  {
    uint64_t v10 = [(SMSessionManager *)self defaultsManager];
    int v11 = [v10 objectForKey:@"RTDefaultsSessionManagerEndAwarenessBeforeUnlockTimerDurationKey"];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F99A40];
  }
  unint64_t v14 = [(SMSessionManager *)self state];
  __int16 v15 = [v14 sessionStateTransitionDate];
  id v16 = [v15 dateByAddingTimeInterval:v13];

  uint64_t v17 = [(SMSessionManager *)self endAwarenessBeforeUnlockXPCTimerAlarm];
  id v39 = 0;
  [v17 fireWithDate:v16 error:&v39];
  id v18 = v39;

  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    BOOL v20 = [(SMSessionManager *)self endAwarenessBeforeUnlockXPCTimerAlarm];
    __int16 v21 = [v20 identifier];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v46 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]";
    __int16 v47 = 2112;
    long long v48 = v21;
    __int16 v49 = 2112;
    id v50 = v16;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, %@, set with end date, %@", buf, 0x20u);
  }
  if (v18)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      __int16 v29 = [(SMSessionManager *)self endAwarenessBeforeUnlockXPCTimerAlarm];
      int v30 = [v29 identifier];
      uint64_t v31 = [v18 localizedDescription];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v46 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]";
      __int16 v47 = 2112;
      long long v48 = v30;
      __int16 v49 = 2112;
      id v50 = v31;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "%s, %@, unable to start timer error, %@", buf, 0x20u);
    }
  }
  __int16 v23 = [(SMSessionManagerState *)self->_state configuration];
  id v24 = [v23 sessionID];

  objc_initWeak((id *)buf, self);
  uint64_t v25 = [SMScreenLockMonitor alloc];
  uint64_t v26 = [(SMSessionManager *)self queue];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  char v34 = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_393;
  uint64_t v35 = &unk_1E6B9CEE0;
  objc_copyWeak(&v38, (id *)buf);
  BOOL v36 = self;
  id v27 = v24;
  id v37 = v27;
  uint64_t v28 = [(SMScreenLockMonitor *)v25 initWithQueue:v26 handler:&v32];
  -[SMSessionManager setScreenLockMonitor:](self, "setScreenLockMonitor:", v28, v32, v33, v34, v35, v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);

  objc_destroyWeak(&v41);
  _Block_object_dispose(v42, 8);

  objc_destroyWeak(&location);
}

void __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) endAwarenessBeforeUnlockXPCTimerAlarm];
    int v4 = [v3 identifier];
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@ expired in SMSessionManager", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) _invalidateScreenLockMonitor];
  int v6 = [WeakRetained endAwarenessBeforeUnlockXPCTimerAlarm];
  [WeakRetained _invalidateTimer:v6];

  [WeakRetained terminateSessionWithSessionID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_393(id *a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = "NO";
    if (a2) {
      int v6 = "YES";
    }
    *(_DWORD *)long long buf = 136315394;
    __int16 v22 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]_block_invoke";
    __int16 v23 = 2080;
    id v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, screen lock status changed isDeviceLocked, %s", buf, 0x16u);
  }

  if ((a2 & 1) == 0)
  {
    [WeakRetained _invalidateScreenLockMonitor];
    int v7 = [WeakRetained endAwarenessBeforeUnlockXPCTimerAlarm];
    [WeakRetained _invalidateTimer:v7];

    uint64_t v8 = [a1[4] defaultsManager];
    uint64_t v9 = [v8 objectForKey:@"RTDefaultsSessionManagerEndAwarenessAfterUnlockTimerDurationKey"];

    if (v9)
    {
      uint64_t v10 = [a1[4] defaultsManager];
      int v11 = [v10 objectForKey:@"RTDefaultsSessionManagerEndAwarenessAfterUnlockTimerDurationKey"];
      [v11 doubleValue];
      double v13 = v12;
    }
    else
    {
      double v13 = *MEMORY[0x1E4F99A38];
    }
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    __int16 v15 = [WeakRetained queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_397;
    v18[3] = &unk_1E6B90BF0;
    id v16 = a1[5];
    id v17 = a1[4];
    id v19 = v16;
    id v20 = v17;
    dispatch_after(v14, v15, v18);
  }
}

uint64_t __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_397(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    int v6 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%s, terminating session after awareness, sessionID, %@", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 40) _terminateSessionWithSessionID:*(void *)(a1 + 32)];
}

- (void)_setUpCacheReleaseTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMSessionManager *)self cacheReleaseXPCTimerAlarm];
  [(SMSessionManager *)self _invalidateTimer:v3];

  objc_initWeak(&location, self);
  uint64_t v4 = [RTXPCTimerAlarm alloc];
  uint64_t v5 = cacheReleaseXPCTimerAlarmIdentifier;
  int v6 = [(SMSessionManager *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke;
  id v17[3] = &unk_1E6B92EA0;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  __int16 v7 = [(RTXPCTimerAlarm *)v4 initWithIdentifier:v5 queue:v6 handler:v17];
  [(SMSessionManager *)self setCacheReleaseXPCTimerAlarm:v7];

  uint64_t v8 = [(SMSessionManager *)self state];
  uint64_t v9 = [v8 sessionStateTransitionDate];
  [(SMSessionManager *)self cacheReleaseMaxDuration];
  uint64_t v10 = [v9 dateByAddingTimeInterval:];

  int v11 = [(SMSessionManager *)self cacheReleaseXPCTimerAlarm];
  id v16 = 0;
  [v11 fireWithDate:v10 error:&v16];
  id v12 = v16;

  double v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v21 = "-[SMSessionManager _setUpCacheReleaseTimer]";
    __int16 v22 = 2112;
    __int16 v23 = v10;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, timer set with end date, %@", buf, 0x16u);
  }

  if (v12)
  {
    dispatch_time_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      __int16 v15 = [v12 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      __int16 v21 = "-[SMSessionManager _setUpCacheReleaseTimer]";
      __int16 v22 = 2112;
      __int16 v23 = v15;
      _os_log_fault_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_FAULT, "%s cacheReleaseXPCTimerAlarm fireWithDate hit error: %@", buf, 0x16u);
    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) cacheReleaseXPCTimerAlarm];
    uint64_t v4 = [v3 identifier];
    int v9 = 136315394;
    uint64_t v10 = "-[SMSessionManager _setUpCacheReleaseTimer]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired in SMSessionManager", (uint8_t *)&v9, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = [WeakRetained cacheReleaseXPCTimerAlarm];
  [WeakRetained _invalidateTimer:v6];

  __int16 v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  uint64_t v8 = [v7 sessionID];
  [WeakRetained _endSessionForSessionID:v8 reason:3 handler:&__block_literal_global_400];
}

void __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke_398(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 localizedDescription];
      int v5 = 136315394;
      int v6 = "-[SMSessionManager _setUpCacheReleaseTimer]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%s, error ending session: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_postCacheReleaseAndUpdatingWithTargetDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  if ([(SMSessionManager *)self _shouldAlertNowWithTargetAlertDate:v4])
  {
    int v6 = [(SMSessionManager *)self state];
    [(SMSessionManager *)self _updateActivityWithState:v6];

    __int16 v7 = (void *)MEMORY[0x1E4F99968];
    uint64_t v8 = [(SMSessionManager *)self state];
    uint64_t v9 = [v8 monitorContext];
    LOBYTE(v7) = [v7 isSOSTriggerCategory:[v9 triggerCategory]];

    if ((v7 & 1) == 0) {
      [(SMSessionManager *)self _playCacheReleaseAndUpdatingSound];
    }
    uint64_t v10 = [(SMSessionManager *)self carPlayAlertManager];
    __int16 v11 = [(SMSessionManager *)self state];
    [v10 postCarPlayNotificationForNotificationType:5 sessionManagerState:v11 handler:0];
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, current time exceeds the alert target allowance, target date, %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_playCacheReleaseAndUpdatingSound
{
  dispatch_time_t v3 = dispatch_time(0, 700000000);
  id v4 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_after(v3, v4, block);
}

void __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) _stopPlayingCacheReleaseAndUpdatingSound];
  dispatch_time_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:18];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.wav"];
  [v3 setExternalToneFileURL:v4];

  int v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.plist"];
  [v3 setExternalVibrationPatternFileURL:v5];

  [v3 setShouldIgnoreRingerSwitch:1];
  int v6 = [*v2 defaultsManager];
  __int16 v7 = [v6 objectForKey:@"RTDefaultsSessionManagerShouldIgnoreRingerSwitchKey"];

  if (v7) {
    [v3 setShouldIgnoreRingerSwitch:[v7 BOOLValue]];
  }
  uint64_t v8 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v3];
  [*(id *)(a1 + 32) setCacheReleaseTLAlert:v8];

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v14 = "-[SMSessionManager _playCacheReleaseAndUpdatingSound]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%s, playing cache release sound alertConfiguration,%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v10 = [*(id *)(a1 + 32) cacheReleaseTLAlert];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke_407;
  v11[3] = &unk_1E6B9A6F8;
  objc_copyWeak(&v12, (id *)buf);
  [v10 playWithCompletionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke_407(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromTLAlertPlaybackCompletionType();
    int v10 = 138413058;
    __int16 v11 = v8;
    __int16 v12 = 2080;
    uint64_t v13 = "-[SMSessionManager _playCacheReleaseAndUpdatingSound]_block_invoke";
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@, %s, cache release play completion called, playbackCompletionType, %@, error, %@", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)_stopPlayingCacheReleaseAndUpdatingSound
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SMSessionManager *)self cacheReleaseTLAlert];
    int v7 = 136315394;
    uint64_t v8 = "-[SMSessionManager _stopPlayingCacheReleaseAndUpdatingSound]";
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "%s, stopping cache release sound alert,%@", (uint8_t *)&v7, 0x16u);
  }
  int v5 = [(SMSessionManager *)self cacheReleaseTLAlert];

  if (v5)
  {
    int v6 = [(SMSessionManager *)self cacheReleaseTLAlert];
    [v6 stop];

    [(SMSessionManager *)self setCacheReleaseTLAlert:0];
  }
}

- (BOOL)_shouldAlertNowWithTargetAlertDate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SMSessionManager *)self defaultsManager];
  int v6 = [NSNumber numberWithDouble:300.0];
  int v7 = [v5 objectForKey:@"RTDefaultsSessionManagerCacheReleaseAlertDelayAllowanceKey" value:v6];
  [v7 doubleValue];
  double v9 = v8;

  int v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v4];
  double v12 = v11;

  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = @"NO";
    int v16 = 136315906;
    id v17 = "-[SMSessionManager _shouldAlertNowWithTargetAlertDate:]";
    __int16 v18 = 2112;
    id v19 = v4;
    if (v12 <= v9) {
      __int16 v15 = @"YES";
    }
    __int16 v20 = 2048;
    double v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%s, targetDate, %@, allowance, %f, shouldAlert, %@", (uint8_t *)&v16, 0x2Au);
  }

  return v12 <= v9;
}

- (void)_postAnomalyAlert
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    __int16 v18 = "-[SMSessionManager _postAnomalyAlert]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v17, 0xCu);
  }

  id v4 = [(SMSessionManager *)self state];
  char v5 = [v4 isPromptState];

  if ((v5 & 1) == 0)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    int v16 = [(SMSessionManager *)self state];
    int v17 = 136315394;
    __int16 v18 = "-[SMSessionManager _postAnomalyAlert]";
    __int16 v19 = 2112;
    __int16 v20 = v16;
    _os_log_fault_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_FAULT, "%s, unexpected state for anomaly alert, %@", (uint8_t *)&v17, 0x16u);
LABEL_14:

    goto LABEL_15;
  }
  int v6 = [(SMSessionManager *)self state];
  int v7 = [v6 sessionStateTransitionDate];

  double v8 = [(SMSessionManager *)self state];
  if ([v8 sessionState] == 9)
  {
    double v9 = [(SMSessionManager *)self state];
    int v10 = [v9 configuration];
    double v11 = [v10 time];
    double v12 = [v11 timeBound];

    if (!v12) {
      goto LABEL_8;
    }
    double v8 = [(SMSessionManager *)self state];
    uint64_t v13 = [v8 configuration];
    __int16 v14 = [v13 time];
    uint64_t v15 = [v14 timeBound];

    int v7 = v15;
  }

LABEL_8:
  if (![(SMSessionManager *)self _shouldAlertNowWithTargetAlertDate:v7])
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      __int16 v18 = "-[SMSessionManager _postAnomalyAlert]";
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%s, current time exceeds the alert target allowance, target date, %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_14;
  }
  [(SMSessionManager *)self _setupAnomalyAlerts];
LABEL_15:
}

- (void)_teardownAnomalyAlerts
{
  dispatch_time_t v3 = [(SMSessionManager *)self anomalyAlertManager];

  if (v3)
  {
    id v4 = [(SMSessionManager *)self anomalyAlertManager];
    [v4 stop];

    [(SMSessionManager *)self setAnomalyAlertManager:0];
  }
}

- (void)_setupAnomalyAlerts
{
  [(SMSessionManager *)self _teardownAnomalyAlerts];
  dispatch_time_t v3 = [SMAnomalyAlertManager alloc];
  id v4 = [(SMSessionManager *)self queue];
  char v5 = [(SMSessionManager *)self state];
  int v6 = [(SMSessionManager *)self defaultsManager];
  int v7 = [(SMSessionManager *)self carPlayAlertManager];
  double v8 = [(SMAnomalyAlertManager *)v3 initWithQueue:v4 anomalyState:v5 defaultsManager:v6 carPlayAlertManager:v7];
  [(SMSessionManager *)self setAnomalyAlertManager:v8];

  id v9 = [(SMSessionManager *)self anomalyAlertManager];
  [v9 start];
}

- (void)_setupAnomalyAlertsOnResume
{
  [(SMSessionManager *)self _teardownAnomalyAlerts];
  dispatch_time_t v3 = [SMAnomalyAlertManager alloc];
  id v4 = [(SMSessionManager *)self queue];
  char v5 = [(SMSessionManager *)self state];
  int v6 = [(SMSessionManager *)self defaultsManager];
  int v7 = [(SMSessionManager *)self carPlayAlertManager];
  double v8 = [(SMAnomalyAlertManager *)v3 initWithQueue:v4 anomalyState:v5 defaultsManager:v6 carPlayAlertManager:v7];
  [(SMSessionManager *)self setAnomalyAlertManager:v8];

  id v9 = [(SMSessionManager *)self anomalyAlertManager];
  [v9 resume];
}

- (void)_setupTimerForAnomaly
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v24 = "-[SMSessionManager _setupTimerForAnomaly]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v4 = [(SMSessionManager *)self state];
  char v5 = [v4 isPromptState];

  if (v5)
  {
    int v6 = [(SMSessionManager *)self checkInXPCTimerAlarm];
    [(SMSessionManager *)self _invalidateTimer:v6];

    objc_initWeak(&location, self);
    int v7 = [RTXPCTimerAlarm alloc];
    double v8 = [(SMSessionManager *)self queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41__SMSessionManager__setupTimerForAnomaly__block_invoke;
    v20[3] = &unk_1E6B92EA0;
    void v20[4] = self;
    objc_copyWeak(&v21, &location);
    id v9 = [(RTXPCTimerAlarm *)v7 initWithIdentifier:@"com.apple.routined.safetyMonitor.sessionManager.checkInTimerAlarm" queue:v8 handler:v20];
    [(SMSessionManager *)self setCheckInXPCTimerAlarm:v9];

    int v10 = [(SMSessionManager *)self state];
    double v11 = [(SMSessionManager *)self _checkDefaultsForCacheReleaseDateWithState:v10];

    double v12 = [(SMSessionManager *)self checkInXPCTimerAlarm];
    id v19 = 0;
    [v12 fireWithDate:v11 error:&v19];
    id v13 = v19;

    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v24 = "-[SMSessionManager _setupTimerForAnomaly]";
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, timer set with end date, %@", buf, 0x16u);
    }

    if (v13)
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        __int16 v18 = [v13 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v24 = "-[SMSessionManager _setupTimerForAnomaly]";
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "%s checkInXPCTimerAlarm fireWithDate hit error: %@", buf, 0x16u);
      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v17 = [(SMSessionManager *)self state];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v24 = "-[SMSessionManager _setupTimerForAnomaly]";
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "%s, unexpected state for anomaly alert, %@", buf, 0x16u);
    }
  }
}

void __41__SMSessionManager__setupTimerForAnomaly__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) checkInXPCTimerAlarm];
    id v4 = [v3 identifier];
    int v9 = 136315394;
    int v10 = "-[SMSessionManager _setupTimerForAnomaly]_block_invoke";
    __int16 v11 = 2112;
    double v12 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired in SMSessionManager", (uint8_t *)&v9, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = [WeakRetained checkInXPCTimerAlarm];
  [WeakRetained _invalidateTimer:v6];

  int v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  double v8 = [v7 sessionID];
  [WeakRetained _respondToTriggerPromptForSessionID:v8 response:1 handler:&__block_literal_global_414];
}

void __41__SMSessionManager__setupTimerForAnomaly__block_invoke_412(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    char v5 = "-[SMSessionManager _setupTimerForAnomaly]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, respondToTriggerPromptWithResponse, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)_performStateTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (void (**)(id, void))a5;
  __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v12 = (void *)MEMORY[0x1E4F99950];
    uint64_t v13 = [(SMSessionManager *)self state];
    __int16 v14 = [v12 convertSessionStateToString:[v13 sessionState]];
    uint64_t v15 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v9 sessionState]];
    *(_DWORD *)long long buf = 136315906;
    __int16 v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
    __int16 v57 = 2048;
    unint64_t v58 = a4;
    __int16 v59 = 2112;
    v60 = v14;
    __int16 v61 = 2112;
    uint64_t v62 = v15;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, Attempting state transition type %ld from %@ to %@", buf, 0x2Au);
  }
  int v16 = [(SMSessionManager *)self state];
  uint64_t v52 = [v16 sessionState];

  int v17 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setDate:v17];

  __int16 v18 = [(SMSessionManager *)self state];
  uint64_t v19 = [v18 sessionState];
  uint64_t v20 = [v9 sessionState];

  if (v19 != v20)
  {
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setSessionStateTransitionDate:v21];
  }
  if (a4 == 1)
  {
    __int16 v22 = [(SMSessionManager *)self messagingService];
    __int16 v23 = [v22 deviceIdentifier];
    [v9 setActiveDeviceIdentifier:v23];
  }
  uint64_t v24 = [(SMSessionManager *)self lastLocation];
  uint64_t v25 = [v24 timestamp];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
    [(SMSessionManager *)self lastLocation];
    __int16 v29 = v28 = a2;
    int v30 = [v29 timestamp];
    [v27 timeIntervalSinceDate:v30];
    double v32 = v31;

    a2 = v28;
    if (v32 <= 60.0)
    {
      uint64_t v33 = [(SMSessionManager *)self lastLocation];
      [v9 setLocation:v33];

      goto LABEL_12;
    }
  }
  else
  {
  }
  [v9 setLocation:0];
LABEL_12:
  char v34 = [(SMSessionManager *)self _stateTransitionDecisionToState:v9 transitionType:a4];
  char v35 = [v34 isAllowed];
  if (v35)
  {
    [(SMSessionManager *)self logSignPostForStateTransition:v9];
    BOOL v36 = [v34 actionBlock];
    v36[2]();

    id v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = [MEMORY[0x1E4F99950] convertSessionStateToString:v52];
      id v39 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v9 sessionState]];
      *(_DWORD *)long long buf = 136315650;
      __int16 v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
      __int16 v57 = 2112;
      unint64_t v58 = (unint64_t)v38;
      __int16 v59 = 2112;
      v60 = v39;
      _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%s, Successful state transition from %@ to %@", buf, 0x20u);
    }
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      long long v48 = (void *)MEMORY[0x1E4F99950];
      __int16 v49 = [(SMSessionManager *)self state];
      id v50 = [v48 convertSessionStateToString:[v49 sessionState]];
      uint64_t v51 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v9 sessionState]];
      *(_DWORD *)long long buf = 136315650;
      __int16 v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
      __int16 v57 = 2112;
      unint64_t v58 = (unint64_t)v50;
      __int16 v59 = 2112;
      v60 = v51;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%s, Invalid transition from %@ to %@", buf, 0x20u);
    }
    if (v10)
    {
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v41 = NSString;
      uint64_t v42 = NSStringFromSelector(a2);
      id v43 = [v41 stringWithFormat:@"%@, cannot be completed due illegal state transition", v42];
      id v54 = v43;
      __int16 v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];

      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = (void *)[v45 initWithDomain:*MEMORY[0x1E4F99A48] code:16 userInfo:v44];
      ((void (**)(id, void *))v10)[2](v10, v46);
    }
  }

  return v35;
}

- (void)_performStateSyncOriginatedTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (void (**)(id, void *))a5;
  p_state = &self->_state;
  int v12 = [(SMSessionManagerState *)self->_state isEqual:v9];
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  __int16 v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
      __int16 v78 = 2112;
      id v79 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, identical state sync state transition requested, %@", buf, 0x16u);
    }
LABEL_77:

    goto LABEL_78;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [(SMSessionManager *)self state];
    *(_DWORD *)long long buf = 136315650;
    unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
    __int16 v78 = 2112;
    id v79 = v15;
    __int16 v80 = 2112;
    id v81 = v9;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, state transition originated by a state sync message, %@, to state, %@", buf, 0x20u);
  }
  if (a4 != 3)
  {
    if (a4 == 2)
    {
      int v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%s, SMStateTransitionTypeHandoffBecomeActive should never reach this method", buf, 0xCu);
      }

      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F99A48];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      uint64_t v19 = [NSString stringWithFormat:@"Invalid Parameter TypeHandoffBecomeActive"];
      long long v75 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v21 = (void *)[v17 initWithDomain:v18 code:7 userInfo:v20];

LABEL_20:
      v10[2](v10, v21);
LABEL_21:

      goto LABEL_78;
    }
LABEL_13:
    __int16 v14 = [(SMSessionManagerState *)self->_state copy];
    objc_storeStrong((id *)&self->_state, a3);
    [(SMSessionManager *)self _notifyObserversForStateChangeWithTransitionType:a4];
    BOOL v25 = [(SMSessionManager *)self _isRemoteSessionEndForPreviousState:v14 nextState:v9];
    switch([v14 sessionState])
    {
      case 1:
      case 10:
      case 11:
        unint64_t v32 = [v9 sessionState];
        if (v32 > 0xE) {
          goto LABEL_26;
        }
        if (((1 << v32) & 0x5390) != 0) {
          goto LABEL_24;
        }
        if (v32 == 2)
        {
          __int16 v47 = [v9 activePairedDeviceIdentifier];
          long long v48 = [(SMSessionManager *)self messagingService];
          __int16 v49 = [v48 deviceIdentifier];
          if ([v47 isEqual:v49]
            && [(SMSessionManager *)self _isEffectivePairedDeviceNearby])
          {
            unint64_t v71 = [v9 startMessageGUID];

            if (v71)
            {
              id v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 136315650;
                unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
                __int16 v78 = 2112;
                id v79 = v14;
                __int16 v80 = 2112;
                id v81 = v9;
                _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, calling _handleMagnetConnect to evaluate if a handoff is needed", buf, 0x20u);
              }

              [(SMSessionManager *)self _handleMagnetConnect:3];
            }
          }
          else
          {
          }
          id v67 = [(SMSessionManager *)self sessionMetricManager];
          [v67 onSessionStartedWithState:v9];

          [(SMSessionManager *)self _updateUnsupportedSeparationStateIfNeededWithNotify:0];
LABEL_24:
          uint64_t v33 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
          BOOL v34 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v33];

          if (v34) {
            [MEMORY[0x1E4F99808] startActivityWithState:v9 localState:self->_localState];
          }
        }
LABEL_26:
        switch([v9 sessionState])
        {
          case 0:
          case 1:
            goto LABEL_54;
          case 2:
            if (a4 == 3)
            {
              [(SMSessionManager *)self _notifyObserversForBecomingNonActiveDevice];
            }
            else
            {
              if (a4 != 1) {
                goto LABEL_75;
              }
              uint64_t v55 = [v9 activePairedDeviceIdentifier];
              __int16 v56 = [(SMSessionManager *)self messagingService];
              __int16 v57 = [v56 deviceIdentifier];
              if (![v55 isEqual:v57]
                || ![(SMSessionManager *)self _isEffectivePairedDeviceNearby])
              {
                goto LABEL_63;
              }
              unint64_t v58 = [v14 startMessageGUID];
              if (v58)
              {

LABEL_63:
                goto LABEL_64;
              }
              long long v69 = [v9 startMessageGUID];

              if (v69)
              {
                id v70 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 136315650;
                  unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
                  __int16 v78 = 2112;
                  id v79 = v14;
                  __int16 v80 = 2112;
                  id v81 = v9;
                  _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, calling _handleMagnetConnect to evaluate if a handoff is needed", buf, 0x20u);
                }

                [(SMSessionManager *)self _handleMagnetConnect:3];
              }
LABEL_64:
              id v37 = [(SMSessionManager *)self state];
              [(SMSessionManager *)self _updateActivityWithState:v37 shouldNotify:0];
LABEL_71:
            }
            break;
          case 4:
            __int16 v59 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v60 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v59];

            if (v60) {
              goto LABEL_70;
            }
            goto LABEL_75;
          case 7:
          case 8:
          case 9:
          case 14:
            char v35 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v36 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v35];

            if (!v36) {
              goto LABEL_75;
            }
            [(SMSessionManager *)self _postAnomalyAlert];
            id v37 = [(SMSessionManager *)self sessionMetricManager];
            id v38 = [(SMSessionManagerState *)self->_state monitorContext];
            [v37 onDeclareAnomalyForTriggerCategory:[v38 triggerCategory]];

            goto LABEL_71;
          case 12:
            objc_storeStrong((id *)&self->_state, a3);
            __int16 v61 = [(SMSessionManager *)self state];
            [(SMSessionManager *)self _updateActivityWithState:v61 shouldNotify:1];

            goto LABEL_74;
          default:
            goto LABEL_75;
        }
        goto LABEL_75;
      case 2:
        goto LABEL_26;
      case 4:
      case 7:
      case 8:
      case 9:
        uint64_t v26 = [v14 sessionState];
        if (v26 == [v9 sessionState])
        {
          if (a4 == 3) {
            [(SMSessionManager *)self _notifyObserversForBecomingNonActiveDevice];
          }
        }
        else if ([v9 sessionState] == 4)
        {
          id v41 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
          BOOL v42 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v41];

          if (v42)
          {
            [(SMSessionManager *)self _teardownAnomalyAlerts];
            id v43 = [(SMSessionManager *)self _checkDefaultsForCacheReleaseDateWithState:v14];
            [(SMSessionManager *)self _postCacheReleaseAndUpdatingWithTargetDate:v43];
          }
        }
        else
        {
          if ([v9 sessionState] == 2)
          {
LABEL_55:
            uint64_t v52 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v53 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v52];

            if (v53)
            {
              id v54 = [(SMSessionManager *)self state];
              [(SMSessionManager *)self _updateActivityWithState:v54 shouldNotify:0];

              [(SMSessionManager *)self _teardownAnomalyAlerts];
            }
LABEL_75:
            [(SMSessionManager *)self _performActionsAndUpdatesUponStateTransitionWithType:a4];
            if (v10) {
              v10[2](v10, 0);
            }
            goto LABEL_77;
          }
          if ([v9 isEndSessionState])
          {
            __int16 v44 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v45 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v44];

            if (v45)
            {
              uint64_t v46 = [(SMSessionManager *)self state];
              [(SMSessionManager *)self _updateActivityWithState:v46 shouldNotify:1];

              [(SMSessionManager *)self _teardownAnomalyAlerts];
            }
            [(SMSessionManager *)self _notifyObserversForSessionEndForActiveDevice:[(SMSessionManager *)self _isActiveDevice]];
          }
        }
        if (v25) {
          [MEMORY[0x1E4F99808] endActivities];
        }
        goto LABEL_75;
      case 12:
        if ([v9 sessionState] == 1)
        {
          [(SMSessionManager *)self _clearHysteresisState];
          [MEMORY[0x1E4F99808] endActivities];
        }
        else
        {
          uint64_t v51 = [(SMSessionManager *)self state];
          [(SMSessionManager *)self _updateActivityWithState:v51 shouldNotify:0];
        }
        goto LABEL_53;
      case 14:
LABEL_53:
        switch([v9 sessionState])
        {
          case 0:
          case 14:
            goto LABEL_75;
          case 1:
LABEL_54:
            [(SMSessionManager *)self _clearHysteresisState];
            [MEMORY[0x1E4F99808] endActivities];
            goto LABEL_74;
          case 2:
            goto LABEL_55;
          case 4:
            uint64_t v62 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v63 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v62];

            if (!v63) {
              goto LABEL_75;
            }
            [(SMSessionManager *)self _teardownAnomalyAlerts];
LABEL_70:
            id v37 = [(SMSessionManager *)self _checkDefaultsForCacheReleaseDateWithState:v14];
            [(SMSessionManager *)self _postCacheReleaseAndUpdatingWithTargetDate:v37];
            goto LABEL_71;
          case 12:
            id v64 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
            BOOL v65 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v64];

            if (v65)
            {
              uint64_t v66 = [(SMSessionManager *)self state];
              [(SMSessionManager *)self _updateActivityWithState:v66 shouldNotify:1];

              [(SMSessionManager *)self _teardownAnomalyAlerts];
            }
LABEL_74:
            [(SMSessionManager *)self _notifyObserversForSessionEndForActiveDevice:[(SMSessionManager *)self _isActiveDevice]];
            goto LABEL_75;
          default:
            goto LABEL_64;
        }
      default:
        goto LABEL_75;
    }
  }
  __int16 v22 = [(SMSessionManager *)self state];
  uint64_t v23 = [v22 sessionState];
  uint64_t v24 = [v9 sessionState];

  if (v23 != v24)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      unint64_t v68 = [(SMSessionManager *)self state];
      *(_DWORD *)long long buf = 136315650;
      unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
      __int16 v78 = 2112;
      id v79 = v68;
      __int16 v80 = 2112;
      id v81 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%s, SMStateTransitionTypeHandoffBecomeNonActive; invalid state transition from %@ to %@",
        buf,
        0x20u);
    }
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F99A48];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    int v30 = [NSString stringWithFormat:@"Invalid State Transition HandoffBecomeNonActive"];
    id v73 = v30;
    double v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v21 = (void *)[v28 initWithDomain:v29 code:16 userInfo:v31];

    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ([(SMSessionManager *)self _isHandoffAllowedInSessionState:[(SMSessionManagerState *)self->_state sessionState]])
  {
    goto LABEL_13;
  }
  id v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    __int16 v40 = *p_state;
    *(_DWORD *)long long buf = 136315650;
    unint64_t v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
    __int16 v78 = 2112;
    id v79 = v40;
    __int16 v80 = 2112;
    id v81 = v9;
    _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, invalid and not allowed for a handoff operation", buf, 0x20u);
  }

  if (v10) {
    v10[2](v10, 0);
  }
LABEL_78:
}

- (BOOL)_isRemoteSessionEndForPreviousState:(id)a3 nextState:(id)a4
{
  id v6 = a4;
  id v7 = [a3 activeDeviceIdentifier];
  uint64_t v8 = [(SMSessionManager *)self messagingService];
  id v9 = [v8 deviceIdentifier];
  if ([v7 isEqual:v9])
  {
    int v10 = [v6 activeDeviceIdentifier];
    __int16 v11 = [(SMSessionManager *)self messagingService];
    int v12 = [v11 deviceIdentifier];
    if ([v10 isEqual:v12]) {
      char v13 = 0;
    }
    else {
      char v13 = [v6 isEndSessionState];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)_performActionsAndUpdatesUponStateTransitionWithType:(unint64_t)a3
{
  [(SMSessionManager *)self _updateTimersUponStateTransition:a3];
  [(SMSessionManager *)self _updateLocationObserverUponStateTransition];

  [(SMSessionManager *)self _updateConnectivityAndStatusSignalsObserverUponStateTransition];
}

- (void)logSignPostForStateTransition:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SMSessionManager *)self state];
  id v6 = [v5 configuration];

  if (!v6) {
    goto LABEL_26;
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = [(SMSessionManager *)self state];
  id v9 = [v8 configuration];
  int v10 = [v9 sessionID];
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v7, v10);

  int v12 = [(SMSessionManager *)self state];
  if ([v12 sessionState] != 11) {
    goto LABEL_7;
  }
  uint64_t v13 = [v4 sessionState];

  if (v13 == 2)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    uint64_t v15 = [v4 configuration];
    int v16 = [v15 sessionID];
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v14, v16);

    id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    int v12 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F99918];
      uint64_t v19 = [v4 configuration];
      [v18 sessionTypeToString:[v19 sessionType]];
      id v20 = objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 UTF8String];
      [MEMORY[0x1E4F99950] convertSessionStateToString:[v4 sessionState]];
      id v22 = objc_claimAutoreleasedReturnValue();
      int v42 = 136446466;
      uint64_t v43 = v21;
      __int16 v44 = 2082;
      uint64_t v45 = [v22 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMSessionDuration", " enableTelemetry=YES {sessionType:%{public, signpost.telemetry:string1}s, currentState:%{public, signpost.telemetry:string2}s}", (uint8_t *)&v42, 0x16u);
    }
LABEL_7:
  }
  if ([v4 sessionState] == 1)
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    uint64_t v24 = v23;
    unint64_t v25 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F99950];
      uint64_t v27 = [(SMSessionManager *)self state];
      [v26 convertSessionStateToString:[v27 sessionState]];
      id v28 = objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v28 UTF8String];
      int v42 = 136446210;
      uint64_t v43 = v29;
      _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v24, OS_SIGNPOST_INTERVAL_END, v11, "SMSessionDuration", " enableTelemetry=YES {currentState:%{public, signpost.telemetry:string2}s}", (uint8_t *)&v42, 0xCu);
    }
  }
  else
  {
    unint64_t v25 = v11 - 1;
  }
  int v30 = (void *)MEMORY[0x1E4F99950];
  double v31 = [(SMSessionManager *)self state];
  unint64_t v32 = [v30 convertSessionStateToString:[v31 sessionState]];

  uint64_t v33 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v4 sessionState]];
  BOOL v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  char v35 = v34;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    uint64_t v36 = [v32 UTF8String];
    uint64_t v37 = [v33 UTF8String];
    int v42 = 136446722;
    uint64_t v43 = v36;
    __int16 v44 = 2082;
    uint64_t v45 = v37;
    __int16 v46 = 2112;
    id v47 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v35, OS_SIGNPOST_INTERVAL_END, v11, "SMSessionStateTransition", " enableTelemetry=YES {currentSessionState:%{public, signpost.telemetry:string1}s, nextSessionState:%{public, signpost.telemetry:string2}s, nextState:%@}", (uint8_t *)&v42, 0x20u);
  }

  if ([v4 sessionState] != 1
    || [v4 sessionState]
    || [v4 sessionState] != 11
    || [v4 sessionState] != 10)
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    id v39 = v38;
    if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      uint64_t v40 = [v32 UTF8String];
      uint64_t v41 = [v33 UTF8String];
      int v42 = 136446722;
      uint64_t v43 = v40;
      __int16 v44 = 2082;
      uint64_t v45 = v41;
      __int16 v46 = 2112;
      id v47 = v4;
      _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMSessionStateTransition", " enableTelemetry=YES {currentSessionState:%{public, signpost.telemetry:string1}s, nextSessionState:%{public, signpost.telemetry:string2}s, nextState:%@}", (uint8_t *)&v42, 0x20u);
    }
  }
LABEL_26:
}

- (void)_updateConnectivityAndStatusSignalsObserverUponStateTransition
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[SMSessionManager _updateConnectivityAndStatusSignalsObserverUponStateTransition]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, updating connectivity and status observers signals", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(SMSessionManager *)self state];
  unint64_t v5 = [v4 sessionState];

  if (v5 > 0xE) {
    goto LABEL_10;
  }
  if (((1 << v5) & 0x4394) != 0)
  {
    id v6 = [(SMSessionManager *)self messagingService];
    [v6 startSubscriptionOnNearbyDevicesChanged];
LABEL_6:

    return;
  }
  if (((1 << v5) & 0x1003) != 0)
  {
    id v7 = [(SMSessionManager *)self messagingService];
    [v7 cancelSubscriptionOnNearbyDevicesChanged];

    [(SMSessionManager *)self _clearHysteresisState];
    return;
  }
  if (((1 << v5) & 0xC00) == 0)
  {
LABEL_10:
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[SMSessionManager _updateConnectivityAndStatusSignalsObserverUponStateTransition]";
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%s, should never reach this code path, logging error.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_6;
  }
}

- (void)_updateLocationObserverUponStateTransition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SMSessionManager *)self _isActiveDevice];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, updating location observers, isActiveDevice, %{Bool}d", (uint8_t *)&v22, 0x12u);
  }

  if (v3)
  {
    unint64_t v5 = [(SMSessionManager *)self state];
    unint64_t v6 = [v5 sessionState];

    if (v6 <= 0xE)
    {
      if (((1 << v6) & 0x4384) != 0)
      {
        id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v22 = 136315138;
          uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, Added rhythmic non waking GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        int v8 = [(SMSessionManager *)self locationManager];
        [v8 removeObserver:self];

        id v9 = [(SMSessionManager *)self locationManager];
        uint64_t v10 = RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking;
LABEL_21:
        id v20 = [(__objc2_class *)v10 notificationName];
        [v9 addObserver:self selector:sel_onLocationNotification_ name:v20];

        uint64_t v15 = [(SMSessionManager *)self locationManager];
        uint64_t v21 = +[RTNotification notificationName];
        [v15 addObserver:self selector:sel_onLocationNotification_ name:v21];

        goto LABEL_22;
      }
      if (((1 << v6) & 0xC00) != 0)
      {
        int v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v22 = 136315138;
          uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, Added GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        id v17 = [(SMSessionManager *)self locationManager];
        [v17 removeObserver:self];

        id v9 = [(SMSessionManager *)self locationManager];
        uint64_t v10 = RTLocationManagerNotificationLocationsAccuracyBest;
        goto LABEL_21;
      }
      if (v6 == 4)
      {
        uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v22 = 136315138;
          uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%s, Added rhythmic waking GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        uint64_t v19 = [(SMSessionManager *)self locationManager];
        [v19 removeObserver:self];

        id v9 = [(SMSessionManager *)self locationManager];
        uint64_t v10 = RTLocationManagerNotificationLocationsAccuracyRhythmicWaking;
        goto LABEL_21;
      }
    }
    os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
      int v12 = "%s, Stopped location observer";
      uint64_t v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315394;
      uint64_t v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
      __int16 v24 = 1024;
      BOOL v25 = 0;
      int v12 = "%s, Stopped location observer because isActiveDevice, %{Bool}d";
      uint64_t v13 = v11;
      uint32_t v14 = 18;
LABEL_11:
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v22, v14);
    }
  }

  uint64_t v15 = [(SMSessionManager *)self locationManager];
  [v15 removeObserver:self];
LABEL_22:
}

- (void)_updateTimersUponStateTransition:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SMSessionManager *)self _isActiveDevice];
  unint64_t v6 = [(SMSessionManager *)self state];
  id v7 = [v6 activeDeviceIdentifier];
  BOOL v8 = [(SMSessionManager *)self _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:v7];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315906;
    uint32_t v14 = "-[SMSessionManager _updateTimersUponStateTransition:]";
    __int16 v15 = 1024;
    BOOL v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = v8;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, updating timers upon state transition, isActiveDevice, %{Bool}d, isEffectivePairedDeviceSameAsActiveDevice, %{Bool}d, transitionType, %ld", (uint8_t *)&v13, 0x22u);
  }

  uint64_t v10 = [(SMSessionManager *)self state];
  uint64_t v11 = [v10 sessionState];

  switch(v11)
  {
    case 0:
    case 1:
    case 2:
      [(SMSessionManager *)self _invalidateSessionManagerXPCTimerAlarms];
      [(SMSessionManager *)self _invalidateScreenLockMonitor];
      break;
    case 4:
      [(SMSessionManager *)self _invalidateSessionManagerXPCTimerAlarms];
      [(SMSessionManager *)self _invalidateScreenLockMonitor];
      if (v5) {
        [(SMSessionManager *)self _setUpCacheReleaseTimer];
      }
      break;
    case 7:
    case 8:
    case 9:
    case 14:
      [(SMSessionManager *)self _invalidateSessionManagerXPCTimerAlarms];
      [(SMSessionManager *)self _invalidateScreenLockMonitor];
      if (v5) {
        [(SMSessionManager *)self _setupTimerForAnomaly];
      }
      break;
    case 10:
    case 11:
      return;
    case 12:
      [(SMSessionManager *)self _invalidateSessionManagerXPCTimerAlarms];
      [(SMSessionManager *)self _invalidateScreenLockMonitor];
      if (v5 || v8) {
        [(SMSessionManager *)self _setupTimerAndLockMonitorForEndAwareness];
      }
      break;
    default:
      int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        uint32_t v14 = "-[SMSessionManager _updateTimersUponStateTransition:]";
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, should never reach this code path, logging error.", (uint8_t *)&v13, 0xCu);
      }

      break;
  }
}

- (void)_invalidateSessionManagerXPCTimerAlarms
{
  BOOL v3 = [(SMSessionManager *)self cacheReleaseXPCTimerAlarm];
  [(SMSessionManager *)self _invalidateTimer:v3];

  id v4 = [(SMSessionManager *)self checkInXPCTimerAlarm];
  [(SMSessionManager *)self _invalidateTimer:v4];

  id v5 = [(SMSessionManager *)self endAwarenessBeforeUnlockXPCTimerAlarm];
  [(SMSessionManager *)self _invalidateTimer:v5];
}

- (void)_invalidateScreenLockMonitor
{
  BOOL v3 = [(SMSessionManager *)self screenLockMonitor];

  if (v3)
  {
    id v4 = [(SMSessionManager *)self screenLockMonitor];
    [v4 _unregisterForLockNotification];

    screenLockMonitor = self->_screenLockMonitor;
    self->_screenLockMonitor = 0;
  }
}

- (void)_updateLastLocationWithLocations:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      uint64_t v21 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        [v9 horizontalAccuracy];
        if (v10 <= 100.0)
        {
          uint64_t v11 = [v9 timestamp];

          if (v11)
          {
            int v12 = [(SMSessionManager *)self lastLocation];
            uint64_t v13 = [v12 timestamp];
            if (!v13)
            {

LABEL_12:
              [(SMSessionManager *)self setLastLocation:v9];
              goto LABEL_13;
            }
            BOOL v25 = (void *)v13;
            __int16 v24 = [(SMSessionManager *)self lastLocation];
            uint64_t v23 = [v24 timestamp];
            uint32_t v14 = [v9 timestamp];
            __int16 v15 = [v23 laterDate:v14];
            [(SMSessionManager *)self lastLocation];
            v17 = id v16 = v4;
            [v17 timestamp];
            uint64_t v18 = v7;
            unint64_t v20 = v19 = self;
            char v22 = [v15 isEqualToDate:v20];

            self = v19;
            uint64_t v7 = v18;

            id v4 = v16;
            uint64_t v6 = v21;

            if ((v22 & 1) == 0) {
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMSessionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SMSessionManager_onLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__SMSessionManager_onLocationNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  BOOL v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) leechedLocations];
    [v5 _updateLastLocationWithLocations:v6];
  }
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SMSessionManager initializeSessionWithConversation:handler:]";
    __int16 v7 = 1024;
    int v8 = 4075;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Unsupported (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }
}

- (void)initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    int v12 = [(SMSessionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke;
    block[3] = &unk_1E6B91C48;
    __int16 v15 = v9;
    id v16 = self;
    id v18 = v11;
    id v17 = v10;
    SEL v19 = a2;
    dispatch_async(v12, block);

    uint64_t v13 = v15;
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 136315394;
    BOOL v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
    __int16 v54 = 2112;
    uint64_t v55 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, User requested to initialize a session with sessionID %@", buf, 0x16u);
  }

  int v4 = *(void **)(a1 + 32);
  if (!v4
    || ([*(id *)(*(void *)(a1 + 40) + 8) configuration],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 sessionID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v4 isEqual:v6],
        v6,
        v5,
        v7))
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void **)(a1 + 32);
      unint64_t v32 = [*(id *)(*(void *)(a1 + 40) + 8) configuration];
      uint64_t v33 = [v32 sessionID];
      *(_DWORD *)long long buf = 136315650;
      BOOL v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      __int16 v54 = 2112;
      uint64_t v55 = v31;
      __int16 v56 = 2112;
      __int16 v57 = v33;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current session ID, %@", buf, 0x20u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F99A48];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"Invalid session ID"];
    uint64_t v51 = v11;
    int v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = &v51;
    uint32_t v14 = &v50;
LABEL_16:
    SEL v19 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    unint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v22 = 7;
LABEL_17:
    uint64_t v23 = (void *)[v20 initWithDomain:v21 code:v22 userInfo:v19];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  if (!*(void *)(a1 + 48) || (conversationHandlesValid() & 1) == 0)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v34 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 136315394;
      BOOL v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      __int16 v54 = 2112;
      uint64_t v55 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%s, invalid conversation %@", buf, 0x16u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F99A48];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"Invalid conversation"];
    __int16 v49 = v11;
    int v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = &v49;
    uint32_t v14 = &v48;
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 40) _canDeviceModifyState])
  {
    uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 8) sessionState];
    if ((unint64_t)(v15 - 10) < 3)
    {
      id v16 = *(void **)(a1 + 40);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke_439;
      v40[3] = &unk_1E6B96D00;
      id v43 = *(id *)(a1 + 56);
      int8x16_t v39 = *(int8x16_t *)(a1 + 32);
      id v17 = (id)v39.i64[0];
      int8x16_t v41 = vextq_s8(v39, v39, 8uLL);
      id v42 = *(id *)(a1 + 48);
      [v16 _resetInitializationWithHandler:v40];

      return;
    }
    if (v15 != 1)
    {
      char v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v38 = [MEMORY[0x1E4F99950] convertSessionStateToString:[*(id *)(*(void *)(a1 + 40) + 8) sessionState]];
        *(_DWORD *)long long buf = 136315394;
        BOOL v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
        __int16 v54 = 2112;
        uint64_t v55 = v38;
        _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%s, session already running in state %@", buf, 0x16u);
      }
      id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v37 = *MEMORY[0x1E4F99A48];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v11 = [NSString stringWithFormat:@"Session is active"];
      uint64_t v45 = v11;
      SEL v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      unint64_t v20 = v36;
      uint64_t v21 = v37;
      uint64_t v22 = 23;
      goto LABEL_17;
    }
    [*(id *)(a1 + 40) _initializeSessionWithSessionID:*(void *)(a1 + 32) conversation:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
  }
  else
  {
    __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%s, User requested to initialize session on non active device", buf, 0xCu);
    }

    uint64_t v46 = *MEMORY[0x1E4F28568];
    BOOL v25 = NSString;
    long long v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
    long long v27 = [v25 stringWithFormat:@"%@ cannot be completed since current device is not active", v26];
    id v47 = v27;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];

    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v30 = (void *)[v29 initWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v28];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke_439(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _initializeSessionWithSessionID:*(void *)(a1 + 40) conversation:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
  }
}

- (void)cancelInitializationWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMSessionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SMSessionManager_cancelInitializationWithHandler___block_invoke;
    block[3] = &unk_1E6B921E0;
    void block[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __52__SMSessionManager_cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, User requested to cancel session initialization", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) _canDeviceModifyState])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 8) sessionState] == 10
      || [*(id *)(*(void *)(a1 + 32) + 8) sessionState] == 11)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F99948]);
      int v4 = [*(id *)(a1 + 32) state];
      id v5 = [v4 configuration];
      id v6 = [MEMORY[0x1E4F1C9C8] now];
      int v7 = [*(id *)(a1 + 32) messagingService];
      int v8 = [v7 deviceIdentifier];
      id v9 = [MEMORY[0x1E4F1C9C8] now];
      SEL v10 = objc_msgSend(v3, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v5, 0, 0, v6, 0, 0, 0, 0, 0, 0, v8, 0, 0,
                      0,
                      0,
                      v9,
                      0);

      [*(id *)(a1 + 32) _performStateTransitionTo:v10 transitionType:1 handler:*(void *)(a1 + 40)];
    }
    else
    {
      id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [MEMORY[0x1E4F99950] convertSessionStateToString:[*(id *)(*(void *)(a1 + 32) + 8) sessionState]];
        *(_DWORD *)long long buf = 136315394;
        long long v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
        __int16 v27 = 2112;
        long long v28 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing or Ready, current state, %@", buf, 0x16u);
      }
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F99A48];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      unint64_t v20 = [NSString stringWithFormat:@"Not in Initializing or Ready state"];
      __int16 v24 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      SEL v10 = (void *)[v18 initWithDomain:v19 code:16 userInfo:v21];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%s, User requested to cancel session initialization for non active device", buf, 0xCu);
    }

    uint64_t v29 = *MEMORY[0x1E4F28568];
    int v12 = NSString;
    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint32_t v14 = [v12 stringWithFormat:@"%@ cannot be completed since current device is not active", v13];
    v30[0] = v14;
    SEL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(SMSessionManager *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__SMSessionManager_cancelInitializationForSessionID_handler___block_invoke;
    v11[3] = &unk_1E6B90C40;
    int v12 = v7;
    uint64_t v13 = self;
    id v14 = v8;
    SEL v15 = a2;
    dispatch_async(v9, v11);

    SEL v10 = v12;
  }
  else
  {
    SEL v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __61__SMSessionManager_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
    __int16 v46 = 2112;
    id v47 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, User requested to cancel session initialization for sessionID %@", buf, 0x16u);
  }

  int v4 = *(void **)(a1 + 32);
  if (!v4
    || ([*(id *)(*(void *)(a1 + 40) + 8) configuration],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 sessionID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v4 isEqual:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v30 = *(void **)(a1 + 32);
      uint64_t v31 = [*(id *)(*(void *)(a1 + 40) + 8) configuration];
      unint64_t v32 = [v31 sessionID];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
      __int16 v46 = 2112;
      id v47 = v30;
      __int16 v48 = 2112;
      __int16 v49 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);
    }
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F99A48];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithFormat:@"Invalid session ID"];
    id v43 = v19;
    unint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v21 = v17;
    uint64_t v22 = v18;
    uint64_t v23 = 7;
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 40) _canDeviceModifyState])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 8) sessionState] == 10
      || [*(id *)(*(void *)(a1 + 40) + 8) sessionState] == 11)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F99948]);
      id v9 = [*(id *)(a1 + 40) state];
      SEL v10 = [v9 configuration];
      id v11 = [MEMORY[0x1E4F1C9C8] now];
      int v12 = [*(id *)(a1 + 40) messagingService];
      uint64_t v13 = [v12 deviceIdentifier];
      id v14 = [MEMORY[0x1E4F1C9C8] now];
      SEL v15 = objc_msgSend(v8, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v10, 0, 0, v11, 0, 0, 0, 0, 0, 0, v13, 0, 0,
                      0,
                      0,
                      v14,
                      0);

      [*(id *)(a1 + 40) _performStateTransitionTo:v15 transitionType:1 handler:*(void *)(a1 + 48)];
      goto LABEL_13;
    }
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = [MEMORY[0x1E4F99950] convertSessionStateToString:[*(id *)(*(void *)(a1 + 40) + 8) sessionState]];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
      __int16 v46 = 2112;
      id v47 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing or Ready, current state, %@", buf, 0x16u);
    }
    id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v35 = *MEMORY[0x1E4F99A48];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithFormat:@"Not in Initializing or Ready state"];
    int8x16_t v39 = v19;
    unint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v21 = v34;
    uint64_t v22 = v35;
    uint64_t v23 = 16;
LABEL_12:
    SEL v15 = (void *)[v21 initWithDomain:v22 code:v23 userInfo:v20];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v36 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
    __int16 v46 = 2112;
    id v47 = v36;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%s, User requested to cancel session initialization on non active device for sessionID %@", buf, 0x16u);
  }

  uint64_t v40 = *MEMORY[0x1E4F28568];
  BOOL v25 = NSString;
  long long v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
  __int16 v27 = [v25 stringWithFormat:@"%@ cannot be completed since current device is not active", v26];
  int8x16_t v41 = v27;
  SEL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];

  id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v29 = (void *)[v28 initWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v15];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_13:
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    SEL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v18 = "-[SMSessionManager endSessionForSessionID:reason:handler:]";
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, User requested to end session with reason %lu", buf, 0x16u);
    }

    id v11 = [(SMSessionManager *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke;
    v13[3] = &unk_1E6B90C40;
    void v13[4] = self;
    id v14 = v8;
    unint64_t v16 = a4;
    id v15 = v9;
    dispatch_async(v11, v13);
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isActiveDevice])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_2;
    v21[3] = &unk_1E6B91100;
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *(id *)(a1 + 48);
    void v21[4] = *(void *)(a1 + 32);
    id v22 = v5;
    [v2 _endSessionForSessionID:v3 reason:v4 handler:v21];
    id v6 = v22;
  }
  else if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_3;
    v19[3] = &unk_1E6B91100;
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    void v19[4] = *(void *)(a1 + 32);
    id v20 = v10;
    [v7 _endSessionForSessionID:v8 reason:v9 handler:v19];
    id v6 = v20;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v26 = "-[SMSessionManager endSessionForSessionID:reason:handler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"This device is not active and RemoteControl is not enabled;"];
    __int16 v24 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v6 = (void *)[v12 initWithDomain:v13 code:1 userInfo:v15];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    unint64_t v16 = [*(id *)(a1 + 32) sessionMetricManager];
    uint64_t v17 = [v6 code];
    uint64_t v18 = [v6 domain];
    [v16 onUserActionWithRemoteCommand:3 remoteCommandType:0 error:v17 errorDomain:v18];
  }
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  char v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:3 remoteCommandType:1 error:v6 errorDomain:v7];
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  char v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:3 remoteCommandType:2 error:v6 errorDomain:v7];
}

- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v33 = "-[SMSessionManager _endSessionForSessionID:reason:handler:]";
      __int16 v34 = 2048;
      unint64_t v35 = a4;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, User requested to end session with reason %lu", buf, 0x16u);
    }

    id v12 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, &unk_1F3452838, 0];
    uint64_t v13 = [(SMSessionManager *)self checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:a2 sessionID:v9 validSessionStates:v12];
    if (v13)
    {
      v10[2](v10, v13);
    }
    else
    {
      long long v26 = [(SMSessionManagerState *)self->_state startMessageGUID];
      unint64_t v23 = [(SMSessionManager *)self _getEndSessionStateWithReason:a4];
      id v21 = objc_alloc(MEMORY[0x1E4F99948]);
      BOOL v25 = [(SMSessionManager *)self state];
      id v14 = [v25 configuration];
      id v22 = [(SMSessionManager *)self state];
      id v20 = [v22 monitorContext];
      id v27 = v9;
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      unint64_t v16 = [(SMSessionManager *)self messagingService];
      uint64_t v17 = [v16 deviceIdentifier];
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
      __int16 v24 = objc_msgSend(v21, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v23, v14, 0, v20, v15, 0, 0, 0, 0, 0, 0, v17, 0, 0,
                      0,
                      a4,
                      v18,
                      0);

      [(SMSessionManager *)self _setPendingSendSessionEndMessageWithReason:a4 associatedGUID:v26];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__SMSessionManager__endSessionForSessionID_reason_handler___block_invoke;
      v28[3] = &unk_1E6B919C8;
      unint64_t v31 = a4;
      v28[4] = self;
      id v29 = v26;
      int v30 = v10;
      id v19 = v26;
      [(SMSessionManager *)self _performStateTransitionTo:v24 transitionType:1 handler:v28];

      id v9 = v27;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __59__SMSessionManager__endSessionForSessionID_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4 != 9)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      char v7 = [v5 state];
      [v5 sendSessionEndMessageWithReason:v4 associatedGUID:v6 state:v7];

      id v3 = 0;
    }
  }
  BOOL v8 = v3 == 0;
  id v9 = [*(id *)(a1 + 32) sessionMetricManager];
  [v9 onSessionTerminationResult:v8 reason:*(void *)(a1 + 56) error:v10];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_endRemoteSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SMSessionManager *)self messagingService];
  id v11 = [v10 deviceIdentifier];
  id v12 = [v11 UUIDString];

  uint64_t v13 = [(SMSessionManager *)self messagingService];
  id v14 = [(SMSessionManager *)self platform];
  uint64_t v15 = [v13 convertRTPlatformToIDSDeviceType:v14];

  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F99940]) initWithSessionEndReason:a4 sessionID:v9 sourceDeviceType:v15 sourceDeviceID:v12];
  uint64_t v17 = [(SMSessionManager *)self messagingService];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__SMSessionManager__endRemoteSessionForSessionID_reason_handler___block_invoke;
  v19[3] = &unk_1E6B918B0;
  void v19[4] = self;
  id v20 = v8;
  id v18 = v8;
  [v17 sendIDSMessageToMyNearbyDevices:v16 completion:v19];
}

void __65__SMSessionManager__endRemoteSessionForSessionID_reason_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      char v7 = @"succeeded";
    }
    else {
      char v7 = @"failed";
    }
    id v8 = [*(id *)(a1 + 32) state];
    id v9 = [v8 configuration];
    id v10 = [v9 sessionID];
    int v11 = 136315906;
    id v12 = "-[SMSessionManager _endRemoteSessionForSessionID:reason:handler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    unint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, sessionID, %@, error, %@", (uint8_t *)&v11, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)terminateSessionWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Received termination", buf, 2u);
  }

  uint64_t v6 = [(SMSessionManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SMSessionManager_terminateSessionWithSessionID___block_invoke;
  v8[3] = &unk_1E6B90BF0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __50__SMSessionManager_terminateSessionWithSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSessionWithSessionID:*(void *)(a1 + 40)];
}

- (void)_terminateSessionWithSessionID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SMSessionManager *)self _canDeviceModifyState])
  {
    id v5 = [(SMSessionManagerState *)self->_state configuration];
    uint64_t v6 = [v5 sessionID];
    char v7 = [v6 isEqual:v4];

    if (v7)
    {
      id v8 = [(SMSessionManagerState *)self->_state mutableCopy];
      [v8 setSessionState:1];
      [v8 setStartMessageGUID:0];
      [v8 setScheduledSendMessageGUID:0];
      [v8 setScheduledSendMessageDate:0];
      [v8 setActiveDeviceIdentifier:0];
      [(SMSessionManager *)self _performStateTransitionTo:v8 transitionType:1 handler:0];
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(SMSessionManagerState *)self->_state configuration];
        int v11 = [v10 sessionID];
        int v12 = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        __int16 v15 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "sessionID %@ does not match current configuration sessionID %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Received termination request from a device that cannot modify state", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v15 = "-[SMSessionManager modifySessionWithConfiguration:handler:]";
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, User requested to modify session", buf, 0xCu);
    }

    id v9 = [(SMSessionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isActiveDevice])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_2;
    v19[3] = &unk_1E6B91100;
    id v4 = *(id *)(a1 + 48);
    void v19[4] = *(void *)(a1 + 32);
    id v20 = v4;
    [v2 _modifySessionWithConfiguration:v3 handler:v19];
    id v5 = v20;
  }
  else if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_3;
    id v17[3] = &unk_1E6B91100;
    id v8 = *(id *)(a1 + 48);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v8;
    [v6 _modifyRemoteSessionWithConfiguration:v7 handler:v17];
    id v5 = v18;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v24 = "-[SMSessionManager modifySessionWithConfiguration:handler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F99A48];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"This device is not active and RemoteControl is not enabled;"];
    id v22 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v5 = (void *)[v10 initWithDomain:v11 code:1 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __int16 v14 = [*(id *)(a1 + 32) sessionMetricManager];
    uint64_t v15 = [v5 code];
    uint64_t v16 = [v5 domain];
    [v14 onUserActionWithRemoteCommand:1 remoteCommandType:0 error:v15 errorDomain:v16];
  }
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  uint64_t v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:1 remoteCommandType:1 error:v6 errorDomain:v7];
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  uint64_t v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:1 remoteCommandType:2 error:v6 errorDomain:v7];
}

- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, 0];
    id v10 = [v7 sessionID];
    uint64_t v11 = [(SMSessionManager *)self checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:a2 sessionID:v10 validSessionStates:v9];

    if (v11)
    {
      v8[2](v8, v11);
LABEL_8:

      goto LABEL_9;
    }
    if ([MEMORY[0x1E4F99918] configurationIsValid:v7])
    {
      uint64_t v11 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
      [v11 setSessionState:2];
      [v11 setConfiguration:v7];
      [(SMSessionManager *)self _performStateTransitionTo:v11 transitionType:1 handler:v8];
      goto LABEL_8;
    }
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [v7 sessionID];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v21 = "-[SMSessionManager _modifySessionWithConfiguration:handler:]";
      __int16 v22 = 2112;
      unint64_t v23 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, invalid configuration, %@", buf, 0x16u);
    }
    uint64_t v18 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"%s cannot be completed. Provided configuration is not valid.", "-[SMSessionManager _modifySessionWithConfiguration:handler:]"];
    uint64_t v19 = v13;
    __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v14];
    v8[2](v8, v16);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
LABEL_9:
}

- (void)_modifyRemoteSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMSessionManager *)self messagingService];
  id v9 = [v8 deviceIdentifier];
  id v10 = [v9 UUIDString];

  uint64_t v11 = [(SMSessionManager *)self messagingService];
  id v12 = [(SMSessionManager *)self platform];
  uint64_t v13 = [v11 convertRTPlatformToIDSDeviceType:v12];

  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F99960]) initWithSourceDeviceType:v13 sourceDeviceID:v10 updatedSessionConfiguration:v7];
  id v15 = [(SMSessionManager *)self messagingService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__SMSessionManager__modifyRemoteSessionWithConfiguration_handler___block_invoke;
  v18[3] = &unk_1E6B9CF08;
  id v19 = v14;
  id v20 = self;
  id v21 = v6;
  id v16 = v6;
  id v17 = v14;
  [v15 sendIDSMessageToMyDevices:v17 completion:v18];
}

void __66__SMSessionManager__modifyRemoteSessionWithConfiguration_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      id v7 = @"succeeded";
    }
    else {
      id v7 = @"failed";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) state];
    id v10 = [v9 configuration];
    uint64_t v11 = [v10 sessionID];
    int v12 = 136316162;
    uint64_t v13 = "-[SMSessionManager _modifyRemoteSessionWithConfiguration:handler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Succeeded, %@, sendIDSMesssage modifyConfig, %@,sessionID, %@, error, %@", (uint8_t *)&v12, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v17 = "-[SMSessionManager sendSafetyCacheForSessionID:handler:]";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, User requested release", buf, 0xCu);
    }

    id v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __56__SMSessionManager_sendSafetyCacheForSessionID_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __56__SMSessionManager_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, 0];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:*(void *)(a1 + 56) sessionID:*(void *)(a1 + 40)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
    [v3 setSessionState:4];
    [*(id *)(a1 + 32) _performStateTransitionTo:v3 transitionType:1 handler:*(void *)(a1 + 48)];
  }
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, configuration, %@", buf, 0x16u);
    }
    uint64_t v11 = [(SMSessionManager *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke;
    v13[3] = &unk_1E6B90C40;
    void v13[4] = self;
    id v14 = v7;
    SEL v16 = a2;
    id v15 = v8;
    dispatch_async(v11, v13);
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) state];
  if ([v2 sessionState] == 2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) state];
    id v4 = [v3 configuration];
    int v5 = [v4 isSameSession:*(void *)(a1 + 40)];

    if (v5)
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, configuration, %@, Trying to start session we already started, mark as success", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      return;
    }
  }
  else
  {
  }
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F3452868];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 32);
  int v12 = [*(id *)(a1 + 40) sessionID];
  id v13 = [v11 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v10 sessionID:v12 validSessionStates:v9];

  if (v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([MEMORY[0x1E4F99918] configurationIsValid:*(void *)(a1 + 40)])
  {
    id v13 = dispatch_group_create();
    id v14 = [*(id *)(a1 + 40) conversation];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    unint64_t v35 = __Block_byref_object_copy__167;
    uint64_t v36 = __Block_byref_object_dispose__167;
    id v37 = 0;
    id v15 = [v14 identifier];

    if (v15)
    {
      dispatch_group_enter(v13);
      SEL v16 = [v14 identifier];
      uint64_t v17 = [*(id *)(a1 + 32) queue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_2;
      v31[3] = &unk_1E6B995B0;
      uint64_t v33 = buf;
      unint64_t v32 = v13;
      +[SMMessagingUtilities queryChatWithGroupID:v16 queue:v17 handler:v31];
    }
    uint64_t v18 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_3;
    block[3] = &unk_1E6B9CF30;
    id v19 = *(id *)(a1 + 40);
    int v30 = buf;
    uint64_t v20 = *(void *)(a1 + 32);
    id v27 = v19;
    uint64_t v28 = v20;
    id v29 = *(id *)(a1 + 48);
    dispatch_group_notify(v13, v18, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [*(id *)(a1 + 40) sessionID];
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager startSessionWithConfiguration:handler:]_block_invoke";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%s, invalid configuration, %@", buf, 0x16u);
    }
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v22 = [NSString stringWithFormat:@"%s cannot be completed. Provided configuration is not valid.", "-[SMSessionManager startSessionWithConfiguration:handler:]_block_invoke"];
    v39[0] = v22;
    unint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v13 = [v24 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v23];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99838]);
  uint64_t v3 = [*(id *)(a1 + 32) conversation];
  uint64_t v4 = [v3 receiverHandles];
  int v5 = [*(id *)(a1 + 32) conversation];
  id v6 = [v5 identifier];
  id v26 = (id)[v2 initWithReceiverHandles:v4 identifier:v6 displayName:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  id v7 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) mutableCopy];
  [v7 setSessionState:2];
  id v25 = objc_alloc(MEMORY[0x1E4F99918]);
  uint64_t v8 = [*(id *)(a1 + 32) sessionID];
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v10 = [*(id *)(a1 + 32) sessionType];
  uint64_t v11 = [*(id *)(a1 + 32) time];
  int v12 = [*(id *)(a1 + 32) destination];
  id v13 = [*(id *)(a1 + 32) userResponseSafeDate];
  char v14 = [*(id *)(a1 + 32) sessionSupportsHandoff];
  id v15 = [*(id *)(a1 + 32) sosReceivers];
  LOBYTE(v24) = v14;
  SEL v16 = [v25 initWithConversation:v26 sessionID:v8 sessionStartDate:v9 sessionType:v10 time:v11 destination:v12 userResponseSafeDate:v13 sessionSupportsHandoff:v24 sosReceivers:v15 sessionWorkoutType:[*(id *)(a1 + 32) sessionWorkoutType]];
  [v7 setConfiguration:v16];

  if ([*(id *)(a1 + 32) sessionType] == 3)
  {
    uint64_t v17 = [*(id *)(a1 + 40) _updateDestinationForRoundTripSessionConfiguration:*(void *)(a1 + 32)];
    [v7 setConfiguration:v17];
  }
  if ([*(id *)(a1 + 32) sessionType] == 2)
  {
    uint64_t v18 = [*(id *)(a1 + 32) destination];
    id v19 = [v18 eta];
    uint64_t v20 = [v19 etaDate];
    [v7 setEstimatedEndDate:v20];

    uint64_t v21 = [*(id *)(a1 + 32) destination];
    uint64_t v22 = [v21 eta];
    unint64_t v23 = [v22 coarseEtaDate];
    [v7 setCoarseEstimatedEndDate:v23];

    [v7 setEstimatedEndDateStatus:1];
  }
  [*(id *)(a1 + 40) _performStateTransitionTo:v7 transitionType:1 handler:*(void *)(a1 + 48)];
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v18 = "-[SMSessionManager respondToTriggerPromptForSessionID:response:handler:]";
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, User responded to trigger prompt", buf, 0xCu);
    }

    uint64_t v11 = [(SMSessionManager *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke;
    v13[3] = &unk_1E6B90C40;
    void v13[4] = self;
    id v14 = v8;
    int64_t v16 = a4;
    id v15 = v9;
    dispatch_async(v11, v13);
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isActiveDevice])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
    v21[3] = &unk_1E6B91100;
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *(id *)(a1 + 48);
    void v21[4] = *(void *)(a1 + 32);
    id v22 = v5;
    [v2 _respondToTriggerPromptForSessionID:v3 response:v4 handler:v21];
    id v6 = v22;
  }
  else if ([MEMORY[0x1E4F99880] zelkovaRemoteControlEnabled])
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_3;
    v19[3] = &unk_1E6B91100;
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    void v19[4] = *(void *)(a1 + 32);
    id v20 = v10;
    [v7 _respondToTriggerPromptWithRemoteControlSessionID:v8 response:v9 handler:v19];
    id v6 = v20;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v26 = "-[SMSessionManager respondToTriggerPromptForSessionID:response:handler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"This device is not active and RemoteControl is not enabled;"];
    uint64_t v24 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v6 = (void *)[v12 initWithDomain:v13 code:1 userInfo:v15];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int64_t v16 = [*(id *)(a1 + 32) sessionMetricManager];
    uint64_t v17 = [v6 code];
    uint64_t v18 = [v6 domain];
    [v16 onUserActionWithRemoteCommand:2 remoteCommandType:0 error:v17 errorDomain:v18];
  }
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  id v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:2 remoteCommandType:1 error:v6 errorDomain:v7];
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v8 = [*(id *)(a1 + 32) sessionMetricManager];
  uint64_t v6 = [v5 code];
  id v7 = [v5 domain];

  [v8 onUserActionWithRemoteCommand:2 remoteCommandType:2 error:v6 errorDomain:v7];
}

- (void)_respondToTriggerPromptWithRemoteControlSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SMSessionManager *)self messagingService];
  uint64_t v11 = [v10 deviceIdentifier];
  id v12 = [v11 UUIDString];

  uint64_t v13 = [(SMSessionManager *)self messagingService];
  id v14 = [(SMSessionManager *)self platform];
  uint64_t v15 = [v13 convertRTPlatformToIDSDeviceType:v14];

  int64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F99900]) initWithTriggerPromptResponse:a4 sessionID:v9 sourceDeviceType:v15 sourceDeviceID:v12];
  uint64_t v17 = [(SMSessionManager *)self messagingService];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__SMSessionManager__respondToTriggerPromptWithRemoteControlSessionID_response_handler___block_invoke;
  v19[3] = &unk_1E6B918B0;
  void v19[4] = self;
  id v20 = v8;
  id v18 = v8;
  [v17 sendIDSMessageToMyDevices:v16 completion:v19];
}

void __87__SMSessionManager__respondToTriggerPromptWithRemoteControlSessionID_response_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      id v7 = @"succeeded";
    }
    else {
      id v7 = @"failed";
    }
    id v8 = [*(id *)(a1 + 32) state];
    id v9 = [v8 configuration];
    id v10 = [v9 sessionID];
    int v11 = 136315906;
    id v12 = "-[SMSessionManager _respondToTriggerPromptWithRemoteControlSessionID:response:handler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    int64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, sessionID, %@, error, %@", (uint8_t *)&v11, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v84 = "-[SMSessionManager _respondToTriggerPromptForSessionID:response:handler:]";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, User responded to trigger prompt", buf, 0xCu);
    }

    id v12 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, 0];
    __int16 v13 = [(SMSessionManager *)self checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:a2 sessionID:v9 validSessionStates:v12];
    if (v13)
    {
      v10[2](v10, v13);
LABEL_31:

      goto LABEL_32;
    }
    id v14 = [(SMSessionManager *)self state];
    uint64_t v15 = [v14 sessionState];

    switch(v15)
    {
      case 7:
        if (a4 == 1) {
          goto LABEL_25;
        }
        if (a4 != 2)
        {
          if (a4 == 3) {
            goto LABEL_24;
          }
          uint64_t v81 = *MEMORY[0x1E4F28568];
          int64_t v16 = NSString;
          __int16 v17 = NSStringFromSelector(a2);
          id v18 = [v16 stringWithFormat:@"%@ cannot be completed due invalid response type", v17];
          uint64_t v82 = v18;
          uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
          id v20 = &v82;
          uint64_t v21 = &v81;
          goto LABEL_27;
        }
        long long v69 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
        [v69 setSessionState:2];
        [v69 setUserTriggerResponse:2];
        unint64_t v31 = [(SMSessionManager *)self state];
        unint64_t v32 = [v31 configuration];

        unint64_t v71 = [MEMORY[0x1E4F1C9C8] now];
        id v67 = objc_alloc(MEMORY[0x1E4F99918]);
        BOOL v65 = [v32 conversation];
        __int16 v61 = [v32 sessionID];
        BOOL v63 = [v32 destination];
        uint64_t v33 = [v32 sessionStartDate];
        unsigned int v59 = [v32 sessionSupportsHandoff];
        __int16 v34 = [v32 sosReceivers];
        unint64_t v35 = (void *)[v67 initDestinationBoundSessionConfigurationWithConversation:v65 sessionID:v61 destination:v63 sessionStartDate:v33 userResponseSafeDate:v71 sessionSupportsHandoff:v59 sosReceivers:v34];

        [v69 setConfiguration:v35];
        [(SMSessionManager *)self _performStateTransitionTo:v69 transitionType:1 handler:v10];

        goto LABEL_31;
      case 8:
        switch(a4)
        {
          case 1:
            goto LABEL_25;
          case 2:
            goto LABEL_28;
          case 3:
            goto LABEL_24;
        }
        uint64_t v79 = *MEMORY[0x1E4F28568];
        id v22 = NSString;
        __int16 v17 = NSStringFromSelector(a2);
        id v18 = [v22 stringWithFormat:@"%@ cannot be completed due invalid response type", v17];
        __int16 v80 = v18;
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = &v80;
        uint64_t v21 = &v79;
        goto LABEL_27;
      case 9:
        switch(a4)
        {
          case 1:
            goto LABEL_25;
          case 2:
            uint64_t v36 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
            [v36 setSessionState:2];
            unint64_t v68 = v36;
            [v36 setUserTriggerResponse:2];
            id v37 = [(SMSessionManager *)self defaultsManager];
            uint64_t v38 = [v37 objectForKey:@"RTDefaultsSessionManagerTimerExtensionPeriodKey"];

            if (v38)
            {
              int8x16_t v39 = [(SMSessionManager *)self defaultsManager];
              uint64_t v40 = [v39 objectForKey:@"RTDefaultsSessionManagerTimerExtensionPeriodKey"];
              [v40 doubleValue];
              double v42 = v41;
            }
            else
            {
              double v42 = *MEMORY[0x1E4F99B68];
            }
            uint64_t v44 = [(SMSessionManager *)self state];
            uint64_t v45 = [v44 configuration];
            __int16 v46 = [v45 time];
            uint64_t v66 = [v46 timeBound];

            id v47 = objc_alloc(MEMORY[0x1E4F999B0]);
            __int16 v48 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v66 sinceDate:v42];
            uint64_t v72 = (void *)[v47 initWithTimeBound:v48];

            id v57 = objc_alloc(MEMORY[0x1E4F99918]);
            id v64 = [(SMSessionManager *)self state];
            uint64_t v62 = [v64 configuration];
            id v70 = [v62 conversation];
            BOOL v60 = [(SMSessionManager *)self state];
            uint64_t v58 = [v60 configuration];
            __int16 v49 = [v58 sessionID];
            __int16 v56 = [(SMSessionManager *)self state];
            uint64_t v55 = [v56 configuration];
            uint64_t v50 = [v55 sessionSupportsHandoff];
            uint64_t v51 = [(SMSessionManager *)self state];
            uint64_t v52 = [v51 configuration];
            BOOL v53 = [v52 sosReceivers];
            __int16 v54 = (void *)[v57 initTimeBoundSessionConfigurationWithConversation:v70 sessionID:v49 time:v72 sessionSupportsHandoff:v50 sosReceivers:v53];

            uint64_t v24 = v68;
            [v68 setConfiguration:v54];
            [(SMSessionManager *)self _performStateTransitionTo:v68 transitionType:1 handler:v10];

            goto LABEL_30;
          case 3:
            goto LABEL_24;
        }
        uint64_t v77 = *MEMORY[0x1E4F28568];
        uint64_t v23 = NSString;
        __int16 v17 = NSStringFromSelector(a2);
        id v18 = [v23 stringWithFormat:@"%@ cannot be completed due invalid response type", v17];
        __int16 v78 = v18;
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = &v78;
        uint64_t v21 = &v77;
        goto LABEL_27;
      case 14:
        switch(a4)
        {
          case 1:
LABEL_25:
            uint64_t v24 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
            [v24 setSessionState:4];
            id v25 = v24;
            uint64_t v26 = 1;
            break;
          case 2:
LABEL_28:
            uint64_t v24 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
            [v24 setSessionState:2];
            id v25 = v24;
            uint64_t v26 = 2;
            break;
          case 3:
LABEL_24:
            uint64_t v24 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
            [v24 setSessionState:4];
            id v25 = v24;
            uint64_t v26 = 3;
            break;
          default:
            uint64_t v75 = *MEMORY[0x1E4F28568];
            id v43 = NSString;
            __int16 v17 = NSStringFromSelector(a2);
            id v18 = [v43 stringWithFormat:@"%@ cannot be completed due invalid response type", v17];
            id v76 = v18;
            uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
            id v20 = &v76;
            uint64_t v21 = &v75;
LABEL_27:
            uint64_t v28 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];

            id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
            int v30 = (void *)[v29 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v28];
            v10[2](v10, v30);

            goto LABEL_31;
        }
        [v25 setUserTriggerResponse:v26];
        [(SMSessionManager *)self _performStateTransitionTo:v24 transitionType:1 handler:v10];
LABEL_30:

        goto LABEL_31;
      default:
        uint64_t v73 = *MEMORY[0x1E4F28568];
        uint64_t v27 = NSString;
        __int16 v17 = NSStringFromSelector(a2);
        id v18 = [v27 stringWithFormat:@"%@ cannot be completed due invalid state for response", v17];
        uint64_t v74 = v18;
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = &v74;
        uint64_t v21 = &v73;
        goto LABEL_27;
    }
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_32:
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  id v10 = (void (**)(id, void *, void))a3;
  uint64_t v4 = [(SMSessionManager *)self state];
  int v5 = [v4 isActiveState];

  if (v5)
  {
    uint64_t v6 = [(SMSessionManager *)self state];
    id v7 = [v6 configuration];
    id v8 = [v7 sosReceivers];
    id v9 = [v8 receiverHandles];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v10[2](v10, v9, 0);
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(SMSessionManager *)self state];
      id v7 = [v6 configuration];
      id v8 = [v7 conversation];
      id v9 = [v8 identifier];
      id v10 = [(SMSessionManager *)self state];
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager iMessageGroupMembershipChangedFor:]";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v28 = v4;
      LOWORD(v29) = 2048;
      *(void *)((char *)&v29 + 2) = [v10 sessionState];
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, membership changed for groupID, %@, session state, %lu", buf, 0x2Au);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__167;
    *(void *)&long long v29 = __Block_byref_object_dispose__167;
    *((void *)&v29 + 1) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (![(SMSessionManager *)self _canDeviceModifyState]) {
      goto LABEL_7;
    }
    int v11 = [(SMSessionManager *)self state];
    id v12 = [v11 configuration];
    __int16 v13 = [v12 conversation];
    id v14 = [v13 identifier];
    int v15 = [v14 isEqualToString:v4];

    if (v15)
    {
      int64_t v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      __int16 v17 = [(SMSessionManager *)self queue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke;
      v22[3] = &unk_1E6B995B0;
      uint64_t v24 = buf;
      id v18 = v16;
      uint64_t v23 = v18;
      +[SMMessagingUtilities queryChatWithGroupID:v4 queue:v17 handler:v22];

      uint64_t v19 = [(SMSessionManager *)self queue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_468;
      v21[3] = &unk_1E6B90E98;
      void v21[4] = self;
      void v21[5] = buf;
      dispatch_group_notify(v18, v19, v21);
    }
    else
    {
LABEL_7:
      id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v25 = 136315138;
        uint64_t v26 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]";
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%s, membership change ignored", v25, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }
  }
}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [v3 handles];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v19 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, found chat with handles, %@", buf, 0x16u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v3 handles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) address];
          [v11 addObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_468(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 configuration];
  uint64_t v4 = [v3 conversation];

  int v5 = [*(id *)(a1 + 32) state];
  uint64_t v6 = [v5 configuration];
  uint64_t v24 = [v6 sosReceivers];

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F99888]) initWithPrimaryHandle:*(void *)(*((void *)&v25 + 1) + 8 * v13) secondaryHandles:v12];
        [v7 addObject:v14];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  long long v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v30 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, updating conversation with receivers, %@", buf, 0x16u);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F99838]);
  id v18 = (void *)[v7 copy];
  uint64_t v19 = [v4 identifier];
  __int16 v20 = [v4 displayName];
  uint64_t v21 = (void *)[v17 initWithReceiverHandles:v18 identifier:v19 displayName:v20];

  uint64_t v22 = +[SMMessagingUtilities conversationFromHandlesInConversation1:v21 canonicallyMappedToHandlesInConversation2:v4];

  uint64_t v23 = +[SMMessagingUtilities conversationFromHandlesInConversation1:v24 canonicallyIntersectedWithHandlesInConversation2:v22];
  [*(id *)(a1 + 32) _updateSessionWithConversation:v22 sosReceivers:v23 handler:&__block_literal_global_473];
}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_471(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      int v5 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%s, conversation receiver update failed due to, %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = [(SMSessionManager *)self state];
      id v7 = [v6 configuration];
      uint64_t v8 = [v7 conversation];
      uint64_t v9 = [v8 identifier];
      uint64_t v10 = [(SMSessionManager *)self state];
      int v19 = 136315906;
      __int16 v20 = "-[SMSessionManager kickedFromIMessageGroupWith:]";
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2048;
      uint64_t v26 = [v10 sessionState];
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, unjoined from groupID, %@, session state, %lu", (uint8_t *)&v19, 0x2Au);
    }
    if (![(SMSessionManager *)self _canDeviceModifyState]) {
      goto LABEL_7;
    }
    uint64_t v11 = [(SMSessionManager *)self state];
    uint64_t v12 = [v11 configuration];
    uint64_t v13 = [v12 conversation];
    long long v14 = [v13 identifier];
    int v15 = [v14 isEqualToString:v4];

    if (v15)
    {
      uint64_t v16 = [(SMSessionManager *)self state];
      id v17 = [v16 configuration];
      id v18 = [v17 sessionID];
      [(SMSessionManager *)self _endSessionForSessionID:v18 reason:9 handler:&__block_literal_global_475];
    }
    else
    {
LABEL_7:
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 136315138;
        __int16 v20 = "-[SMSessionManager kickedFromIMessageGroupWith:]";
        _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%s, initiator unjoin ignored", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", (uint8_t *)&v19, 2u);
    }
  }
}

void __48__SMSessionManager_kickedFromIMessageGroupWith___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      int v5 = "-[SMSessionManager kickedFromIMessageGroupWith:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%s, failed to end session on initiator unjoin due to error, %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = [(SMSessionManager *)self state];
      id v7 = [v6 configuration];
      uint64_t v8 = [v7 conversation];
      uint64_t v9 = [v8 identifier];
      uint64_t v10 = [(SMSessionManager *)self state];
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      long long v28 = v4;
      LOWORD(v29) = 2048;
      *(void *)((char *)&v29 + 2) = [v10 sessionState];
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, displayName changed for groupID, %@, session state, %lu", buf, 0x2Au);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v28 = __Block_byref_object_copy__167;
    *(void *)&long long v29 = __Block_byref_object_dispose__167;
    *((void *)&v29 + 1) = 0;
    if (![(SMSessionManager *)self _canDeviceModifyState]) {
      goto LABEL_7;
    }
    uint64_t v11 = [(SMSessionManager *)self state];
    uint64_t v12 = [v11 configuration];
    uint64_t v13 = [v12 conversation];
    long long v14 = [v13 identifier];
    int v15 = [v14 isEqualToString:v4];

    if (v15)
    {
      uint64_t v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      id v17 = [(SMSessionManager *)self queue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke;
      v22[3] = &unk_1E6B995B0;
      id v24 = buf;
      id v18 = v16;
      __int16 v23 = v18;
      +[SMMessagingUtilities queryChatWithGroupID:v4 queue:v17 handler:v22];

      int v19 = [(SMSessionManager *)self queue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_476;
      v21[3] = &unk_1E6B90E98;
      void v21[4] = self;
      void v21[5] = buf;
      dispatch_group_notify(v18, v19, v21);
    }
    else
    {
LABEL_7:
      id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v25 = 136315138;
        uint64_t v26 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]";
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%s, displayName change ignored", v25, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }
  }
}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [v3 displayName];
      int v9 = 136315394;
      uint64_t v10 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, found chat with displayName, %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v6 = [v3 displayName];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_476(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 configuration];
  int v4 = [v3 conversation];

  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v15 = 136315394;
    uint64_t v16 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, updating state with new conversation displayName, %@", (uint8_t *)&v15, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F99838]);
  uint64_t v8 = [v4 receiverHandles];
  int v9 = [v4 identifier];
  uint64_t v10 = (void *)[v7 initWithReceiverHandles:v8 identifier:v9 displayName:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  __int16 v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v11 state];
  uint64_t v13 = [v12 configuration];
  long long v14 = [v13 sosReceivers];
  [v11 _updateSessionWithConversation:v10 sosReceivers:v14 handler:&__block_literal_global_479];
}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_477(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      int v5 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%s, conversation display name update failed due to, %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)_updateSessionWithConversation:(id)a3 sosReceivers:(id)a4 handler:(id)a5
{
  id v23 = a5;
  id v21 = a4;
  id v20 = a3;
  uint64_t v8 = [(SMSessionManager *)self state];
  id v24 = [v8 configuration];

  int v9 = [(SMSessionManager *)self state];
  uint64_t v10 = (void *)[v9 mutableCopy];

  id v11 = objc_alloc(MEMORY[0x1E4F99918]);
  uint64_t v12 = [v24 sessionID];
  uint64_t v13 = [v24 sessionStartDate];
  uint64_t v14 = [v24 sessionType];
  int v15 = [v24 time];
  uint64_t v16 = [v24 destination];
  __int16 v17 = [v24 userResponseSafeDate];
  LOBYTE(v19) = [v24 sessionSupportsHandoff];
  uint64_t v18 = [v11 initWithConversation:v20 sessionID:v12 sessionStartDate:v13 sessionType:v14 time:v15 destination:v16 userResponseSafeDate:v17 sessionSupportsHandoff:v19 sosReceivers:v21 sessionWorkoutType:[v24 sessionWorkoutType]];

  [v10 setConfiguration:v18];
  [(SMSessionManager *)self _performStateTransitionTo:v10 transitionType:1 handler:v23];
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v17 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for destination anomaly prompt with handler", buf, 0xCu);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __76__SMSessionManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __76__SMSessionManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 2)
    {
      int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v9 setSessionState:7];
      [v9 setMonitorContext:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _performStateTransitionTo:v9 transitionType:1 handler:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v10 = NSString;
      id v11 = (void *)MEMORY[0x1E4F99918];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      id v13 = [v11 sessionTypeToString:[v12 sessionType]];
      int v9 = [v10 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:handler:]_block_invoke", v13];

      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F99A48];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      id v21 = v9;
      __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:16 userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v17 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for destination anomaly prompt with handler", buf, 0xCu);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __74__SMSessionManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __74__SMSessionManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 3)
    {
      int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v9 setSessionState:8];
      [v9 setMonitorContext:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _performStateTransitionTo:v9 transitionType:1 handler:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v10 = NSString;
      id v11 = (void *)MEMORY[0x1E4F99918];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      id v13 = [v11 sessionTypeToString:[v12 sessionType]];
      int v9 = [v10 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:handler:]_block_invoke", v13];

      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F99A48];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      id v21 = v9;
      __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:16 userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v17 = "-[SMSessionManager promptTimerEndedVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for timer ended prompt with handler", buf, 0xCu);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __68__SMSessionManager_promptTimerEndedVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __68__SMSessionManager_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 1)
    {
      int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v9 setSessionState:9];
      [v9 setMonitorContext:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _performStateTransitionTo:v9 transitionType:1 handler:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v10 = NSString;
      id v11 = (void *)MEMORY[0x1E4F99918];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      id v13 = [v11 sessionTypeToString:[v12 sessionType]];
      int v9 = [v10 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptTimerEndedVerificationWithContext:handler:]_block_invoke", v13];

      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F99A48];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      id v21 = v9;
      __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:16 userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:handler:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for workout anoamly with handler, context, %@", buf, 0x16u);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __72__SMSessionManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __72__SMSessionManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 4)
    {
      int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v9 setSessionState:14];
      [v9 setMonitorContext:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _performStateTransitionTo:v9 transitionType:1 handler:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v10 = NSString;
      id v11 = (void *)MEMORY[0x1E4F99918];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      id v13 = [v11 sessionTypeToString:[v12 sessionType]];
      int v9 = [v10 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:handler:]_block_invoke", v13];

      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F99A48];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      id v21 = v9;
      __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      __int16 v18 = [v15 errorWithDomain:v16 code:16 userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)promptWorkoutSessionEndVerificationWithContext:(id)a3 handlers:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for watch anoamly with handler, context, %@", buf, 0x16u);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F3452850, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 4)
    {
      int v9 = *(id **)(a1 + 32);
      uint64_t v10 = [v9[1] configuration];
      id v11 = [v10 sessionID];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke_483;
      v23[3] = &unk_1E6B90C18;
      id v24 = *(id *)(a1 + 48);
      [v9 _endSessionForSessionID:v11 reason:8 handler:v23];
    }
    else
    {
      uint64_t v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F99918];
      id v14 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      SEL v15 = objc_msgSend(v13, "sessionTypeToString:", objc_msgSend(v14, "sessionType"));
      uint64_t v16 = [v12 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]_block_invoke", v15];

      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        long long v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      __int16 v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F99A48];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v26 = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v21 = [v18 errorWithDomain:v19 code:16 userInfo:v20];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke_483(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446466;
    __int16 v6 = "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%{public}s, end session result, %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[SMSessionManager promptSafeArrivalWithContext:handler:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for safe arrival with handler, context, %@", buf, 0x16u);
    }

    uint64_t v10 = [(SMSessionManager *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, 0];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
    uint64_t v8 = [v7 sessionType];

    if (v8 == 2)
    {
      uint64_t v9 = *(id **)(a1 + 32);
      uint64_t v10 = [v9[1] configuration];
      id v11 = [v10 sessionID];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke_484;
      v23[3] = &unk_1E6B90C18;
      id v24 = *(id *)(a1 + 48);
      [v9 _endSessionForSessionID:v11 reason:1 handler:v23];
    }
    else
    {
      uint64_t v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F99918];
      id v14 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      SEL v15 = objc_msgSend(v13, "sessionTypeToString:", objc_msgSend(v14, "sessionType"));
      uint64_t v16 = [v12 stringWithFormat:@"%s cannot run for sessionType %@", "-[SMSessionManager promptSafeArrivalWithContext:handler:]_block_invoke", v15];

      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)long long buf = 138412546;
        long long v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      __int16 v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F99A48];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v26 = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v21 = [v18 errorWithDomain:v19 code:16 userInfo:v20];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke_484(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446466;
    __int16 v6 = "-[SMSessionManager promptSafeArrivalWithContext:handler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%{public}s, end session result, %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onSessionStartMessageSendResultWithMessage:(id)a3 messageGUID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    SEL v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_7;
  }
  if (!v12)
  {
    SEL v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_10;
  }
  id v14 = [(SMSessionManager *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke;
  id v17[3] = &unk_1E6B97790;
  v17[4] = self;
  SEL v21 = a2;
  id v18 = v11;
  id v19 = v12;
  BOOL v22 = a5;
  id v20 = v13;
  dispatch_async(v14, v17);

LABEL_8:
}

void __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) sessionID];
  int v5 = [v3 checkSessionIDAndCanDeviceModifyStateWithSelector:v2 sessionID:v4];

  if (!v5)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) startMessageGUID];
    if (v6)
    {
      __int16 v7 = (void *)v6;
      id v8 = *(void **)(a1 + 48);
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) startMessageGUID];
      LOBYTE(v8) = [v8 isEqual:v9];

      if ((v8 & 1) == 0)
      {
        uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          int v19 = 136315138;
          id v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
          _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "%s, Received a second start message GUID for the same session", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_12;
      }
    }
    int v10 = *(unsigned __int8 *)(a1 + 72);
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v12 = v11;
    if (v10)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
        [v16 setStartMessageGUID:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) _performStateTransitionTo:v16 transitionType:1 handler:&__block_literal_global_487];
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      SEL v15 = [v14 sessionID];
      int v19 = 136315650;
      id v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, Start message %@ successfully sent for session %@", (uint8_t *)&v19, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      uint64_t v17 = *(void *)(a1 + 48);
      id v14 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      SEL v15 = [v14 sessionID];
      uint64_t v18 = *(void *)(a1 + 56);
      int v19 = 136315906;
      id v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, Start message %@ failed to send for session %@ with error %@", (uint8_t *)&v19, 0x2Au);
    }

    goto LABEL_11;
  }
LABEL_13:
}

void __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke_485(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onScheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v9)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    SEL v15 = "Invalid parameter not satisfying: sessionID";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_12;
  }
  if (!v10)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    SEL v15 = "Invalid parameter not satisfying: guid";
    goto LABEL_11;
  }
  if (!v11)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      SEL v15 = "Invalid parameter not satisfying: date";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke;
  block[3] = &unk_1E6B90F80;
  void block[4] = self;
  SEL v20 = a2;
  id v17 = v9;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(v13, block);

LABEL_13:
}

void __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, 0];
  id v3 = [*(id *)(a1 + 32) checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:*(void *)(a1 + 64) sessionID:*(void *)(a1 + 40) validSessionStates:v2];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID];
    if (v4)
    {
      int v5 = (void *)v4;
      __int16 v6 = *(void **)(a1 + 48);
      id v7 = [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID];
      LOBYTE(v6) = [v6 isEqualToString:v7];

      if ((v6 & 1) == 0)
      {
        uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v11 = [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID];
          uint64_t v12 = *(void *)(a1 + 48);
          *(_DWORD *)long long buf = 136315650;
          id v14 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
          __int16 v15 = 2112;
          uint64_t v16 = v11;
          __int16 v17 = 2112;
          uint64_t v18 = v12;
          _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, mismatch of Scheduled Send GUID, old GUID, %@, new GUID, %@", buf, 0x20u);
        }
        id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v14 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
          _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "%s, mismatch of Scheduled Send GUID", buf, 0xCu);
        }
      }
    }
    id v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
    [v10 setScheduledSendMessageGUID:*(void *)(a1 + 48)];
    [v10 setScheduledSendMessageDate:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _performStateTransitionTo:v10 transitionType:1 handler:&__block_literal_global_490];
  }
}

void __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke_488(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onScheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: sessionID";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: guid";
    goto LABEL_10;
  }
  id v10 = [(SMSessionManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke;
  v13[3] = &unk_1E6B917F0;
  void v13[4] = self;
  SEL v16 = a2;
  id v14 = v7;
  id v15 = v9;
  dispatch_async(v10, v13);

LABEL_8:
}

void __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) checkSessionIDAndCanDeviceModifyStateWithSelector:*(void *)(a1 + 56) sessionID:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID];
    if (v3
      && (int v4 = (void *)v3,
          int v5 = *(void **)(a1 + 48),
          [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID],
          __int16 v6 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v5) = [v5 isEqualToString:v6],
          v6,
          v4,
          (v5 & 1) == 0))
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = [*(id *)(*(void *)(a1 + 32) + 8) scheduledSendMessageGUID];
        uint64_t v11 = *(void *)(a1 + 48);
        int v12 = 136315650;
        uint64_t v13 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, mismatch of Scheduled Send GUID, old GUID, %@, new GUID, %@", (uint8_t *)&v12, 0x20u);
      }
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v12 = 136315138;
        uint64_t v13 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
        _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "%s, mismatch of Scheduled Send GUID", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v7 setScheduledSendMessageDate:0];
      [*(id *)(a1 + 32) _performStateTransitionTo:v7 transitionType:1 handler:&__block_literal_global_493];
    }
  }
}

void __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke_491(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onScheduledSendForSessionID:(id)a3
{
  id v5 = a3;
  __int16 v6 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SMSessionManager_onScheduledSendForSessionID___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __48__SMSessionManager_onScheduledSendForSessionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SMSessionManager_onScheduledSendForSessionID___block_invoke_2;
  v2[3] = &unk_1E6B90CB8;
  long long v3 = *(_OWORD *)(a1 + 40);
  [v1 _onScheduledSendForSessionID:(id)v3 handler:v2];
}

void __48__SMSessionManager_onScheduledSendForSessionID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "SMSessionManager,%@,sessionID:%@,returned with error,%@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_onScheduledSendForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  if (v7)
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v17 = "-[SMSessionManager _onScheduledSendForSessionID:handler:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Received scheduled send event for sessionID:%@", buf, 0x16u);
    }

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, &unk_1F3452838, 0];
    __int16 v11 = [(SMSessionManager *)self checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:a2 sessionID:v7 validSessionStates:v10];
    if (v11)
    {
      v8[2](v8, v11);
    }
    else
    {
      id v12 = (void *)[(SMSessionManagerState *)self->_state mutableCopy];
      [v12 setSessionState:4];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F99968]) initWithUpdateReason:1 triggerCategory:15 sessionID:v7];
      [v12 setMonitorContext:v13];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__SMSessionManager__onScheduledSendForSessionID_handler___block_invoke;
      v14[3] = &unk_1E6B90C18;
      id v15 = v8;
      [(SMSessionManager *)self _performStateTransitionTo:v12 transitionType:1 handler:v14];
    }
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }
}

void __57__SMSessionManager__onScheduledSendForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[SMSessionManager _onScheduledSendForSessionID:handler:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, " %s, unable to transition to SMSessionStateCacheReleasedAndUpdating due to, %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptDirectTriggerWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v13 = "-[SMSessionManager promptDirectTriggerWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Received prompt request for direct trigger", buf, 0xCu);
  }

  __int16 v7 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isActiveDevice]
    && ([*(id *)(*(void *)(a1 + 32) + 8) isActiveState] & 1) != 0)
  {
    id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, &unk_1F3452838, 0];
    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) sessionID];
    uint64_t v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

    if (v6)
    {
      __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v26 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke";
        __int16 v27 = 2112;
        long long v28 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v7 = [*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      [v7 setSessionState:4];
      [v7 setMonitorContext:*(void *)(a1 + 40)];
      if ([*(id *)(*(void *)(a1 + 32) + 8) sessionState] == 4)
      {
        __int16 v16 = (void *)MEMORY[0x1E4F99968];
        uint64_t v17 = [v7 monitorContext];
        char v18 = [v16 isSOSTriggerCategory:[v17 triggerCategory]];
      }
      else
      {
        char v18 = 0;
      }
      id v19 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_498;
      v20[3] = &unk_1E6B9CF80;
      char v21 = v18;
      void v20[4] = v19;
      [v19 _performStateTransitionTo:v7 transitionType:1 handler:v20];
      uint64_t v6 = 0;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) state];
    uint64_t v9 = [v8 configuration];
    id v10 = [v9 sessionID];
    SEL v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    }
    id v2 = v12;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F99870]) initWithSessionID:v2 triggerCategory:[*(id *)(a1 + 40) triggerCategory]];
    uint64_t v13 = [*(id *)(a1 + 32) messagingService];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_2;
    v22[3] = &unk_1E6B9CF58;
    uint64_t v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v23 = v14;
    uint64_t v24 = v15;
    [v13 sendIDSMessageToMyNearbyDevices:v6 completion:v22];

    __int16 v7 = v23;
  }
}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      __int16 v7 = @"succeeded";
    }
    else {
      __int16 v7 = @"failed";
    }
    id v8 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 32) triggerCategory]];
    uint64_t v9 = [*(id *)(a1 + 40) state];
    id v10 = [v9 configuration];
    SEL v11 = [v10 sessionID];
    int v12 = 136316162;
    uint64_t v13 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, triggerCategory, %@, sessionID, %@, error, %@", (uint8_t *)&v12, 0x34u);
  }
}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_498(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%s, unable to complete state transition for secondary SOS trigger", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _notifyObserversForSecondarySOSTrigger];
  }
}

- (void)updateUserWithContext:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SMSessionManager updateUserWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Received prompt for safety session update", (uint8_t *)&v4, 0xCu);
  }
}

- (void)updateUserWithTriggerContext:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SMSessionManager updateUserWithTriggerContext:]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Received update with trigger context", (uint8_t *)&v4, 0xCu);
  }
}

- (void)promptSafeArrivalWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SMSessionManager promptSafeArrivalWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Received safe arrival, context, %@", (uint8_t *)&v6, 0x16u);
  }

  [(SMSessionManager *)self promptSafeArrivalWithContext:v4 handler:&__block_literal_global_500];
}

void __49__SMSessionManager_promptSafeArrivalWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMSessionManager promptSafeArrivalWithContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, completed, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)promptEstimatedEndDateUpdateWithContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v13 = "-[SMSessionManager promptEstimatedEndDateUpdateWithContext:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, context, %@", buf, 0x16u);
  }

  id v7 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMSessionManager_promptEstimatedEndDateUpdateWithContext___block_invoke;
  block[3] = &unk_1E6B91220;
  id v10 = v5;
  SEL v11 = a2;
  void block[4] = self;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __60__SMSessionManager_promptEstimatedEndDateUpdateWithContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObjects:&unk_1F34527D8, &unk_1F34527F0, &unk_1F3452808, &unk_1F3452820, &unk_1F3452850, 0];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) sessionID];
  __int16 v6 = [v4 checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:v3 sessionID:v5 validSessionStates:v2];

  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v20 = "-[SMSessionManager promptEstimatedEndDateUpdateWithContext:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
    id v9 = [*(id *)(a1 + 40) estimatedEndDate];
    [v8 setEstimatedEndDate:v9];

    id v10 = [*(id *)(a1 + 40) coarseEstimatedEndDate];
    if (v10)
    {
      [v8 setCoarseEstimatedEndDate:v10];
    }
    else
    {
      SEL v11 = [*(id *)(a1 + 40) estimatedEndDate];
      [v8 setCoarseEstimatedEndDate:v11];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 8) estimatedEndDateStatus] == 2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) estimatedEndDateStatus];
    }
    [v8 setEstimatedEndDateStatus:v12];
    [v8 setMonitorContext:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _performStateTransitionTo:v8 transitionType:1 handler:0];
    uint64_t v13 = *(void **)(a1 + 32);
    __int16 v14 = [*(id *)(a1 + 40) estimatedEndDate];
    id v15 = [*(id *)(a1 + 40) coarseEstimatedEndDate];
    uint64_t v16 = [*(id *)(a1 + 32) state];
    uint64_t v17 = [v16 configuration];
    __int16 v18 = [v17 sessionID];
    [v13 _updateReceiverWithEstimatedEndDate:v14 coarseEstimatedEndDate:v15 sessionID:v18];
  }
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for destination anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  [(SMSessionManager *)self promptDestinationAnomalyVerificationWithContext:v4 handler:&__block_literal_global_502];
}

void __68__SMSessionManager_promptDestinationAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for round trip anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  [(SMSessionManager *)self promptRoundTripAnomalyVerificationWithContext:v4 handler:&__block_literal_global_504];
}

void __66__SMSessionManager_promptRoundTripAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)promptTimerEndedVerificationWithContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SMSessionManager promptTimerEndedVerificationWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for timer ended verification", (uint8_t *)&v6, 0xCu);
  }

  [(SMSessionManager *)self promptTimerEndedVerificationWithContext:v4 handler:&__block_literal_global_506];
}

void __60__SMSessionManager_promptTimerEndedVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[SMSessionManager promptTimerEndedVerificationWithContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for workout anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  [(SMSessionManager *)self promptWorkoutAnomalyVerificationWithContext:v4 handler:&__block_literal_global_508_0];
}

void __64__SMSessionManager_promptWorkoutAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onDeletedMessage:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SMSessionManager_onDeletedMessage_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__SMSessionManager_onDeletedMessage_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedMessage:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_onDeletedMessage:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(SMSessionManager *)self state];
    id v10 = [v9 configuration];
    SEL v11 = [v10 sessionID];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v24 = "-[SMSessionManager _onDeletedMessage:handler:]";
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "SMSessionManager,%s,currentSessionID,%@,message,%@", buf, 0x20u);
  }
  id v12 = [(SMSessionManager *)self state];
  if (![v12 isActiveState]) {
    goto LABEL_8;
  }
  id v13 = [(SMSessionManager *)self state];
  __int16 v14 = [v13 configuration];
  id v15 = [v14 sessionID];
  uint64_t v16 = [v6 sessionID];
  if (![v15 isEqual:v16])
  {

LABEL_8:
    goto LABEL_9;
  }
  BOOL v17 = [(SMSessionManager *)self _isActiveDevice];

  if (!v17)
  {
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_10;
  }
  __int16 v18 = [(SMSessionManager *)self state];
  id v19 = [v18 configuration];
  __int16 v20 = [v19 sessionID];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__SMSessionManager__onDeletedMessage_handler___block_invoke;
  v21[3] = &unk_1E6B92690;
  void v21[4] = self;
  uint64_t v22 = v7;
  [(SMSessionManager *)self _endSessionForSessionID:v20 reason:2 handler:v21];

LABEL_10:
}

void __46__SMSessionManager__onDeletedMessage_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) state];
    id v6 = [v5 configuration];
    id v7 = [v6 sessionID];
    int v8 = 136315650;
    id v9 = "-[SMSessionManager _onDeletedMessage:handler:]_block_invoke";
    __int16 v10 = 2112;
    SEL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "SMSessionManager,%s,sessionID:%@, end session due to message deletion with error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)onDeletedConversation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SMSessionManager_onDeletedConversation_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __50__SMSessionManager_onDeletedConversation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedConversation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_onDeletedConversation:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(SMSessionManager *)self state];
    id v10 = [v9 configuration];
    SEL v11 = [v10 sessionID];
    id v12 = [v6 receiverHandles];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v24 = "-[SMSessionManager _onDeletedConversation:handler:]";
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "SMSessionManager,%s,currentSessionID,%@,receiverHandles,%@", buf, 0x20u);
  }
  id v13 = [(SMSessionManager *)self state];
  if (![v13 isActiveState]) {
    goto LABEL_8;
  }
  uint64_t v14 = [(SMSessionManager *)self state];
  id v15 = [v14 configuration];
  uint64_t v16 = [v15 conversation];
  if (!+[SMMessagingUtilities handlesInConversation1:v16 canonicallyEqualsHandlesInConversation2:v6])
  {

LABEL_8:
    goto LABEL_9;
  }
  BOOL v17 = [(SMSessionManager *)self _isActiveDevice];

  if (!v17)
  {
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_10;
  }
  __int16 v18 = [(SMSessionManager *)self state];
  id v19 = [v18 configuration];
  __int16 v20 = [v19 sessionID];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__SMSessionManager__onDeletedConversation_handler___block_invoke;
  v21[3] = &unk_1E6B92690;
  void v21[4] = self;
  uint64_t v22 = v7;
  [(SMSessionManager *)self _endSessionForSessionID:v20 reason:2 handler:v21];

LABEL_10:
}

void __51__SMSessionManager__onDeletedConversation_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) state];
    id v6 = [v5 configuration];
    id v7 = [v6 sessionID];
    int v8 = 136315650;
    id v9 = "-[SMSessionManager _onDeletedConversation:handler:]_block_invoke";
    __int16 v10 = 2112;
    SEL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "SMSessionManager,%s,sessionID:%@, end session due to conversation deletion with error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sessionInitializedWithSessionID:(id)a3 allowReadToken:(id)a4 safetyCacheKey:(id)a5 scheduledSendMessageGUID:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v17)
  {
    __int16 v18 = [(SMSessionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__SMSessionManager_sessionInitializedWithSessionID_allowReadToken_safetyCacheKey_scheduledSendMessageGUID_completionHandler___block_invoke;
    block[3] = &unk_1E6B92500;
    __int16 v21 = v13;
    uint64_t v22 = self;
    id v26 = v17;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    SEL v27 = a2;
    dispatch_async(v18, block);

    id v19 = v21;
  }
  else
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __125__SMSessionManager_sessionInitializedWithSessionID_allowReadToken_safetyCacheKey_scheduledSendMessageGUID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2
    || ([*(id *)(*(void *)(a1 + 40) + 8) configuration],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 sessionID],
        int v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v2 isEqual:v4],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    SEL v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v26 = *(void **)(a1 + 32);
      SEL v27 = [*(id *)(*(void *)(a1 + 40) + 8) configuration];
      id v28 = [v27 sessionID];
      *(_DWORD *)long long buf = 136315650;
      BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      __int16 v54 = 2112;
      uint64_t v55 = v26;
      __int16 v56 = 2112;
      id v57 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Invalid session ID"];
    uint64_t v51 = v14;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = &v51;
    id v17 = &v50;
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 48))
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%s, missing allowReadToken", buf, 0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Missing allowReadToken"];
    __int16 v49 = v14;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = &v49;
    id v17 = &v48;
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 56))
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%s, missing safetyCacheKey", buf, 0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Missing safetyCacheKey"];
    id v47 = v14;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = &v47;
    id v17 = &v46;
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 64))
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%s, missing scheduledSendMessageGUID", buf, 0xCu);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Missing scheduledSendMessageGUID"];
    uint64_t v45 = v14;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = &v45;
    id v17 = &v44;
LABEL_14:
    __int16 v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    id v19 = v12;
    uint64_t v20 = v13;
    uint64_t v21 = 7;
    goto LABEL_15;
  }
  if ([*(id *)(a1 + 40) _canDeviceModifyState])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 8) sessionState] == 10)
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      uint64_t v10 = *(void *)(a1 + 72);
      [v6 _sessionInitializedWithAllowReadToken:v7 safetyCacheKey:v8 scheduledSendMessageGUID:v9 completionHandler:v10];
      return;
    }
    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int8x16_t v39 = [MEMORY[0x1E4F99950] convertSessionStateToString:[*(id *)(*(void *)(a1 + 40) + 8) sessionState]];
      *(_DWORD *)long long buf = 136315394;
      BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      __int16 v54 = 2112;
      uint64_t v55 = v39;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing, current state, %@", buf, 0x16u);
    }
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v38 = *MEMORY[0x1E4F99A48];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Not in Initializing state"];
    double v41 = v14;
    __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v19 = v37;
    uint64_t v20 = v38;
    uint64_t v21 = 16;
LABEL_15:
    uint64_t v22 = (void *)[v19 initWithDomain:v20 code:v21 userInfo:v18];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    return;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v53 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:comp"
          "letionHandler:]_block_invoke";
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%s, User requested to complete session initialization on non active device", buf, 0xCu);
  }

  uint64_t v42 = *MEMORY[0x1E4F28568];
  uint64_t v30 = NSString;
  uint64_t v31 = NSStringFromSelector(*(SEL *)(a1 + 80));
  uint64_t v32 = [v30 stringWithFormat:@"%@ cannot be completed since current device is not active", v31];
  id v43 = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];

  id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
  unint64_t v35 = (void *)[v34 initWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v33];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_sessionInitializedWithAllowReadToken:(id)a3 safetyCacheKey:(id)a4 scheduledSendMessageGUID:(id)a5 completionHandler:(id)a6
{
  state = self->_state;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (id)[(SMSessionManagerState *)state mutableCopy];
  [v15 setSessionState:11];
  [v15 setAllowReadToken:v14];

  [v15 setSafetyCacheKey:v13];
  [v15 setScheduledSendMessageGUID:v12];

  [(SMSessionManager *)self _performStateTransitionTo:v15 transitionType:1 handler:v11];
}

- (void)sendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4 state:(id)a5
{
  id v30 = a4;
  id v7 = a5;
  id v31 = objc_alloc(MEMORY[0x1E4F99938]);
  uint64_t v33 = [v7 configuration];
  uint64_t v8 = [v33 sessionID];
  uint64_t v9 = [v7 configuration];
  uint64_t v10 = [v9 sessionType];
  id v11 = [v7 configuration];
  id v12 = [v11 destination];
  uint64_t v13 = [v12 destinationType];
  unint64_t v35 = v7;
  id v14 = [v7 configuration];
  id v15 = [v14 destination];
  id v16 = [v15 destinationMapItem];
  id v17 = (void *)[v31 initWithSessionID:v8 sessionEndReason:a3 sessionType:v10 destinationType:v13 destinationMapItem:v16];

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__167;
  void v46[4] = __Block_byref_object_dispose__167;
  id v47 = [v17 summaryText];
  __int16 v18 = dispatch_group_create();
  if (a3 == 1)
  {
    id v19 = [v35 configuration];
    uint64_t v20 = [v19 destination];
    uint64_t v21 = [v20 destinationType];

    if (v21 == 4)
    {
      dispatch_group_enter(v18);
      uint64_t v22 = (void *)MEMORY[0x1E4F998F0];
      id v23 = [v35 configuration];
      id v24 = [v23 destination];
      id v25 = [v24 destinationMapItem];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke;
      v42[3] = &unk_1E6B9CFA8;
      v42[4] = self;
      uint64_t v44 = v46;
      SEL v45 = a2;
      id v43 = v18;
      [v22 fetchDestinationNameFromMapItem:v25 completionHandler:v42];
    }
  }
  id v26 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_524;
  block[3] = &unk_1E6B932A0;
  void block[4] = self;
  id v37 = v17;
  id v38 = v30;
  id v39 = v35;
  uint64_t v40 = v46;
  SEL v41 = a2;
  id v27 = v35;
  id v28 = v30;
  id v29 = v17;
  dispatch_group_notify(v18, v26, block);

  _Block_object_dispose(v46, 8);
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F99908] safeArrivalMessageWithCustomizedSummaryForDestination:a2];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#NotificationDeliveryRequest, fetchDestinationNameFromMapItem %@", (uint8_t *)&v14, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_524(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messagingService];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) configuration];
  id v6 = [v5 conversation];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_2;
  v13[3] = &unk_1E6B9CFD0;
  uint64_t v8 = *(void *)(a1 + 72);
  void v13[4] = *(void *)(a1 + 32);
  void v13[5] = v8;
  [v2 sendMadridMessage:v3 associatedGUID:v4 toConversation:v6 summaryText:v7 completion:v13];

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [*(id *)(a1 + 56) configuration];
    uint64_t v11 = [v10 conversation];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 136315650;
    id v15 = "-[SMSessionManager sendSessionEndMessageWithReason:associatedGUID:state:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Sent iMessage to conversation, %@, message, %@", buf, 0x20u);
  }
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v9 = "failure";
    int v10 = 138412802;
    uint64_t v11 = v8;
    if (a3) {
      uint64_t v9 = "success";
    }
    __int16 v12 = 2080;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "SMSessionManager,%@,sendMessage returned with status,%s,error,%@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _resetPendingSendSessionEndMessage];
}

- (void)processNearbyEffectivePairedDeviceChanged:(id)a3
{
  id v5 = a3;
  id v6 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMSessionManager_processNearbyEffectivePairedDeviceChanged___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __62__SMSessionManager_processNearbyEffectivePairedDeviceChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) state];
    uint64_t v4 = [v3 configuration];
    id v5 = [v4 sessionID];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 40);
    int v11 = 138413058;
    __int16 v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,effectivePairedDevice changed %@", (uint8_t *)&v11, 0x2Au);
  }
  return [*(id *)(a1 + 32) _processNearbyEffectivePairedDeviceChanged:*(void *)(a1 + 40)];
}

- (void)_processNearbyEffectivePairedDeviceChanged:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  if (v100)
  {
    val = self;
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v96 = [v100 name];
      int v94 = [v100 isNearby];
      id v97 = [(SMSessionManager *)self state];
      id v5 = [v97 configuration];
      id v6 = [v5 sessionID];
      id v7 = [(SMSessionManager *)self status];
      uint64_t v8 = [v7 lastSessionIDDuringMagnetBreak];
      uint64_t v9 = [(SMSessionManager *)self magnetBreakTimer];
      SEL v10 = [(SMSessionManager *)val state];
      int v11 = [v10 isActiveState];
      __int16 v12 = [(SMSessionManager *)val state];
      *(_DWORD *)long long buf = 136316930;
      unint64_t v110 = "-[SMSessionManager _processNearbyEffectivePairedDeviceChanged:]";
      __int16 v111 = 2112;
      id v112 = v96;
      __int16 v113 = 1024;
      *(_DWORD *)v114 = v94;
      *(_WORD *)&v114[4] = 2112;
      *(void *)&v114[6] = v6;
      *(_WORD *)&v114[14] = 2112;
      *(void *)&v114[16] = v8;
      *(_WORD *)&v114[24] = 1024;
      *(_DWORD *)&v114[26] = v9 != 0;
      LOWORD(v115) = 1024;
      *(_DWORD *)((char *)&v115 + 2) = v11;
      HIWORD(v115) = 2112;
      unint64_t v116 = v12;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, effectivePairedDevice, %@, effectivePairedDevice.nearby, %{Bool}d, sessionID, %@, lastSessionIDDuringMagnetBreak, %@, magnetBreakTimer, %{Bool}d, is state active state, %{Bool}d, state, %@", buf, 0x46u);
    }
    BOOL v13 = [(SMSessionManager *)val _shouldExitHysteresisState:[(SMSessionManager *)val _getCurrentHysteresisStateType] nearbyDeviceConnected:[(SMSessionManager *)val _isEffectivePairedDeviceNearby]];
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [(SMSessionManager *)val state];
      uint64_t v16 = [v15 configuration];
      __int16 v17 = [v16 sessionID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      uint64_t v19 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = NSStringFromSelector(a2);
      uint64_t v21 = [(SMSessionManager *)val _getCurrentHysteresisStateType];
      BOOL v22 = [(SMSessionManager *)val _isEffectivePairedDeviceNearby];
      *(_DWORD *)long long buf = 138413570;
      unint64_t v110 = v17;
      __int16 v111 = 2112;
      id v112 = v19;
      __int16 v113 = 2112;
      *(void *)v114 = v20;
      *(_WORD *)&v114[8] = 2048;
      *(void *)&v114[10] = v21;
      *(_WORD *)&v114[18] = 1024;
      *(_DWORD *)&v114[20] = v22;
      *(_WORD *)&v114[24] = 1024;
      *(_DWORD *)&v114[26] = v13;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, hysteresisState, %lu, isNearbyDeviceConnected, %d, shouldExitHysteresisState, %d", buf, 0x36u);
    }
    if (v13)
    {
      [(SMSessionManager *)val _cancelMagnetBreakTimerAndExitHysteresisState];
      goto LABEL_34;
    }
    id v24 = [(SMSessionManager *)val magnetBreakTimer];

    if (v24)
    {
      id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [(SMSessionManager *)val state];
        id v27 = [v26 configuration];
        id v28 = [v27 sessionID];
        id v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        id v30 = (id *)objc_claimAutoreleasedReturnValue();
        id v31 = NSStringFromSelector(a2);
        uint64_t v32 = [(SMSessionManager *)val _getCurrentHysteresisStateType];
        BOOL v33 = [(SMSessionManager *)val _isEffectivePairedDeviceNearby];
        *(_DWORD *)long long buf = 138413314;
        unint64_t v110 = v28;
        __int16 v111 = 2112;
        id v112 = v30;
        __int16 v113 = 2112;
        *(void *)v114 = v31;
        *(_WORD *)&v114[8] = 2048;
        *(void *)&v114[10] = v32;
        *(_WORD *)&v114[18] = 1024;
        *(_DWORD *)&v114[20] = v33;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, hysteresisState, %lu, isNearbyDeviceConnected, %d, already processing a magnetEvent, waiting for the XPC timer to finish hysteresis, returning", buf, 0x30u);
      }
      goto LABEL_34;
    }
    id v34 = [(SMSessionManager *)val state];
    char v35 = [v34 isActiveState];

    if (v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F29128] UUID];
      id v37 = [v100 uniqueIDOverride];
      unint64_t v98 = (void *)[v36 initWithUUIDString:v37];

      id v38 = [(SMSessionManager *)val state];
      id v39 = [v38 activeDeviceIdentifier];
      if ([v98 isEqual:v39])
      {
      }
      else
      {
        id v47 = [(SMSessionManager *)val state];
        uint64_t v48 = [v47 activePairedDeviceIdentifier];
        char v49 = [v98 isEqual:v48];

        if ((v49 & 1) == 0)
        {
          uint64_t v82 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            uint64_t v83 = [(SMSessionManager *)val state];
            __int16 v84 = [v83 configuration];
            uint64_t v85 = [v84 sessionID];
            uint64_t v86 = (objc_class *)objc_opt_class();
            NSStringFromClass(v86);
            id v87 = (id *)objc_claimAutoreleasedReturnValue();
            id v88 = NSStringFromSelector(a2);
            uint64_t v89 = [(SMSessionManager *)val state];
            id v90 = [v89 activeDeviceIdentifier];
            id v91 = [(SMSessionManager *)val state];
            unint64_t v92 = [v91 activePairedDeviceIdentifier];
            *(_DWORD *)long long buf = 138413570;
            unint64_t v110 = v85;
            __int16 v111 = 2112;
            id v112 = v87;
            __int16 v113 = 2112;
            *(void *)v114 = v88;
            *(_WORD *)&v114[8] = 2112;
            *(void *)&v114[10] = v98;
            *(_WORD *)&v114[18] = 2112;
            *(void *)&v114[20] = v90;
            *(_WORD *)&v114[28] = 2112;
            id v115 = v92;
            _os_log_impl(&dword_1D9BFA000, v82, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Ignoring changed device %@, activeDeviceIdentifier %@, activePairedDeviceIdentifier %@", buf, 0x3Eu);
          }
          goto LABEL_33;
        }
      }
      objc_initWeak(&location, val);
      uint64_t v50 = [(SMSessionManager *)val state];
      uint64_t v51 = [v50 configuration];
      uint64_t v52 = [v51 sessionID];

      BOOL v53 = (objc_class *)objc_opt_class();
      __int16 v54 = NSStringFromClass(v53);
      if ([(SMSessionManager *)val _isEffectivePairedDeviceNearby]) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = 2;
      }
      __int16 v56 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        id v57 = [(SMSessionManager *)val state];
        uint64_t v58 = [v57 configuration];
        unsigned int v59 = [v58 sessionID];
        BOOL v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        __int16 v61 = (id *)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v62 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138413058;
        unint64_t v110 = v59;
        __int16 v111 = 2112;
        id v112 = v61;
        __int16 v113 = 2112;
        *(void *)v114 = v62;
        *(_WORD *)&v114[8] = 2048;
        *(void *)&v114[10] = v55;
        _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Entering hysteresis state %lu", buf, 0x2Au);
      }
      [(SMSessionManager *)val _setHysteresisState:v55];
      [(SMSessionManager *)val _updateUnsupportedSeparationStateIfNeededWithNotify:0];
      BOOL v63 = [RTXPCTimerAlarm alloc];
      id v64 = [(SMSessionManager *)val queue];
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __63__SMSessionManager__processNearbyEffectivePairedDeviceChanged___block_invoke;
      v103[3] = &unk_1E6B987A0;
      objc_copyWeak(v107, &location);
      id v93 = v52;
      id v104 = v93;
      id v65 = v54;
      v107[1] = (id)a2;
      id v95 = v65;
      id v105 = v65;
      id v106 = val;
      uint64_t v66 = [(RTXPCTimerAlarm *)v63 initWithIdentifier:@"com.apple.routined.magnetBreakTimer" queue:v64 handler:v103];
      [(SMSessionManager *)val setMagnetBreakTimer:v66];

      double magnetBreakTimerInterval = val->_magnetBreakTimerInterval;
      unint64_t v68 = [(SMSessionManager *)val defaultsManager];
      long long v69 = [v68 objectForKey:@"RTDefaultsSessionManagerHysteresisMagnetEventDateKey"];

      id v70 = [(SMSessionManager *)val magnetBreakTimer];
      unint64_t v71 = [v69 dateByAddingTimeInterval:magnetBreakTimerInterval];
      id v102 = 0;
      int v72 = [v70 fireWithDate:v71 error:&v102];
      id v73 = v102;

      uint64_t v74 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        uint64_t v75 = [(SMSessionManager *)val state];
        id v76 = [v75 configuration];
        uint64_t v77 = [v76 sessionID];
        __int16 v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        uint64_t v79 = (id *)(id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v80 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v81 = [v73 localizedDescription];
        *(_DWORD *)long long buf = 138413314;
        unint64_t v110 = v77;
        __int16 v111 = 2112;
        id v112 = v79;
        __int16 v113 = 2112;
        *(void *)v114 = v80;
        *(_WORD *)&v114[8] = 1024;
        *(_DWORD *)&v114[10] = v72;
        *(_WORD *)&v114[14] = 2112;
        *(void *)&v114[16] = v81;
        _os_log_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,magnetBreak timer scheduled %d with error, %@", buf, 0x30u);
      }
      objc_destroyWeak(v107);

      objc_destroyWeak(&location);
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      SEL v41 = [(SMSessionManager *)val state];
      uint64_t v42 = [v41 configuration];
      id v43 = [v42 sessionID];
      uint64_t v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      SEL v45 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v46 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412802;
      unint64_t v110 = v43;
      __int16 v111 = 2112;
      id v112 = v45;
      __int16 v113 = 2112;
      *(void *)v114 = v46;
      _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,The session is no longer active", buf, 0x20u);
    }
    [(SMSessionManager *)val _updateUnsupportedSeparationStateIfNeededWithNotify:0];
  }
  else
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: effectivePairedDevice", buf, 2u);
    }
  }
LABEL_34:
}

void __63__SMSessionManager__processNearbyEffectivePairedDeviceChanged___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_8;
  }
  uint64_t v4 = [WeakRetained state];
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = (void *)v4;
  id v6 = [v3 state];
  char v7 = [v6 isActiveState];

  if (v7)
  {
    int v8 = [v3 _isEffectivePairedDeviceNearby];
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      SEL v10 = [v3 state];
      int v11 = [v10 configuration];
      __int16 v12 = [v11 sessionID];
      BOOL v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      __int16 v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v20 = 138413058;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 1024;
      int v27 = v8;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,magnetBreak timer fired deviceIsNearby %d", (uint8_t *)&v20, 0x26u);
    }
    [v3 _cancelMagnetBreakTimerAndExitHysteresisState];
    if (v8) {
      [v3 _handleMagnetConnect:1];
    }
    else {
      [v3 _handleMagnetBreak];
    }
  }
  else
  {
LABEL_8:
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v20 = 138412802;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,The session is no longer active after magnetBreak timer fire", (uint8_t *)&v20, 0x20u);
    }
    [v3 _cancelMagnetBreakTimerAndExitHysteresisState];
  }
}

- (BOOL)_shouldExitHysteresisState:(unint64_t)a3 nearbyDeviceConnected:(BOOL)a4
{
  BOOL v4 = !a4;
  if (a3 != 1) {
    BOOL v4 = 0;
  }
  if (a3 == 2) {
    return a4;
  }
  else {
    return v4;
  }
}

- (void)_cancelMagnetBreakTimerAndExitHysteresisState
{
  uint64_t v3 = [(SMSessionManager *)self magnetBreakTimer];

  if (v3)
  {
    BOOL v4 = [(SMSessionManager *)self magnetBreakTimer];
    [(SMSessionManager *)self _invalidateTimer:v4];

    [(SMSessionManager *)self setMagnetBreakTimer:0];
  }

  [(SMSessionManager *)self _clearHysteresisState];
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  id v2 = [(SMSessionManager *)self messagingService];
  uint64_t v3 = [v2 effectivePairedDevice];
  char v4 = [v3 isNearby];

  return v4;
}

- (BOOL)_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  char v7 = [(SMSessionManager *)self messagingService];
  int v8 = [v7 effectivePairedDevice];
  uint64_t v9 = [v8 uniqueIDOverride];
  SEL v10 = (void *)[v6 initWithUUIDString:v9];
  uint64_t v11 = [v5 compare:v10];

  return v11 == 0;
}

- (unint64_t)_getCurrentHysteresisStateType
{
  id v2 = [(SMSessionManager *)self defaultsManager];
  uint64_t v3 = [v2 objectForKey:@"RTDefaultsSessionManagerHysteresisEventTypeKey"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (void)_setHysteresisState:(unint64_t)a3
{
  id v5 = [(SMSessionManager *)self defaultsManager];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKey:@"RTDefaultsSessionManagerHysteresisEventTypeKey"];

  id v8 = [(SMSessionManager *)self defaultsManager];
  char v7 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setObject:v7 forKey:@"RTDefaultsSessionManagerHysteresisMagnetEventDateKey"];
}

- (void)_clearHysteresisState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(SMSessionManager *)self state];
    id v6 = [v5 configuration];
    char v7 = [v6 sessionID];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    SEL v10 = NSStringFromSelector(a2);
    int v13 = 138412802;
    __int16 v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, clearing hysteresis state", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = [(SMSessionManager *)self defaultsManager];
  [v11 setObject:&unk_1F3452880 forKey:@"RTDefaultsSessionManagerHysteresisEventTypeKey"];

  __int16 v12 = [(SMSessionManager *)self defaultsManager];
  [v12 setObject:0 forKey:@"RTDefaultsSessionManagerHysteresisMagnetEventDateKey"];

  [(SMSessionManager *)self _updateUnsupportedSeparationStateIfNeededWithNotify:0];
}

- (void)_handleMagnetBreakPhone
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(SMSessionManager *)self state];
    id v6 = [v5 configuration];
    char v7 = [v6 sessionID];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    SEL v10 = NSStringFromSelector(a2);
    int v23 = 138412802;
    __int16 v24 = v7;
    __int16 v25 = 2112;
    __int16 v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,handle magnetBreak phone noop; nothing to do, watch should try to bec"
      "ome the active device ",
      (uint8_t *)&v23,
      0x20u);
  }
  if (![(SMSessionManager *)self _isActiveDevice])
  {
    uint64_t v11 = [(SMSessionManager *)self state];
    __int16 v12 = [v11 configuration];
    uint64_t v13 = [v12 sessionType];

    if (v13 == 4)
    {
      __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = [(SMSessionManager *)self state];
        uint64_t v16 = [v15 configuration];
        __int16 v17 = [v16 sessionID];
        uint64_t v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        int v20 = NSStringFromSelector(a2);
        int v23 = 138412802;
        __int16 v24 = v17;
        __int16 v25 = 2112;
        __int16 v26 = v19;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, magnet break for workout session on phone", (uint8_t *)&v23, 0x20u);
      }
      [(SMSessionManager *)self _updateUnsupportedSeparationStateIfNeededWithNotify:1];
      uint64_t v21 = (void *)MEMORY[0x1E4F99808];
      __int16 v22 = [(SMSessionManager *)self state];
      [v21 updateActivityWithState:v22 localState:self->_localState shouldNotify:1];
    }
  }
}

- (void)_handleMagnetConnectPhone:(int64_t)a3
{
  id v6 = objc_alloc_init(SMHandoffMetricsManager);
  handoffMetrics = self->_handoffMetrics;
  self->_handoffMetrics = v6;

  [(SMHandoffMetricsManager *)self->_handoffMetrics startMetricsCollection];
  [(SMHandoffMetricsManager *)self->_handoffMetrics addMetricHandoffReason:a3];
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  SEL v10 = [(SMSessionManager *)self state];
  uint64_t v11 = [v10 configuration];
  __int16 v12 = [v11 sessionID];
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v9, v12);

  __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  __int16 v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMHandoffSessionLatency", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = [(SMSessionManager *)self state];
  __int16 v17 = [v16 configuration];
  uint64_t v18 = [v17 sessionID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__SMSessionManager__handleMagnetConnectPhone___block_invoke;
  v20[3] = &unk_1E6B9CFF8;
  id v21 = v8;
  __int16 v22 = self;
  os_signpost_id_t v23 = v13;
  SEL v24 = a2;
  id v19 = v8;
  [(SMSessionManager *)self handoffSessionForSessionID:v18 handler:v20];
}

void __46__SMSessionManager__handleMagnetConnectPhone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMHandoffSessionLatency", " enableTelemetry=YES ", buf, 2u);
  }

  char v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v9 = v8;

  [*(id *)(*(void *)(a1 + 40) + 24) addMetricForLatencyHandoffEndToEnd:v9];
  SEL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [*(id *)(a1 + 40) state];
    __int16 v12 = [v11 configuration];
    os_signpost_id_t v13 = [v12 sessionID];
    __int16 v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)long long buf = 138413058;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, phone device handle magnetConnect finished with error %@ ", buf, 0x2Au);
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v3)
  {
    [*(id *)(v17 + 24) addMetricErrorCode:[v3 code]];
    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 24);
    id v19 = [v3 domain];
    [v18 addMetricErrorDomain:v19];

    int v20 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v21 = 0;
  }
  else
  {
    int v20 = *(void **)(v17 + 24);
    uint64_t v21 = 1;
  }
  [v20 addMetricSucceeded:v21];
  __int16 v22 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v23 = 0;
  [v22 submitMetricsWithError:&v23];
}

- (BOOL)_isEligibleOutOfOrderStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!v6)
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      BOOL v10 = 0;
      goto LABEL_10;
    }
    LOWORD(v14) = 0;
    __int16 v12 = "Invalid parameter not satisfying: stateSyncMessage";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v14) = 0;
    __int16 v12 = "Invalid parameter not satisfying: currentSessionManagerState";
    goto LABEL_18;
  }
  if ([(SMSessionManager *)self _isEligibleRecentHandoffMessage:v6 currentSessionManagerState:self->_state])
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      __int16 v15 = "-[SMSessionManager _isEligibleOutOfOrderStateSyncMessage:currentSessionManagerState:]";
      __int16 v16 = 2112;
      id v17 = v6;
      uint64_t v11 = "%s, received state transition message type SMStateTransitionTypeHandoffBecomeActive, with older state, but w"
            "ithin accepted delta, stateSyncMessage, %@";
LABEL_15:
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (![(SMSessionManager *)self _isEligibleOutOfOrderEndSessionMessage:v6 currentSessionManagerState:self->_state])
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
    double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      __int16 v15 = "-[SMSessionManager _isEligibleOutOfOrderStateSyncMessage:currentSessionManagerState:]";
      __int16 v16 = 2112;
      id v17 = v6;
      uint64_t v11 = "%s, received state transition message to endState, with older date, but within accepted delta and same sessi"
            "onID, stateSyncMessage, %@";
      goto LABEL_15;
    }
  }
LABEL_10:

LABEL_11:
  return v10;
}

- (BOOL)_isEligibleOutOfOrderEndSessionMessage:(id)a3 currentSessionManagerState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      char v15 = 0;
      goto LABEL_15;
    }
    __int16 v21 = 0;
    id v17 = "Invalid parameter not satisfying: stateSyncMessage";
    uint64_t v18 = (uint8_t *)&v21;
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_10;
  }
  if (!v6)
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    __int16 v20 = 0;
    id v17 = "Invalid parameter not satisfying: currentSessionManagerState";
    uint64_t v18 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  double v8 = [v5 sessionID];
  double v9 = [v7 configuration];
  BOOL v10 = [v9 sessionID];
  if ([v8 isEqual:v10])
  {
    uint64_t v11 = [v7 date];
    __int16 v12 = [v5 sessionManagerState];
    os_signpost_id_t v13 = [v12 date];
    if ([v11 isAfterDate:v13] && objc_msgSend(v7, "isActiveState"))
    {
      int v14 = [v5 sessionManagerState];
      char v15 = [v14 isEndSessionState];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

LABEL_15:
  return v15;
}

- (BOOL)_isEligibleRecentHandoffMessage:(id)a3 currentSessionManagerState:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      os_signpost_id_t v13 = "Invalid parameter not satisfying: stateSyncMessage";
LABEL_11:
      int v14 = v12;
      uint32_t v15 = 2;
LABEL_12:
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!v6)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      os_signpost_id_t v13 = "Invalid parameter not satisfying: currentSessionManagerState";
      goto LABEL_11;
    }
    goto LABEL_19;
  }
  if ([v5 stateTransitionType] != 2)
  {
LABEL_20:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  double v8 = [v5 sessionManagerState];
  double v9 = [v8 date];
  BOOL v10 = [v7 date];
  if (![v9 isAfterDate:v10])
  {

    goto LABEL_14;
  }
  char v11 = [v7 isActiveState];

  if ((v11 & 1) == 0)
  {
LABEL_14:
    __int16 v16 = [v7 date];
    id v17 = [v5 date];
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;

    double v20 = -v19;
    if (v19 >= 0.0) {
      double v20 = v19;
    }
    if (v20 < 10.0) {
      goto LABEL_17;
    }
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v23 = 134217984;
    double v24 = v19;
    os_signpost_id_t v13 = "Out of order SMStateTransitionTypeHandoffBecomeActive, interval %f";
    int v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_12;
  }
LABEL_17:
  BOOL v21 = 1;
LABEL_21:

  return v21;
}

- (BOOL)_isEligibleTransitionFromStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 sessionManagerState];
  double v8 = [v6 configuration];
  double v9 = [v8 sessionID];
  BOOL v10 = [v7 configuration];
  char v11 = [v10 sessionID];
  if (![v9 isEqual:v11] || !objc_msgSend(v6, "isEndSessionState"))
  {

    goto LABEL_8;
  }
  char v12 = [v7 isEndSessionState];

  if (v12)
  {
LABEL_8:
    BOOL v14 = 1;
    goto LABEL_9;
  }
  os_signpost_id_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[SMSessionManager _isEligibleTransitionFromStateSyncMessage:currentSessionManagerState:]";
    __int16 v18 = 1024;
    BOOL v19 = [(SMSessionManager *)self _isActiveDevice];
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, stateSyncMessage invalid transition, NotActive State -> Active State, isActiveDevice, %{Bool}d", (uint8_t *)&v16, 0x12u);
  }

  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)_isEligibleToBecomeNonActiveDeviceForHandoffStateSyncMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SMSessionManagerState *)self->_state activeDeviceIdentifier];
  id v7 = [v5 sessionManagerState];
  double v8 = [v7 activeDeviceIdentifier];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v11 = [(SMSessionManager *)self state];
      char v12 = [v11 configuration];
      os_signpost_id_t v13 = [v12 sessionID];
      BOOL v14 = (objc_class *)objc_opt_class();
      uint32_t v15 = NSStringFromClass(v14);
      int v16 = NSStringFromSelector(a2);
      int v25 = 138412802;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      __int16 v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@, not mismatching in the active device identifier and not eligible for handoff", (uint8_t *)&v25, 0x20u);
LABEL_10:

      goto LABEL_7;
    }
    goto LABEL_7;
  }
  id v17 = [(SMSessionManagerState *)self->_state configuration];
  __int16 v18 = [v17 sessionID];
  BOOL v19 = [v5 sessionID];
  int v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v11 = [(SMSessionManager *)self state];
      char v12 = [v11 configuration];
      os_signpost_id_t v13 = [v12 sessionID];
      int v23 = (objc_class *)objc_opt_class();
      uint32_t v15 = NSStringFromClass(v23);
      int v16 = NSStringFromSelector(a2);
      double v24 = [v5 sessionID];
      int v25 = 138413058;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      __int16 v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@,receiving a handoff message for a different session, stateSyncMessage.sessionID %@", (uint8_t *)&v25, 0x2Au);

      goto LABEL_10;
    }
LABEL_7:

    BOOL v21 = 0;
    goto LABEL_8;
  }
  BOOL v21 = 1;
LABEL_8:

  return v21;
}

- (void)_becomeActiveDeviceForSessionWithHandler:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SMSessionManager *)self messagingService];
  id v7 = [v6 deviceIdentifier];
  double v8 = [(SMSessionManager *)self state];
  int v9 = [v8 activeDeviceIdentifier];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    char v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v37 = [(SMSessionManager *)self state];
      id v38 = [v37 configuration];
      id v39 = [v38 sessionID];
      uint64_t v40 = (objc_class *)objc_opt_class();
      SEL v41 = NSStringFromClass(v40);
      uint64_t v42 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v50 = v39;
      __int16 v51 = 2112;
      *(void *)uint64_t v52 = v41;
      *(_WORD *)&v52[8] = 2112;
      *(void *)&v52[10] = v42;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@,Already the active device for the session device", buf, 0x20u);
    }
  }
  char v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    os_signpost_id_t v13 = [(SMSessionManager *)self state];
    BOOL v14 = [v13 configuration];
    uint32_t v15 = [v14 sessionID];
    int v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    __int16 v18 = NSStringFromSelector(a2);
    BOOL v19 = [(SMSessionManager *)self messagingService];
    int v20 = [v19 deviceIdentifier];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v50 = v15;
    __int16 v51 = 2112;
    *(void *)uint64_t v52 = v17;
    *(_WORD *)&v52[8] = 2112;
    *(void *)&v52[10] = v18;
    __int16 v53 = 2112;
    __int16 v54 = v20;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Becoming the active device, deviceIdentifier, %@", buf, 0x2Au);
  }
  BOOL v21 = [(SMSessionManager *)self state];
  __int16 v22 = (void *)[v21 mutableCopy];

  int v23 = [(SMSessionManager *)self messagingService];
  double v24 = [v23 deviceIdentifier];
  [v22 setActiveDeviceIdentifier:v24];

  int v25 = [MEMORY[0x1E4F29128] UUID];
  __int16 v26 = [(SMSessionManager *)self messagingService];
  __int16 v27 = [v26 effectivePairedDevice];
  __int16 v28 = [v27 uniqueIDOverride];
  __int16 v29 = (void *)[v25 initWithUUIDString:v28];
  [v22 setActivePairedDeviceIdentifier:v29];

  __int16 v30 = [MEMORY[0x1E4F1C9C8] now];
  [v22 setDate:v30];

  __int16 v31 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  SEL v45 = __61__SMSessionManager__becomeActiveDeviceForSessionWithHandler___block_invoke;
  uint64_t v46 = &unk_1E6B92690;
  id v47 = self;
  id v32 = v5;
  id v48 = v32;
  BOOL v33 = [(SMSessionManager *)self _performStateTransitionTo:v22 transitionType:2 handler:&v43];
  id v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    char v35 = [MEMORY[0x1E4F1C9C8] date:v43, v44, v45, v46, v47];
    [v35 timeIntervalSinceDate:v31];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v50 = "-[SMSessionManager _becomeActiveDeviceForSessionWithHandler:]";
    __int16 v51 = 1024;
    *(_DWORD *)uint64_t v52 = v33;
    *(_WORD *)&v52[4] = 2048;
    *(void *)&v52[6] = v36;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%s, handoff finished, %{Bool}d, latency, %.2f", buf, 0x1Cu);
  }
}

void __61__SMSessionManager__becomeActiveDeviceForSessionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) defaultsManager];
  [v4 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsSessionManagerHandoffInProgressKey"];

  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    double v8 = "-[SMSessionManager _becomeActiveDeviceForSessionWithHandler:]_block_invoke";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s state transition complete, error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 138412290;
      double v8 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_FAULT, "Given that we have gotten the successful handoff criteria (CK record etc) this error should not happen. error, %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateActivityWithState:(id)a3
{
}

- (void)_updateActivityWithState:(id)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(SMLocalSessionState *)self->_localState unsupportedDeviceSeparationState];
  double v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = [v6 description];
    int v10 = 136315650;
    uint64_t v11 = "-[SMSessionManager _updateActivityWithState:shouldNotify:]";
    __int16 v12 = 2112;
    os_signpost_id_t v13 = v9;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%s,state,%@, disconnected,%{Bool}d", (uint8_t *)&v10, 0x1Cu);
  }
  [MEMORY[0x1E4F99808] updateActivityWithState:v6 localState:self->_localState shouldNotify:v4];
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  __int16 v14 = (void (**)(id, void *))a6;
  if (v14)
  {
    int v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315906;
      uint64_t v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
      __int16 v82 = 2112;
      id v83 = v11;
      __int16 v84 = 2112;
      id v85 = v12;
      __int16 v86 = 2112;
      id v87 = v13;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, notification identifier, %@, session identifier, %@, action identifier, %@,", buf, 0x2Au);
    }

    long long v69 = self;
    if (v11)
    {
      uint64_t v16 = 0;
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F99A48];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      BOOL v19 = NSString;
      int v20 = NSStringFromSelector(a2);
      BOOL v21 = [v19 stringWithFormat:@"%@, missing notification identifier", v20];
      uint64_t v79 = v21;
      __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      uint64_t v16 = (void *)[v17 initWithDomain:v18 code:7 userInfo:v22];

      self = v69;
      v14[2](v14, v16);
    }
    id v67 = v11;
    if (!v12)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F99A48];
      uint64_t v76 = *MEMORY[0x1E4F28568];
      int v25 = NSString;
      __int16 v26 = NSStringFromSelector(a2);
      __int16 v27 = [v25 stringWithFormat:@"%@, missing session identifier", v26];
      uint64_t v77 = v27;
      __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      uint64_t v29 = [v23 initWithDomain:v24 code:7 userInfo:v28];

      self = v69;
      v14[2](v14, (void *)v29);
      uint64_t v16 = (void *)v29;
    }
    aSelector = a2;
    __int16 v30 = [(SMSessionManagerState *)self->_state configuration];
    __int16 v31 = [v30 sessionID];
    id v32 = [v31 UUIDString];
    char v33 = [v12 isEqualToString:v32];

    id v66 = v12;
    if ((v33 & 1) == 0)
    {
      id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F99A48];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      char v35 = NSString;
      uint64_t v36 = NSStringFromSelector(aSelector);
      id v37 = [(SMSessionManagerState *)self->_state configuration];
      id v38 = [v37 sessionID];
      uint64_t v39 = [v38 UUIDString];
      id v40 = v12;
      SEL v41 = (void *)v39;
      uint64_t v42 = [v35 stringWithFormat:@"%@, session identifier, %@, does not match sessionId from config, %@", v36, v40, v39];
      uint64_t v75 = v42;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      v44 = id v43 = v13;
      uint64_t v45 = [v65 initWithDomain:v34 code:7 userInfo:v44];

      id v13 = v43;
      self = v69;

      v14[2](v14, (void *)v45);
      uint64_t v16 = (void *)v45;
    }
    if (!v13)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F99A48];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      id v48 = NSString;
      char v49 = NSStringFromSelector(aSelector);
      uint64_t v50 = [v48 stringWithFormat:@"%@, missing action identifier", v49];
      id v73 = v50;
      __int16 v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      uint64_t v52 = [v46 initWithDomain:v47 code:7 userInfo:v51];

      id v13 = 0;
      v14[2](v14, (void *)v52);
      uint64_t v16 = (void *)v52;
    }
    if (([v13 isEqualToString:*MEMORY[0x1E4F99A00]] & 1) != 0
      || [v13 isEqualToString:*MEMORY[0x1E4F99A08]])
    {
      __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
        _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%s, executing code path for extend", buf, 0xCu);
      }

      __int16 v54 = [(SMSessionManagerState *)self->_state configuration];
      uint64_t v55 = [v54 sessionID];
      [(SMSessionManager *)self respondToTriggerPromptForSessionID:v55 response:2 handler:v14];
    }
    else
    {
      id v56 = v13;
      id v57 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
        _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%s, action identifier to code path mapping is invalid", buf, 0xCu);
      }

      id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v59 = *MEMORY[0x1E4F99A48];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      BOOL v60 = NSString;
      __int16 v61 = NSStringFromSelector(aSelector);
      uint64_t v62 = [v60 stringWithFormat:@"%@, action identifier to code path mapping is invalid", v61];
      unint64_t v71 = v62;
      BOOL v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v64 = [v58 initWithDomain:v59 code:7 userInfo:v63];

      v14[2](v14, (void *)v64);
      uint64_t v16 = (void *)v64;
      id v13 = v56;
    }

    id v12 = v66;
    id v11 = v67;
  }
}

- (void)onMessagesAppUninstalled
{
  id v3 = [(SMSessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SMSessionManager_onMessagesAppUninstalled__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__SMSessionManager_onMessagesAppUninstalled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMessagesAppUninstalled];
}

- (void)_onMessagesAppUninstalled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(SMSessionManager *)self state];
  int v4 = [v3 isActiveState];

  if (v4)
  {
    id v5 = [(SMSessionManager *)self state];
    id v6 = [v5 configuration];
    int v7 = [v6 sessionID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__SMSessionManager__onMessagesAppUninstalled__block_invoke;
    v9[3] = &unk_1E6B90840;
    v9[4] = self;
    [(SMSessionManager *)self _endSessionForSessionID:v7 reason:10 handler:v9];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v8 = [(SMSessionManager *)self state];
      *(_DWORD *)long long buf = 136315394;
      id v11 = "-[SMSessionManager _onMessagesAppUninstalled]";
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "SMSessionManager,%s,ignoring deletion notification in non-active state,%@", buf, 0x16u);
    }
  }
}

void __45__SMSessionManager__onMessagesAppUninstalled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) state];
    id v6 = [v5 configuration];
    int v7 = [v6 sessionID];
    int v8 = 136315650;
    __int16 v9 = "-[SMSessionManager _onMessagesAppUninstalled]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "SMSessionManager,%s,sessionID:%@, end session due to message app deletion with error,%@", (uint8_t *)&v8, 0x20u);
  }
}

- (SMActiveSessionDetails)activeSessionDetails
{
  return self->_activeSessionDetails;
}

- (void)setActiveSessionDetails:(id)a3
{
}

- (RTTimer)activeSessionDetailsTimeoutTimer
{
  return self->_activeSessionDetailsTimeoutTimer;
}

- (void)setActiveSessionDetailsTimeoutTimer:(id)a3
{
}

- (double)activeSessionDetailsFetchTimeout
{
  return self->_activeSessionDetailsFetchTimeout;
}

- (void)setActiveSessionDetailsFetchTimeout:(double)a3
{
  self->_activeSessionDetailsFetchTimeout = a3;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
}

- (double)cacheReleaseMaxDuration
{
  return self->_cacheReleaseMaxDuration;
}

- (void)setCacheReleaseMaxDuration:(double)a3
{
  self->_cacheReleaseMaxDuration = a3;
}

- (int64_t)cachedInitiatorEligibilty
{
  return self->_cachedInitiatorEligibilty;
}

- (void)setCachedInitiatorEligibilty:(int64_t)a3
{
  self->_cachedInitiatorEligibilty = a3;
}

- (RTTimer)handoffRetryTimer
{
  return self->_handoffRetryTimer;
}

- (void)setHandoffRetryTimer:(id)a3
{
}

- (OS_dispatch_queue)initiatorEligibilityQueue
{
  return self->_initiatorEligibilityQueue;
}

- (void)setInitiatorEligibilityQueue:(id)a3
{
}

- (double)magnetBreakTimerInterval
{
  return self->_magnetBreakTimerInterval;
}

- (void)setMagnetBreakTimerInterval:(double)a3
{
  self->_double magnetBreakTimerInterval = a3;
}

- (double)sendSessionEndMessageTimeout
{
  return self->_sendSessionEndMessageTimeout;
}

- (void)setSendSessionEndMessageTimeout:(double)a3
{
  self->_sendSessionEndMessageTimeout = a3;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SMActiveSessionZoneProtocol)activeSessionDetailsDelegate
{
  return self->_activeSessionDetailsDelegate;
}

- (void)setActiveSessionDetailsDelegate:(id)a3
{
}

- (RTXPCTimerAlarm)checkInXPCTimerAlarm
{
  return self->_checkInXPCTimerAlarm;
}

- (void)setCheckInXPCTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)magnetBreakTimer
{
  return self->_magnetBreakTimer;
}

- (void)setMagnetBreakTimer:(id)a3
{
}

- (RTXPCTimerAlarm)cacheReleaseXPCTimerAlarm
{
  return self->_cacheReleaseXPCTimerAlarm;
}

- (void)setCacheReleaseXPCTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)endAwarenessBeforeUnlockXPCTimerAlarm
{
  return self->_endAwarenessBeforeUnlockXPCTimerAlarm;
}

- (void)setEndAwarenessBeforeUnlockXPCTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)endCarouselSessionXPCTimerAlarm
{
  return self->_endCarouselSessionXPCTimerAlarm;
}

- (void)setEndCarouselSessionXPCTimerAlarm:(id)a3
{
}

- (SMScreenLockMonitor)screenLockMonitor
{
  return self->_screenLockMonitor;
}

- (void)setScreenLockMonitor:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (unint64_t)sessionStoreAvailability
{
  return self->_sessionStoreAvailability;
}

- (unint64_t)handoffRebootReconciliationState
{
  return self->_handoffRebootReconciliationState;
}

- (void)setHandoffRebootReconciliationState:(unint64_t)a3
{
  self->_handoffRebootReconciliationState = a3;
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (void)setMessagingService:(id)a3
{
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void)setStarkManager:(id)a3
{
}

- (SMCarPlayAlertManager)carPlayAlertManager
{
  return self->_carPlayAlertManager;
}

- (void)setCarPlayAlertManager:(id)a3
{
}

- (SMAnomalyAlertManager)anomalyAlertManager
{
  return self->_anomalyAlertManager;
}

- (void)setAnomalyAlertManager:(id)a3
{
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (SMSessionManagerStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (BOOL)statusStored
{
  return self->_statusStored;
}

- (void)setStatusStored:(BOOL)a3
{
  self->_statusStored = a3;
}

- (BOOL)statusStoreInProgress
{
  return self->_statusStoreInProgress;
}

- (void)setStatusStoreInProgress:(BOOL)a3
{
  self->_statusStoreInProgress = a3;
}

- (BOOL)statusUpdatePending
{
  return self->_statusUpdatePending;
}

- (void)setStatusUpdatePending:(BOOL)a3
{
  self->_statusUpdatePending = a3;
}

- (TLAlert)cacheReleaseTLAlert
{
  return self->_cacheReleaseTLAlert;
}

- (void)setCacheReleaseTLAlert:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
}

- (unint64_t)wristState
{
  return self->_wristState;
}

- (void)setWristState:(unint64_t)a3
{
  self->_wristState = a3;
}

- (SMAppDeletionManager)appDeletionManager
{
  return self->_appDeletionManager;
}

- (void)setAppDeletionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDeletionManager, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_cacheReleaseTLAlert, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_anomalyAlertManager, 0);
  objc_storeStrong((id *)&self->_carPlayAlertManager, 0);
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_screenLockMonitor, 0);
  objc_storeStrong((id *)&self->_endCarouselSessionXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_endAwarenessBeforeUnlockXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_cacheReleaseXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_magnetBreakTimer, 0);
  objc_storeStrong((id *)&self->_checkInXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsDelegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, 0);
  objc_storeStrong((id *)&self->_handoffRetryTimer, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeSessionDetails, 0);
  objc_storeStrong((id *)&self->_handoffMetrics, 0);
  objc_storeStrong((id *)&self->_localState, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end