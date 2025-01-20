@interface SMDaemonClient
- (BOOL)enabled;
- (BOOL)monitorInitiatorSafetyCache;
- (BOOL)monitorLocalSessionState;
- (BOOL)monitorReceiverSafetyCache;
- (BOOL)monitorReceiverSessionStatus;
- (BOOL)monitorSessionState;
- (BOOL)supported;
- (NSString)description;
- (NSString)executableName;
- (NSString)executablePath;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (RTAuthorizationManager)authorizationManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTEntitlementProvider)entitlementProvider;
- (RTPlatform)platform;
- (SMAppDeletionManager)appDeletionManager;
- (SMDaemonClient)init;
- (SMDaemonClient)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 platform:(id)a7 initiatorService:(id)a8 messagingService:(id)a9 receiverService:(id)a10 sessionStore:(id)a11 suggestionsManager:(id)a12 suggestionsHelper:(id)a13 suggestionsStore:(id)a14 eligibilityChecker:(id)a15 deviceConfigurationChecker:(id)a16 appDeletionManager:(id)a17;
- (SMDeviceConfigurationChecker)deviceConfigurationChecker;
- (SMEligibilityChecker)eligibilityChecker;
- (SMInitiatorService)initiatorService;
- (SMMessagingService)messagingService;
- (SMReceiverService)receiverService;
- (SMSessionStore)sessionStore;
- (SMSuggestionsHelper)suggestionsHelper;
- (SMSuggestionsManager)suggestionsManager;
- (SMSuggestionsStore)suggestionsStore;
- (int)processIdentifier;
- (void)_onLocalSessionStateChanged:(id)a3;
- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)calculateDistanceToDestination:(id)a3 completionHandler:(id)a4;
- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4;
- (void)cancelInitializationWithHandler:(id)a3;
- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)checkConversationEligibility:(id)a3 handler:(id)a4;
- (void)checkEligibilityOfDestination:(id)a3 completionHandler:(id)a4;
- (void)checkHasSimWithHandler:(id)a3;
- (void)checkInitiatorEligibilityWithHandler:(id)a3;
- (void)clearSessionMonitorStatesWithHandler:(id)a3;
- (void)clearSessionsWithHandler:(id)a3;
- (void)clearSuggestionsWithHandler:(id)a3;
- (void)clearTriggerDestinationStatesWithHandler:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)detailsViewOpenedForSessionID:(id)a3;
- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 completionHandler:(id)a5;
- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3;
- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3;
- (void)fetchCurrentSessionStateWithHandler:(id)a3;
- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3;
- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3;
- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3;
- (void)fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3;
- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4;
- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4;
- (void)fetchSOSReceiversWithCompletion:(id)a3;
- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4;
- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3;
- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3;
- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3;
- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4;
- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4;
- (void)iMessageConversationDeletedFor:(id)a3;
- (void)iMessageDeletedFor:(id)a3;
- (void)iMessageGroupDisplayNameChangedFor:(id)a3;
- (void)iMessageGroupMembershipChangedFor:(id)a3;
- (void)iMessageGroupPhotoChangedFor:(id)a3;
- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5;
- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)iMessageScheduledSendTriggeredFor:(id)a3;
- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6;
- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4;
- (void)kickedFromIMessageGroupWith:(id)a3;
- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4;
- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)onAuthorizationNotification:(id)a3;
- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7;
- (void)onLocalSessionStateChanged:(id)a3;
- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5;
- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4;
- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4;
- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6;
- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5;
- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9;
- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4;
- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4;
- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7;
- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4;
- (void)setAppDeletionManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceConfigurationChecker:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEligibilityChecker:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEntitlementProvider:(id)a3;
- (void)setExecutableName:(id)a3;
- (void)setExecutablePath:(id)a3;
- (void)setInitiatorService:(id)a3;
- (void)setMessagingService:(id)a3;
- (void)setMonitorInitiatorSafetyCache:(BOOL)a3;
- (void)setMonitorLocalSessionState:(BOOL)a3;
- (void)setMonitorReceiverSafetyCache:(BOOL)a3;
- (void)setMonitorReceiverSessionStatus:(BOOL)a3;
- (void)setMonitorSessionState:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setQueue:(id)a3;
- (void)setReceiverService:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSuggestionsHelper:(id)a3;
- (void)setSuggestionsManager:(id)a3;
- (void)setSuggestionsStore:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4;
- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4;
- (void)shutdown;
- (void)startMonitoringInitiatorSafetyCacheWithHandler:(id)a3;
- (void)startMonitoringLocalSessionStateWithHandler:(id)a3;
- (void)startMonitoringReceiverSafetyCacheWithHandler:(id)a3;
- (void)startMonitoringReceiverSessionStatusWithHandler:(id)a3;
- (void)startMonitoringSessionStateWithHandler:(id)a3;
- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringInitiatorSafetyCacheWithCompletion:(id)a3;
- (void)stopMonitoringLocalSessionStateWithHandler:(id)a3;
- (void)stopMonitoringReceiverSafetyCacheWithCompletion:(id)a3;
- (void)stopMonitoringReceiverSessionStatusWithCompletion:(id)a3;
- (void)stopMonitoringSessionStateWithHandler:(id)a3;
- (void)storeSessionConfigurations:(id)a3 handler:(id)a4;
- (void)storeSessionManagerStates:(id)a3 handler:(id)a4;
- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4;
- (void)storeSuggestions:(id)a3 handler:(id)a4;
- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4;
- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4;
@end

@implementation SMDaemonClient

- (SMDaemonClient)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager_);
}

- (SMDaemonClient)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 platform:(id)a7 initiatorService:(id)a8 messagingService:(id)a9 receiverService:(id)a10 sessionStore:(id)a11 suggestionsManager:(id)a12 suggestionsHelper:(id)a13 suggestionsStore:(id)a14 eligibilityChecker:(id)a15 deviceConfigurationChecker:(id)a16 appDeletionManager:(id)a17
{
  id v68 = a3;
  id v51 = a4;
  id v22 = a4;
  id v57 = a5;
  id v52 = a6;
  id v67 = a6;
  id v66 = a7;
  id v53 = a8;
  id v65 = a8;
  id v55 = a9;
  id v64 = a10;
  id v63 = a11;
  id v62 = a12;
  id v61 = a13;
  id v60 = a14;
  id v59 = a15;
  id v58 = a16;
  id v23 = a17;
  v56 = v23;
  if (!v68)
  {
    v24 = v22;
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v42 = 0;
    v43 = 0;
    v25 = v57;
    goto LABEL_47;
  }
  v24 = v22;
  if (!v22)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = v57;
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: authorizationManager";
LABEL_45:
    _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_46;
  }
  v25 = v57;
  if (!v57)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_45;
  }
  if (!v67)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_45;
  }
  if (!v66)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: platform";
    goto LABEL_45;
  }
  if (!v65)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: initiatorService";
    goto LABEL_45;
  }
  if (!v64)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: receiverService";
    goto LABEL_45;
  }
  if (!v63)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_45;
  }
  if (!v62)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: suggestionsManager";
    goto LABEL_45;
  }
  if (!v61)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: suggestionsHelper";
    goto LABEL_45;
  }
  if (!v60)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: suggestionsStore";
    goto LABEL_45;
  }
  if (!v59)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: eligibilityChecker";
    goto LABEL_45;
  }
  if (!v58)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v47 = "Invalid parameter not satisfying: deviceConfigurationChecker";
      goto LABEL_45;
    }
LABEL_46:

    v42 = 0;
    v43 = v68;
LABEL_47:
    v41 = self;
    v44 = v55;
    goto LABEL_48;
  }
  if (v23)
  {
    v77.receiver = self;
    v77.super_class = (Class)SMDaemonClient;
    v26 = [(SMDaemonClient *)&v77 init];
    v27 = v26;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_queue, a3);
      objc_storeStrong((id *)&v27->_authorizationManager, v51);
      objc_storeStrong((id *)&v27->_defaultsManager, a5);
      objc_storeStrong((id *)&v27->_distanceCalculator, v52);
      objc_storeStrong((id *)&v27->_platform, a7);
      objc_storeStrong((id *)&v27->_initiatorService, v53);
      [(SMInitiatorService *)v27->_initiatorService addObserverForSessionManager:v27];
      objc_storeStrong((id *)&v27->_sessionStore, a11);
      objc_storeStrong((id *)&v27->_suggestionsManager, a12);
      objc_storeStrong((id *)&v27->_suggestionsHelper, a13);
      objc_storeStrong((id *)&v27->_suggestionsStore, a14);
      uint64_t v28 = +[RTEntitlementProvider safetyMonitorDaemonProtocolEntitlementProvider];
      entitlementProvider = v27->_entitlementProvider;
      v27->_entitlementProvider = (RTEntitlementProvider *)v28;

      objc_storeStrong((id *)&v27->_messagingService, a9);
      objc_storeStrong((id *)&v27->_receiverService, a10);
      [(SMReceiverService *)v27->_receiverService addObserver:v27];
      objc_storeStrong((id *)&v27->_eligibilityChecker, a15);
      objc_storeStrong((id *)&v27->_deviceConfigurationChecker, a16);
      objc_storeStrong((id *)&v27->_appDeletionManager, a17);
      v30 = dispatch_group_create();
      dispatch_group_enter(v30);
      authorizationManager = v27->_authorizationManager;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke;
      v74[3] = &unk_1E6B91350;
      v32 = v27;
      v75 = v32;
      v33 = v30;
      v76 = v33;
      [(RTAuthorizationManager *)authorizationManager fetchRoutineSupportedWithHandler:v74];
      v34 = v27->_authorizationManager;
      v35 = +[RTNotification notificationName];
      [(RTNotifier *)v34 addObserver:v32 selector:sel_onAuthorizationNotification_ name:v35];

      dispatch_group_enter(v33);
      v36 = v27->_authorizationManager;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_3;
      v71[3] = &unk_1E6B91350;
      v37 = v32;
      v72 = v37;
      v73 = v33;
      v38 = v33;
      [(RTAuthorizationManager *)v36 fetchRoutineEnabledWithHandler:v71];
      v39 = [(SMDaemonClient *)v37 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_5;
      block[3] = &unk_1E6B90E70;
      v40 = v37;
      v25 = v57;
      v70 = v40;
      dispatch_group_notify(v38, v39, block);
    }
    v41 = v27;
    v42 = v41;
    v43 = v68;
    v44 = v55;
  }
  else
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = v68;
    v44 = v55;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appDeletionManager", buf, 2u);
    }

    v42 = 0;
    v41 = self;
  }
LABEL_48:

  return v42;
}

void __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke(uint64_t a1, char a2)
{
  v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_2;
  block[3] = &unk_1E6B91328;
  id v6 = *(id *)(a1 + 32);
  char v8 = a2;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSupported:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_3(uint64_t a1, char a2)
{
  v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_4;
  block[3] = &unk_1E6B91328;
  id v6 = *(id *)(a1 + 32);
  char v8 = a2;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __279__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) xpcConnection];
  [v1 resume];
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(SMDaemonClient *)self executablePath];
  v5 = [v3 stringWithFormat:@"%@(%d)", v4, -[SMDaemonClient processIdentifier](self, "processIdentifier")];

  return (NSString *)v5;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  [v10 retainArguments];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__79;
  v29[4] = __Block_byref_object_dispose__79;
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = NSStringFromSelector(a2);
  id v15 = [v11 stringWithFormat:@"%@-%@", v13, v14];
  [v15 UTF8String];
  id v30 = (id)os_transaction_create();

  v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v32 = v21;
    __int16 v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E6B913A0;
  BOOL v28 = a5;
  id v24 = v10;
  v25 = self;
  id v26 = v9;
  v27 = v29;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

void __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) invoke];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      char v8 = [*(id *)(a1 + 40) executableName];
      id v9 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_EVENT, v5, "ClientService", "client %@, request %@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = [*(id *)(a1 + 40) executableName];
      id v18 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v60 = 2112;
      id v61 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);
    }
    v12 = [*(id *)(a1 + 32) target];
    v13 = [*(id *)(*(void *)(a1 + 40) + 88) protocol];
    int v14 = [v12 conformsToProtocol:v13];

    if (v14)
    {
      id v15 = [*(id *)(a1 + 48) exportedInterface];
      v16 = [v15 replyBlockSignatureForSelector:objc_msgSend(*(id *)(a1 + 32), "selector")];
    }
    else
    {
      v16 = 0;
    }
    int v19 = [*(id *)(a1 + 40) supported];
    int v20 = [*(id *)(*(void *)(a1 + 40) + 88) clientConnection:*(void *)(a1 + 48) satisfiesEntitlementRequirementsForInvocation:*(void *)(a1 + 32)];
    if (v16)
    {
      if (v20)
      {
        if (v19)
        {
          if (_os_feature_enabled_impl())
          {
            uint64_t v21 = [*(id *)(a1 + 32) blockArgumentIndex];
            *(void *)buf = 0;
            [*(id *)(a1 + 32) getArgument:buf atIndex:v21];
            id v22 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
            id v23 = (void *)[*(id *)buf copy];
            [v16 UTF8String];
            v49 = v22;
            id v50 = v10;
            id v51 = v23;
            id v24 = v23;
            id v25 = v22;
            id v52 = (id)__NSMakeSpecialForwardingCaptureBlock();
            [*(id *)(a1 + 32) setArgument:&v52 atIndex:v21];
            [*(id *)(a1 + 32) invoke];
            uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
            v27 = *(void **)(v26 + 40);
            *(void *)(v26 + 40) = 0;
          }
          else
          {
            uint64_t v53 = *MEMORY[0x1E4F28568];
            v54 = @"This feature is not enabled.";
            v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            v44 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F99A48] code:1 userInfo:v43];
            [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v44 replyTypes:v16];
            uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
            v46 = *(void **)(v45 + 40);
            *(void *)(v45 + 40) = 0;
          }
        }
        else
        {
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v56 = @"This operation is not supported on this platform.";
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F99A48] code:1 userInfo:v39];
          [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v40 replyTypes:v16];
          uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
          v42 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = 0;
        }
      }
      else
      {
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v30 = NSString;
        v31 = [*(id *)(a1 + 40) executableName];
        id v32 = [v30 stringWithFormat:@"%@ is not entitled for this operation.", v31];
        id v58 = v32;
        __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];

        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = (void *)[v34 initWithDomain:*MEMORY[0x1E4F99A48] code:3 userInfo:v33];
        v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v47 = [*(id *)(a1 + 40) executableName];
          v48 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v47;
          __int16 v60 = 2112;
          id v61 = v48;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "client, %@, is not entitled for invocation, %@.", buf, 0x16u);
        }
        [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v35 replyTypes:v16];
        uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
        v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = 0;
      }
    }
    else
    {
      if ((v20 & v19) == 1) {
        [*(id *)(a1 + 32) invoke];
      }
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }
  }
}

void __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke_34(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:a1[5]];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Sending reply for request \"%@\", latency, %.2f", (uint8_t *)&v8, 0x16u);
  }
  [v3 setTarget:a1[6]];
  [v3 invoke];
}

- (void)onAuthorizationNotification:(id)a3
{
  id v5 = a3;
  id v6 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SMDaemonClient_onAuthorizationNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  __int16 v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__SMDaemonClient_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 enabled];
    id v7 = *(void **)(a1 + 40);
    [v7 setEnabled:v6];
  }
  else
  {
    int v8 = [v5 name];
    id v9 = +[RTNotification notificationName];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = [v11 activeUser];
        v16 = @"NO";
        int v21 = 138412802;
        id v22 = v13;
        __int16 v23 = 2112;
        if (v15) {
          v16 = @"YES";
        }
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = v16;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, client, %@, activeUser, %@", (uint8_t *)&v21, 0x20u);
      }
      if (([v11 activeUser] & 1) == 0)
      {
        v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
          uint64_t v19 = *(void *)(a1 + 40);
          int v21 = 138412546;
          id v22 = v18;
          __int16 v23 = 2112;
          uint64_t v24 = v19;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, invalidating connection to client, %@", (uint8_t *)&v21, 0x16u);
        }
        int v20 = [*(id *)(a1 + 40) xpcConnection];
        [v20 invalidate];
      }
    }
  }
}

- (void)shutdown
{
  int v4 = [(SMDaemonClient *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SMDaemonClient_shutdown__block_invoke;
  v5[3] = &unk_1E6B91248;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __26__SMDaemonClient_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412546;
    int v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v7, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) authorizationManager];
  [v5 removeObserver:*(void *)(a1 + 32)];

  uint64_t v6 = [*(id *)(a1 + 32) initiatorService];
  [v6 removeObserver:*(void *)(a1 + 32)];
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
}

- (void)cancelInitializationWithHandler:(id)a3
{
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    __int16 v9 = NSStringFromSelector(a2);
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,fetching safety cache receivers", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(SMDaemonClient *)self initiatorService];
  [v10 fetchSOSReceiversWithCompletion:v5];
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(a2);
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", (uint8_t *)&v14, 0x20u);
  }
  __int16 v13 = [(SMDaemonClient *)self initiatorService];
  [v13 fetchInitiatorSafetyCacheForSessionID:v7 completion:v8];
}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SMDaemonClient *)self receiverService];
  [v5 fetchAllReceiverSessionStatusWithCompletion:v4];
}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMDaemonClient *)self receiverService];
  [v8 fetchReceiverSessionStatusForSessionID:v7 completion:v6];
}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMDaemonClient *)self receiverService];
  [v8 userRequestedCacheDownloadForSessionID:v7 completion:v6];
}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMDaemonClient *)self receiverService];
  [v8 fetchReceiverSafetyCacheForSessionID:v7 completion:v6];
}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(SMDaemonClient *)self receiverService];
  [v5 detailsViewOpenedForSessionID:v4];
}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v7 UUIDString];
    int v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    __int16 v13 = NSStringFromSelector(a2);
    int v15 = 138412802;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", (uint8_t *)&v15, 0x20u);
  }
  int v14 = [(SMDaemonClient *)self initiatorService];
  [v14 fetchSessionReceiptForSessionID:v7 completion:v8];
}

- (void)startMonitoringInitiatorSafetyCacheWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      int v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,start monitoring initiator safety cache", buf, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorInitiatorSafetyCache:1];
    uint64_t v10 = [(SMDaemonClient *)self initiatorService];
    [v10 addObserver:self];

    (*((void (**)(id, void, void, void, void, void, void))v5 + 2))(v5, 0, 0, 0, 0, 0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke;
    v12[3] = &unk_1E6B976F0;
    v12[4] = self;
    v12[5] = a2;
    [(SMDaemonClient *)self fetchCurrentSessionStateWithHandler:v12];
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 configuration];
  id v5 = [v4 sessionID];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 configuration];
    id v8 = [v7 sessionID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_43;
    v15[3] = &unk_1E6B976C8;
    v15[4] = *(void *)(a1 + 32);
    [v6 fetchInitiatorSafetyCacheForSessionID:v8 completion:v15];
  }
  else
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v13 = [v3 configuration];
      int v14 = [v13 sessionID];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,sessionID unavailable,%@", buf, 0x20u);
    }
  }
}

void __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  id v17 = [v10 xpcConnection];
  __int16 v16 = [v17 remoteObjectProxy];
  [v16 onInitiatorSafetyCacheChangeForSessionID:v15 phoneCache:v14 watchCache:v13 cacheExpiryDate:v12 cacheReleaseDate:v11];
}

- (void)stopMonitoringInitiatorSafetyCacheWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,stop monitoring initiator safety cache", (uint8_t *)&v12, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorInitiatorSafetyCache:0];
    uint64_t v10 = [(SMDaemonClient *)self initiatorService];
    [v10 removeObserver:self];

    v5[2](v5, 0);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)startMonitoringReceiverSessionStatusWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,start monitoring receiver session status", buf, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorReceiverSessionStatus:1];
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__SMDaemonClient_startMonitoringReceiverSessionStatusWithHandler___block_invoke;
    v11[3] = &unk_1E6B92FA8;
    v11[4] = self;
    [(SMDaemonClient *)self fetchAllReceiverSessionStatusWithCompletion:v11];
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __66__SMDaemonClient_startMonitoringReceiverSessionStatusWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        __int16 v9 = [*(id *)(a1 + 32) xpcConnection];
        uint64_t v10 = [v9 remoteObjectProxy];
        id v11 = [v8 sessionID];
        [v10 onReceiverSessionStatusChangeForSessionID:v11 sessionStatus:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)stopMonitoringReceiverSessionStatusWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a3;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      int v11 = 138412546;
      long long v12 = v8;
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,stop monitoring receiver session status", (uint8_t *)&v11, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorReceiverSessionStatus:0];
    v5[2](v5, 0);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)startMonitoringReceiverSafetyCacheWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,start monitoring receiver safety cache", buf, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorReceiverSafetyCache:1];
    (*((void (**)(id, void, void, void, void))v5 + 2))(v5, 0, 0, 0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke;
    v11[3] = &unk_1E6B92FA8;
    v11[4] = self;
    [(SMDaemonClient *)self fetchAllReceiverSessionStatusWithCompletion:v11];
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 32);
        __int16 v9 = [v7 sessionID];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2;
        v11[3] = &unk_1E6B97718;
        v11[4] = *(void *)(a1 + 32);
        void v11[5] = v7;
        [v8 fetchReceiverSafetyCacheForSessionID:v9 completion:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 xpcConnection];
  id v8 = [v10 remoteObjectProxy];
  __int16 v9 = [*(id *)(a1 + 40) sessionID];
  [v8 onReceiverSafetyCacheChangeForSessionID:v9 phoneCache:v7 watchCache:v6];
}

- (void)stopMonitoringReceiverSafetyCacheWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      __int16 v9 = NSStringFromSelector(a2);
      int v11 = 138412546;
      long long v12 = v8;
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,stop monitoring receiver safety cache", (uint8_t *)&v11, 0x16u);
    }
    [(SMDaemonClient *)self setMonitorReceiverSafetyCache:0];
    v5[2](v5, 0);
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    __int16 v18 = [(SMDaemonClient *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__SMDaemonClient_onInitiatorSafetyCacheChangeForSessionID_phoneCache_watchCache_cacheExpiryDate_cacheReleaseDate___block_invoke;
    block[3] = &unk_1E6B91E08;
    void block[4] = self;
    SEL v26 = a2;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    id v24 = v16;
    id v25 = v17;
    dispatch_async(v18, block);
  }
  else
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }
}

void __114__SMDaemonClient_onInitiatorSafetyCacheChangeForSessionID_phoneCache_watchCache_cacheExpiryDate_cacheReleaseDate___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  char v1 = [*(id *)(a1 + 32) monitorInitiatorSafetyCache];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if (v1)
  {
    if (v3)
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 80));
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      uint64_t v53 = v5;
      __int16 v54 = 2112;
      uint64_t v55 = v6;
      __int16 v56 = 2112;
      uint64_t v57 = v7;
      __int16 v58 = 2112;
      uint64_t v59 = v8;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,sending initiator safety cache update to sessionID, %@, phoneCache, %@", buf, 0x2Au);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = [*(id *)(a1 + 48) locationsDuringSession];
    uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = (objc_class *)objc_opt_class();
            id v17 = NSStringFromClass(v16);
            __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 80));
            *(_DWORD *)buf = 138413058;
            uint64_t v53 = v17;
            __int16 v54 = 2112;
            uint64_t v55 = v18;
            __int16 v56 = 2048;
            uint64_t v57 = (void *)(v11 + i);
            __int16 v58 = 2112;
            uint64_t v59 = v14;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, phoneCache location %lu, %@", buf, 0x2Au);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        v11 += i;
      }
      while (v10);
    }

    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      id v22 = NSStringFromSelector(*(SEL *)(a1 + 80));
      id v23 = *(void **)(a1 + 40);
      uint64_t v24 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      uint64_t v53 = v21;
      __int16 v54 = 2112;
      uint64_t v55 = v22;
      __int16 v56 = 2112;
      uint64_t v57 = v23;
      __int16 v58 = 2112;
      uint64_t v59 = v24;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,sending initiator safety cache update to sessionID, %@, watchCache, %@", buf, 0x2Au);
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obja = [*(id *)(a1 + 56) locationsDuringSession];
    uint64_t v25 = [obja countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(obja);
          }
          uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            id v32 = (objc_class *)objc_opt_class();
            __int16 v33 = NSStringFromClass(v32);
            id v34 = NSStringFromSelector(*(SEL *)(a1 + 80));
            *(_DWORD *)buf = 138413058;
            uint64_t v53 = v33;
            __int16 v54 = 2112;
            uint64_t v55 = v34;
            __int16 v56 = 2048;
            uint64_t v57 = (void *)(v27 + j);
            __int16 v58 = 2112;
            uint64_t v59 = v30;
            _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, watchCache location %lu, %@", buf, 0x2Au);
          }
        }
        uint64_t v26 = [obja countByEnumeratingWithState:&v42 objects:v50 count:16];
        v27 += j;
      }
      while (v26);
    }

    uint64_t v2 = [*(id *)(a1 + 32) xpcConnection];
    uint64_t v35 = [v2 remoteObjectProxy];
    [v35 onInitiatorSafetyCacheChangeForSessionID:*(void *)(a1 + 40) phoneCache:*(void *)(a1 + 48) watchCache:*(void *)(a1 + 56) cacheExpiryDate:*(void *)(a1 + 64) cacheReleaseDate:*(void *)(a1 + 72)];
    goto LABEL_27;
  }
  if (v3)
  {
    v36 = (objc_class *)objc_opt_class();
    uint64_t v35 = NSStringFromClass(v36);
    uint64_t v37 = NSStringFromSelector(*(SEL *)(a1 + 80));
    v38 = [*(id *)(a1 + 40) UUIDString];
    *(_DWORD *)buf = 138412802;
    uint64_t v53 = v35;
    __int16 v54 = 2112;
    uint64_t v55 = v37;
    __int16 v56 = 2112;
    uint64_t v57 = v38;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,not monitoring initiator safety cache for sessionID, %@", buf, 0x20u);

LABEL_27:
  }
}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: sessionID";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: sessionStatus";
    goto LABEL_10;
  }
  uint64_t v10 = [(SMDaemonClient *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SMDaemonClient_onReceiverSessionStatusChangeForSessionID_sessionStatus___block_invoke;
  v13[3] = &unk_1E6B917F0;
  v13[4] = self;
  SEL v16 = a2;
  id v14 = v7;
  id v15 = v9;
  dispatch_async(v10, v13);

LABEL_8:
}

void __74__SMDaemonClient_onReceiverSessionStatusChangeForSessionID_sessionStatus___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) monitorReceiverSessionStatus];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v13 = 138413058;
      id v14 = v6;
      __int16 v15 = 2112;
      SEL v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@,%@,sessionID:%@,sending receiver session status update to client,%@", (uint8_t *)&v13, 0x2Au);
    }
    BOOL v3 = [*(id *)(a1 + 32) xpcConnection];
    uint64_t v10 = [v3 remoteObjectProxy];
    [v10 onReceiverSessionStatusChangeForSessionID:*(void *)(a1 + 40) sessionStatus:*(void *)(a1 + 48)];
    goto LABEL_7;
  }
  if (v4)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v11);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v13 = 138412546;
    id v14 = v10;
    __int16 v15 = 2112;
    SEL v16 = v12;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@,%@,not monitoring receiver session status", (uint8_t *)&v13, 0x16u);

LABEL_7:
  }
}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    uint64_t v12 = [(SMDaemonClient *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__SMDaemonClient_onReceiverSafetyCacheChangeForSessionID_phoneCache_watchCache___block_invoke;
    block[3] = &unk_1E6B90F80;
    void block[4] = self;
    SEL v18 = a2;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    dispatch_async(v12, block);
  }
  else
  {
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }
}

void __80__SMDaemonClient_onReceiverSafetyCacheChangeForSessionID_phoneCache_watchCache___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) monitorReceiverSafetyCache];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v14 = 138413314;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@,%@,sessionID:%@,sending receiver safety cache update to client,phoneCache,%@,watchCache,%@", (uint8_t *)&v14, 0x34u);
    }
    BOOL v3 = [*(id *)(a1 + 32) xpcConnection];
    id v11 = [v3 remoteObjectProxy];
    [v11 onReceiverSafetyCacheChangeForSessionID:*(void *)(a1 + 40) phoneCache:*(void *)(a1 + 48) watchCache:*(void *)(a1 + 56)];
    goto LABEL_7;
  }
  if (v4)
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v12);
    int v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v14 = 138412546;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@,%@,not monitoring receiver safety cache", (uint8_t *)&v14, 0x16u);

LABEL_7:
  }
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMDaemonClient_onSessionStateChanged_forActiveDevice___block_invoke;
  block[3] = &unk_1E6B91328;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __56__SMDaemonClient_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStateChanged:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v14 = "-[SMDaemonClient onSessionResumedWithState:forActiveDevice:]";
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, SessionManager resumed to state", buf, 0xCu);
  }

  id v8 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMDaemonClient_onSessionResumedWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E6B91328;
  void block[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__SMDaemonClient_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStateChanged:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SMDaemonClient *)self monitorSessionState])
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      int v13 = self;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "sending session state, %@, to client, %@", (uint8_t *)&v10, 0x16u);
    }

    id v8 = [(SMDaemonClient *)self xpcConnection];
    id v9 = [v8 remoteObjectProxy];
    [v9 onSessionStateChanged:v6 forActiveDevice:v4 withError:0];
  }
}

- (void)onLocalSessionStateChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMDaemonClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SMDaemonClient_onLocalSessionStateChanged___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__SMDaemonClient_onLocalSessionStateChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLocalSessionStateChanged:*(void *)(a1 + 40)];
}

- (void)_onLocalSessionStateChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SMDaemonClient *)self monitorLocalSessionState])
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "sending session state, %@, to client, %@", (uint8_t *)&v8, 0x16u);
    }

    id v6 = [(SMDaemonClient *)self xpcConnection];
    id v7 = [v6 remoteObjectProxy];
    [v7 onLocalSessionStateChanged:v4 withError:0];
  }
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@,%@,message:%@,toConversation:%@", buf, 0x2Au);
  }
  __int16 v16 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMDaemonClient_sendIDSMessage_toConversation_completion___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  SEL v24 = a2;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(v16, block);
}

void __59__SMDaemonClient_sendIDSMessage_toConversation_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 sendIDSMessage:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    int v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);
  }
  uint64_t v13 = [(SMDaemonClient *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SMDaemonClient_sendIDSMessageToMyDevices_completion___block_invoke;
  v16[3] = &unk_1E6B90C40;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  SEL v19 = a2;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v13, v16);
}

void __55__SMDaemonClient_sendIDSMessageToMyDevices_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 sendIDSMessageToMyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);
  }
  uint64_t v13 = [(SMDaemonClient *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__SMDaemonClient_sendIDSMessageToPairedDevice_completion___block_invoke;
  v16[3] = &unk_1E6B90C40;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  SEL v19 = a2;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v13, v16);
}

void __58__SMDaemonClient_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 sendIDSMessageToPairedDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);
  }
  uint64_t v13 = [(SMDaemonClient *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__SMDaemonClient_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
  v16[3] = &unk_1E6B90C40;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  SEL v19 = a2;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v13, v16);
}

void __61__SMDaemonClient_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 sendIDSMessageToMyNearbyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    __int16 v20 = NSStringFromClass(v19);
    id v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v36 = v20;
    __int16 v37 = 2112;
    v38 = v21;
    __int16 v39 = 2112;
    id v40 = v13;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@,%@,message:%@,associatedGUID:%@,toConversation:%@", buf, 0x34u);
  }
  __int16 v22 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SMDaemonClient_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E6B97740;
  void block[4] = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  SEL v34 = a2;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = v13;
  dispatch_async(v22, block);
}

void __89__SMDaemonClient_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 sendMadridMessage:*(void *)(a1 + 40) associatedGUID:*(void *)(a1 + 48) toConversation:*(void *)(a1 + 56) summaryText:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v8);
  }
}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    id v23 = v36 = v19;
    id v24 = NSStringFromSelector(a2);
    [v17 stringFromDate];
    id v25 = v16;
    v27 = id v26 = v15;
    *(_DWORD *)buf = 138413826;
    long long v49 = v23;
    __int16 v50 = 2112;
    id v51 = v24;
    __int16 v52 = 2112;
    id v53 = v38;
    __int16 v54 = 2112;
    id v55 = v26;
    __int16 v56 = 2112;
    id v57 = v25;
    __int16 v58 = 2112;
    uint64_t v59 = v27;
    __int16 v60 = 2112;
    id v61 = v18;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@,%@,message:%@,messageGUID:%@,associatedGUID:%@,sendDate:%@,toConversation:%@", buf, 0x48u);

    id v15 = v26;
    id v16 = v25;

    id v19 = v36;
  }

  uint64_t v28 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__SMDaemonClient_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E6B97768;
  void block[4] = self;
  id v40 = v38;
  id v41 = v15;
  id v42 = v16;
  id v43 = v17;
  id v44 = v18;
  id v45 = v19;
  id v46 = v20;
  SEL v47 = a2;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  id v32 = v17;
  id v33 = v16;
  id v34 = v15;
  id v35 = v38;
  dispatch_async(v28, block);
}

void __128__SMDaemonClient_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 scheduleMadridMessageSendForMessage:*(void *)(a1 + 40) messageGUID:*(void *)(a1 + 48) associatedGUID:*(void *)(a1 + 56) sendDate:*(void *)(a1 + 64) toConversation:*(void *)(a1 + 72) summaryText:*(void *)(a1 + 80) completion:*(void *)(a1 + 88)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v8);
  }
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@,toConversation:%@", buf, 0x2Au);
  }
  id v16 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SMDaemonClient_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  SEL v24 = a2;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(v16, block);
}

void __82__SMDaemonClient_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v12 = [*(id *)(a1 + 32) messagingService];
    [v12 cancelMadridMessageSendForMessageGUID:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F99A48];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"messagingService nil";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    __int16 v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    __int16 v29 = v16;
    __int16 v30 = 2112;
    __int16 v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 1024;
    BOOL v37 = v7;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@,%@,messageURL:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);
  }
  id v18 = [(SMDaemonClient *)self queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__SMDaemonClient_iMessageSendFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_1E6B97790;
  v22[4] = self;
  id v23 = v11;
  BOOL v27 = v7;
  id v24 = v12;
  id v25 = v13;
  SEL v26 = a2;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v18, v22);
}

void __60__SMDaemonClient_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageSendFor:*(void *)(a1 + 40) guid:*(void *)(a1 + 48) successful:*(unsigned __int8 *)(a1 + 72) withError:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    __int16 v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    __int16 v29 = v16;
    __int16 v30 = 2112;
    __int16 v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 1024;
    BOOL v37 = v7;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@,%@,messageURL:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);
  }
  id v18 = [(SMDaemonClient *)self queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__SMDaemonClient_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_1E6B97790;
  v22[4] = self;
  id v23 = v11;
  BOOL v27 = v7;
  id v24 = v12;
  id v25 = v13;
  SEL v26 = a2;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v18, v22);
}

void __78__SMDaemonClient_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageScheduledSendScheduledFor:*(void *)(a1 + 40) guid:*(void *)(a1 + 48) successful:*(unsigned __int8 *)(a1 + 72) withError:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    id v24 = v13;
    __int16 v25 = 2112;
    SEL v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 1024;
    BOOL v30 = v6;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@,success:%d,error:%@", buf, 0x30u);
  }
  id v15 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SMDaemonClient_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
  block[3] = &unk_1E6B90F58;
  void block[4] = self;
  id v19 = v9;
  BOOL v22 = v6;
  id v20 = v10;
  SEL v21 = a2;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v15, block);
}

void __70__SMDaemonClient_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageScheduledSendCancelFor:*(void *)(a1 + 40) successful:*(unsigned __int8 *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMDaemonClient_iMessageScheduledSendTriggeredFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __52__SMDaemonClient_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageScheduledSendTriggeredFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    SEL v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    id v24 = v13;
    __int16 v25 = 2112;
    SEL v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 1024;
    BOOL v32 = v5;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@,%@,messageUrl:%@,handle:%@,fromMe:%d", buf, 0x30u);
  }
  id v15 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMDaemonClient_iMessageReceived_fromHandle_fromMe___block_invoke;
  block[3] = &unk_1E6B90F58;
  void block[4] = self;
  id v19 = v9;
  BOOL v22 = v5;
  id v20 = v10;
  SEL v21 = a2;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v15, block);
}

void __53__SMDaemonClient_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageReceived:*(void *)(a1 + 40) fromHandle:*(void *)(a1 + 48) fromMe:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      BOOL v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageDeletedFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,messageUrls:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SMDaemonClient_iMessageDeletedFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __37__SMDaemonClient_iMessageDeletedFor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) messagingService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) messagingService];
    [v7 iMessageDeletedFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageConversationDeletedFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,receiverHandles:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMDaemonClient_iMessageConversationDeletedFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __49__SMDaemonClient_iMessageConversationDeletedFor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) messagingService];
  if (v2
    && (BOOL v3 = (void *)v2,
        [*(id *)(a1 + 32) messagingService],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    id v10 = [*(id *)(a1 + 32) messagingService];
    [v10 iMessageConversationDeletedFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      SEL v14 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);
  }
  id v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMDaemonClient_iMessageGroupMembershipChangedFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __52__SMDaemonClient_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) initiatorService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) initiatorService];
    [v7 iMessageGroupMembershipChangedFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMDaemonClient_iMessageGroupDisplayNameChangedFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __53__SMDaemonClient_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) initiatorService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) initiatorService];
    [v7 iMessageGroupDisplayNameChangedFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);
    }
  }
}

- (void)iMessageGroupPhotoChangedFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SMDaemonClient_iMessageGroupPhotoChangedFor___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __47__SMDaemonClient_iMessageGroupPhotoChangedFor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) initiatorService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) initiatorService];
    [v7 iMessageGroupPhotoChangedFor:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);
    }
  }
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);
  }
  __int16 v10 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SMDaemonClient_kickedFromIMessageGroupWith___block_invoke;
  block[3] = &unk_1E6B91220;
  void block[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v11 = v5;
  dispatch_async(v10, block);
}

void __46__SMDaemonClient_kickedFromIMessageGroupWith___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) initiatorService];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) initiatorService];
    [v7 kickedFromIMessageGroupWith:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);
    }
  }
}

- (void)startMonitoringSessionStateWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    [(SMDaemonClient *)self setMonitorSessionState:1];
    [(SMDaemonClient *)self fetchCurrentSessionStateWithHandler:v4];
  }
  else
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)stopMonitoringSessionStateWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    [(SMDaemonClient *)self setMonitorSessionState:0];
    v4[2](v4, 0);
  }
  else
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [(SMDaemonClient *)self initiatorService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke;
    v8[3] = &unk_1E6B977E0;
    v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 fetchCurrentSessionStateWithHandler:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke_2;
  block[3] = &unk_1E6B977B8;
  void block[4] = *(void *)(a1 + 32);
  id v15 = v7;
  char v18 = a3;
  id v16 = v8;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v17 = v13;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);
}

uint64_t __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v4 = (void *)v3;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 72)) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    uint64_t v8 = *(void *)(a1 + 48);
    int v10 = 138413314;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    long long v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, client, %@, state, %@, canDeviceModifyState, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)startMonitoringLocalSessionStateWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring local session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    [(SMDaemonClient *)self setMonitorLocalSessionState:1];
    [(SMDaemonClient *)self fetchCurrentLocalSessionStateWithHandler:v4];
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)stopMonitoringLocalSessionStateWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring local session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    [(SMDaemonClient *)self setMonitorLocalSessionState:0];
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [(SMDaemonClient *)self initiatorService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v8[3] = &unk_1E6B97808;
    v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 fetchCurrentLocalSessionStateWithHandler:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, client, %@, state, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
}

- (void)clearSuggestionsWithHandler:(id)a3
{
}

- (void)storeSuggestions:(id)a3 handler:(id)a4
{
}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
{
}

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
{
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
{
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
{
}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
}

- (void)clearSessionsWithHandler:(id)a3
{
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
{
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
{
}

- (void)checkInitiatorEligibilityWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMDaemonClient *)self queue];
  uint64_t v6 = [(SMDaemonClient *)self authorizationManager];
  int v7 = [(SMDaemonClient *)self messagingService];
  int v8 = [v7 effectivePairedDevice];
  id v9 = [(SMDaemonClient *)self defaultsManager];
  __int16 v10 = [(SMDaemonClient *)self platform];
  uint64_t v11 = [(SMDaemonClient *)self appDeletionManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke;
  v14[3] = &unk_1E6B91A90;
  id v15 = v4;
  SEL v16 = a2;
  v14[4] = self;
  id v12 = v4;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:v5 authorizationManager:v6 effectivePairedDevice:v8 isHandoff:0 defaultsManager:v9 platform:v10 appDeletionManager:v11 handler:v14];
}

void __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke_2;
  block[3] = &unk_1E6B925A0;
  uint64_t v13 = a2;
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v4 = initiatorEligiblityStatusToString();
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, eligibilityStatus, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[SMDaemonClient checkConversationEligibility:handler:]";
    __int16 v19 = 1024;
    int v20 = 1382;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[SMDaemonClient checkConversationEligibility:handler:]";
      __int16 v19 = 1024;
      int v20 = 1383;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  eligibilityChecker = self->_eligibilityChecker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke;
  v14[3] = &unk_1E6B91A90;
  id v15 = v9;
  SEL v16 = a2;
  v14[4] = self;
  id v13 = v9;
  [(SMEligibilityChecker *)eligibilityChecker checkConversationEligibility:v7 handler:v14];
}

void __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke_2;
  block[3] = &unk_1E6B925A0;
  uint64_t v13 = a2;
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v4 = [MEMORY[0x1E4F99860] convertEligibilityTypeToString:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, receiver eligibility, %@, fetchError %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkHasSimWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SMDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SMDaemonClient_checkHasSimWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __41__SMDaemonClient_checkHasSimWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  BOOL v3 = +[SMInitiatorEligibility checkHasSimWithQueue:v2];

  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = (void *)v5;
    id v7 = @"no";
    if (v3) {
      id v7 = @"yes";
    }
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, has sime, %@", (uint8_t *)&v9, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[SMDaemonClient fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1416;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  deviceConfigurationChecker = self->_deviceConfigurationChecker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v9[3] = &unk_1E6B91A90;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v8 = v5;
  [(SMDeviceConfigurationChecker *)deviceConfigurationChecker fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v9];
}

void __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
  block[3] = &unk_1E6B925A0;
  uint64_t v13 = a2;
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v4 = [MEMORY[0x1E4F99850] convertLowPowerModeWarningStateToString:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, device configuration low power mode state, %@, fetchError %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkEligibilityOfDestination:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[SMDaemonClient checkEligibilityOfDestination:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 1436;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", (uint8_t *)&v15, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      uint64_t v16 = "-[SMDaemonClient checkEligibilityOfDestination:completionHandler:]";
      __int16 v17 = 1024;
      int v18 = 1437;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
LABEL_10:
  __int16 v11 = [(SMDaemonClient *)self initiatorService];
  uint64_t v12 = [v11 locationManager];
  uint64_t v13 = [(SMDaemonClient *)self distanceCalculator];
  __int16 v14 = [(SMDaemonClient *)self queue];
  +[SMTriggerDestination checkEligibilityOfDestination:v6 locationManager:v12 distanceCalculator:v13 queue:v14 completionHandler:v8];
}

- (void)calculateDistanceToDestination:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[SMDaemonClient calculateDistanceToDestination:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 1450;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", (uint8_t *)&v15, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      uint64_t v16 = "-[SMDaemonClient calculateDistanceToDestination:completionHandler:]";
      __int16 v17 = 1024;
      int v18 = 1451;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
LABEL_10:
  __int16 v11 = [(SMDaemonClient *)self initiatorService];
  uint64_t v12 = [v11 locationManager];
  uint64_t v13 = [(SMDaemonClient *)self distanceCalculator];
  __int16 v14 = [(SMDaemonClient *)self queue];
  +[SMTriggerDestination calculateDistanceToDestination:v6 locationManager:v12 distanceCalculator:v13 queue:v14 handler:v8];
}

- (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
      __int16 v20 = 1024;
      int v21 = 1465;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
    }

    if (a4)
    {
LABEL_3:
      if (v9) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 1466;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: transportType (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_11:
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
      __int16 v20 = 1024;
      int v21 = 1467;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  uint64_t v13 = [(SMDaemonClient *)self initiatorService];
  __int16 v14 = [v13 locationManager];
  int v15 = [(SMDaemonClient *)self defaultsManager];
  uint64_t v16 = [(SMDaemonClient *)self distanceCalculator];
  __int16 v17 = [(SMDaemonClient *)self queue];
  +[SMTriggerDestination estimateEtaToDestination:v8 transportType:a4 locationManager:v14 defaultsManager:v15 distanceCalculator:v16 queue:v17 handler:v9];
}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
}

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
}

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
}

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
}

- (void)fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4
{
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setExecutablePath:(id)a3
{
}

- (NSString)executableName
{
  return self->_executableName;
}

- (void)setExecutableName:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
}

- (SMInitiatorService)initiatorService
{
  return self->_initiatorService;
}

- (void)setInitiatorService:(id)a3
{
}

- (BOOL)monitorInitiatorSafetyCache
{
  return self->_monitorInitiatorSafetyCache;
}

- (void)setMonitorInitiatorSafetyCache:(BOOL)a3
{
  self->_monitorInitiatorSafetyCache = a3;
}

- (BOOL)monitorReceiverSessionStatus
{
  return self->_monitorReceiverSessionStatus;
}

- (void)setMonitorReceiverSessionStatus:(BOOL)a3
{
  self->_monitorReceiverSessionStatus = a3;
}

- (BOOL)monitorReceiverSafetyCache
{
  return self->_monitorReceiverSafetyCache;
}

- (void)setMonitorReceiverSafetyCache:(BOOL)a3
{
  self->_monitorReceiverSafetyCache = a3;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (BOOL)monitorSessionState
{
  return self->_monitorSessionState;
}

- (void)setMonitorSessionState:(BOOL)a3
{
  self->_monitorSessionState = a3;
}

- (BOOL)monitorLocalSessionState
{
  return self->_monitorLocalSessionState;
}

- (void)setMonitorLocalSessionState:(BOOL)a3
{
  self->_monitorLocalSessionState = a3;
}

- (SMSuggestionsManager)suggestionsManager
{
  return self->_suggestionsManager;
}

- (void)setSuggestionsManager:(id)a3
{
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (void)setSuggestionsHelper:(id)a3
{
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (void)setSuggestionsStore:(id)a3
{
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (void)setMessagingService:(id)a3
{
}

- (SMReceiverService)receiverService
{
  return self->_receiverService;
}

- (void)setReceiverService:(id)a3
{
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
}

- (SMDeviceConfigurationChecker)deviceConfigurationChecker
{
  return self->_deviceConfigurationChecker;
}

- (void)setDeviceConfigurationChecker:(id)a3
{
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
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_receiverService, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_suggestionsManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_initiatorService, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end