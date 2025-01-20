@interface SMSafetyMonitorManager
+ (id)defaultManager;
- (BOOL)shouldDropMessage:(id)a3 from:(id)a4 fromMe:(BOOL)a5;
- (NSString)restorationIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (SMHeartbeatTimer)heartbeatTimer;
- (SMSafetyMonitorManager)init;
- (SMSafetyMonitorManager)initWithRestorationIdentifier:(id)a3;
- (double)requestTimeFromTimed;
- (id)_getConnection;
- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5;
- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4;
- (id)createSMProxyErrorWithSelector:(SEL)a3 error:(id)a4;
- (id)initiatorSafetyCacheHandler;
- (id)localSessionStateHandler;
- (id)receiverSafetyCacheHandler;
- (id)receiverSessionStatusHandler;
- (id)sessionStateHandler;
- (int64_t)prepareUserInfoForNotificationContent:(id)a3 initiatorHandle:(id)a4 messageUrl:(id)a5;
- (void)_createConnection;
- (void)_setUpMonitoring;
- (void)_startHeartbeatForSessionID:(id)a3;
- (void)_stopHeartbeat;
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
- (void)createConnection;
- (void)dealloc;
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
- (void)handleDaemonStart;
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
- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6;
- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7;
- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4;
- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5;
- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5;
- (void)processStateForHeartbeat:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5;
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
- (void)setHeartbeatTimer:(id)a3;
- (void)setInitiatorSafetyCacheHandler:(id)a3;
- (void)setLocalSessionStateHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceiverSafetyCacheHandler:(id)a3;
- (void)setReceiverSessionStatusHandler:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setSessionStateHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4;
- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4;
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
- (void)submitInitializationAnalyticsEventWithError:(id)a3 conversation:(id)a4 duration:(double)a5;
- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4;
@end

@implementation SMSafetyMonitorManager

+ (id)defaultManager
{
  if (qword_26B349998 != -1) {
    dispatch_once(&qword_26B349998, &__block_literal_global_3);
  }
  v2 = (void *)_MergedGlobals_14;
  return v2;
}

uint64_t __40__SMSafetyMonitorManager_defaultManager__block_invoke()
{
  _MergedGlobals_14 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SMSafetyMonitorManager)initWithRestorationIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SMSafetyMonitorManager;
  v5 = [(SMSafetyMonitorManager *)&v27 init];
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      v6 = [MEMORY[0x263F08B88] callStackSymbols];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
            v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = v11;
              _os_log_debug_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v8);
      }
    }
    v13 = v5;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (const char *)[(SMSafetyMonitorManager *)v13 UTF8String];
    }
    else
    {
      id v16 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v13];
      v15 = (const char *)[v16 UTF8String];
    }
    dispatch_queue_t v17 = dispatch_queue_create(v15, v14);

    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [v4 copy];
    restorationIdentifier = v13->_restorationIdentifier;
    v13->_restorationIdentifier = (NSString *)v19;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)onDaemonStartNotification, @"com.apple.routined.safetyMonitor", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(SMSafetyMonitorManager *)v13 createConnection];
  }

  return v5;
}

- (SMSafetyMonitorManager)init
{
  return [(SMSafetyMonitorManager *)self initWithRestorationIdentifier:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [(SMSafetyMonitorManager *)self xpcConnection];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)SMSafetyMonitorManager;
  [(SMSafetyMonitorManager *)&v5 dealloc];
}

- (void)_createConnection
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  v3 = [(SMSafetyMonitorManager *)self xpcConnection];
  [v3 invalidate];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.routined.safetyMonitor" options:4096];
  [(SMSafetyMonitorManager *)self setXpcConnection:v4];

  objc_super v5 = [(SMSafetyMonitorManager *)self xpcConnection];

  if (v5)
  {
    v6 = [(SMSafetyMonitorManager *)self xpcConnection];
    uint64_t v7 = [(SMSafetyMonitorManager *)self queue];
    [v6 _setQueue:v7];

    uint64_t v8 = [(SMSafetyMonitorManager *)self xpcConnection];
    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2709230A0];
    [v8 setExportedInterface:v9];

    uint64_t v10 = [(SMSafetyMonitorManager *)self xpcConnection];
    uint64_t v11 = [[SMSafetyMonitorManagerExportedObject alloc] initWithSafetyMonitorManager:self];
    [v10 setExportedObject:v11];

    v12 = [(SMSafetyMonitorManager *)self xpcConnection];
    v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2709283D8];
    [v12 setRemoteObjectInterface:v13];

    v14 = [(SMSafetyMonitorManager *)self xpcConnection];
    v15 = [v14 remoteObjectInterface];
    id v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    [v15 setClasses:v22 forSelector:sel_startSessionWithConfiguration_handler_ argumentIndex:0 ofReply:0];

    long long v23 = [(SMSafetyMonitorManager *)self xpcConnection];
    long long v24 = [v23 remoteObjectInterface];
    long long v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, objc_opt_class(), 0);
    [v24 setClasses:v31 forSelector:sel_modifySessionWithConfiguration_handler_ argumentIndex:0 ofReply:0];

    v32 = [(SMSafetyMonitorManager *)self xpcConnection];
    v33 = [v32 remoteObjectInterface];
    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
    [v33 setClasses:v40 forSelector:sel_checkInitiatorEligibilityWithHandler_ argumentIndex:0 ofReply:0];

    v41 = [(SMSafetyMonitorManager *)self xpcConnection];
    v42 = [v41 remoteObjectInterface];
    v43 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v42 setClasses:v43 forSelector:sel_checkHasSimWithHandler_ argumentIndex:0 ofReply:0];

    v44 = [(SMSafetyMonitorManager *)self xpcConnection];
    v45 = [v44 remoteObjectInterface];
    v46 = (void *)MEMORY[0x263EFFA08];
    uint64_t v47 = objc_opt_class();
    v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    [v45 setClasses:v48 forSelector:sel_checkConversationEligibility_handler_ argumentIndex:0 ofReply:0];

    v49 = [(SMSafetyMonitorManager *)self xpcConnection];
    v50 = [v49 remoteObjectInterface];
    v51 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v50 setClasses:v51 forSelector:sel_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler_ argumentIndex:0 ofReply:0];

    v52 = [(SMSafetyMonitorManager *)self xpcConnection];
    v53 = [v52 remoteObjectInterface];
    v54 = (void *)MEMORY[0x263EFFA08];
    uint64_t v55 = objc_opt_class();
    v56 = objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    [v53 setClasses:v56 forSelector:sel_fetchSuggestionsWithOptions_handler_ argumentIndex:0 ofReply:1];

    v57 = [(SMSafetyMonitorManager *)self xpcConnection];
    v58 = [v57 remoteObjectInterface];
    v59 = (void *)MEMORY[0x263EFFA08];
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(v59, "setWithObjects:", v60, v61, v62, objc_opt_class(), 0);
    [v58 setClasses:v63 forSelector:sel_fetchSessionManagerStatesWithOptions_handler_ argumentIndex:0 ofReply:1];

    v64 = [(SMSafetyMonitorManager *)self xpcConnection];
    v65 = [v64 remoteObjectInterface];
    v66 = (void *)MEMORY[0x263EFFA08];
    uint64_t v67 = objc_opt_class();
    uint64_t v68 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    v72 = objc_msgSend(v66, "setWithObjects:", v67, v68, v69, v70, v71, objc_opt_class(), 0);
    [v65 setClasses:v72 forSelector:sel_fetchSessionConfigurationsWithOptions_handler_ argumentIndex:0 ofReply:1];

    v73 = [(SMSafetyMonitorManager *)self xpcConnection];
    v74 = [v73 remoteObjectInterface];
    v75 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v74 setClasses:v75 forSelector:sel_fetchSuggestedSessionConfigurationWithHandler_ argumentIndex:0 ofReply:1];

    v76 = [(SMSafetyMonitorManager *)self xpcConnection];
    v77 = [v76 remoteObjectInterface];
    v78 = (void *)MEMORY[0x263EFFA08];
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = objc_opt_class();
    uint64_t v81 = objc_opt_class();
    uint64_t v82 = objc_opt_class();
    uint64_t v83 = objc_opt_class();
    uint64_t v84 = objc_opt_class();
    v85 = objc_msgSend(v78, "setWithObjects:", v79, v80, v81, v82, v83, v84, objc_opt_class(), 0);
    [v77 setClasses:v85 forSelector:sel_launchSessionInitiationUIWithConfiguration_handler_ argumentIndex:0 ofReply:0];

    v86 = [(SMSafetyMonitorManager *)self xpcConnection];
    v87 = [v86 remoteObjectInterface];
    v88 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v87 setClasses:v88 forSelector:sel_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler_ argumentIndex:0 ofReply:1];

    v89 = [(SMSafetyMonitorManager *)self xpcConnection];
    v90 = [v89 remoteObjectInterface];
    v91 = (void *)MEMORY[0x263EFFA08];
    uint64_t v92 = objc_opt_class();
    v93 = objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
    [v90 setClasses:v93 forSelector:sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_ argumentIndex:0 ofReply:1];

    v94 = [(SMSafetyMonitorManager *)self xpcConnection];
    v95 = [v94 remoteObjectInterface];
    v96 = (void *)MEMORY[0x263EFFA08];
    uint64_t v97 = objc_opt_class();
    v98 = objc_msgSend(v96, "setWithObjects:", v97, objc_opt_class(), 0);
    [v95 setClasses:v98 forSelector:sel_fetchMostLikelyReceiverHandlesWithHandler_ argumentIndex:0 ofReply:1];

    v99 = [(SMSafetyMonitorManager *)self xpcConnection];
    v100 = [v99 remoteObjectInterface];
    v101 = (void *)MEMORY[0x263EFFA08];
    uint64_t v102 = objc_opt_class();
    uint64_t v103 = objc_opt_class();
    v104 = objc_msgSend(v101, "setWithObjects:", v102, v103, objc_opt_class(), 0);
    [v100 setClasses:v104 forSelector:sel_fetchMostLikelyReceiverHandlesWithOptions_handler_ argumentIndex:0 ofReply:1];

    v105 = [(SMSafetyMonitorManager *)self xpcConnection];
    v106 = [v105 remoteObjectInterface];
    v107 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v106 setClasses:v107 forSelector:sel_fetchMostLikelySessionDestinationsWithHandler_ argumentIndex:0 ofReply:1];

    v108 = [(SMSafetyMonitorManager *)self xpcConnection];
    v109 = [v108 remoteObjectInterface];
    v110 = (void *)MEMORY[0x263EFFA08];
    uint64_t v111 = objc_opt_class();
    v112 = objc_msgSend(v110, "setWithObjects:", v111, objc_opt_class(), 0);
    [v109 setClasses:v112 forSelector:sel_fetchMostLikelySessionDestinationsWithHandler_ argumentIndex:1 ofReply:1];

    v113 = [(SMSafetyMonitorManager *)self xpcConnection];
    v114 = [v113 remoteObjectInterface];
    v115 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v114 setClasses:v115 forSelector:sel_shouldShowKeyboardSuggestionsForInitiator_receiver_handler_ argumentIndex:0 ofReply:0];

    v116 = [(SMSafetyMonitorManager *)self xpcConnection];
    v117 = [v116 remoteObjectInterface];
    v118 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v117 setClasses:v118 forSelector:sel_shouldShowTipKitSuggestionsForInitiator_receiver_handler_ argumentIndex:0 ofReply:0];

    v119 = [(SMSafetyMonitorManager *)self xpcConnection];
    v120 = [v119 remoteObjectInterface];
    v121 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v120 setClasses:v121 forSelector:sel_shouldShowTipKitSuggestionsForInitiator_receiver_handler_ argumentIndex:0 ofReply:0];

    v122 = [(SMSafetyMonitorManager *)self xpcConnection];
    v123 = [v122 remoteObjectInterface];
    v124 = (void *)MEMORY[0x263EFFA08];
    uint64_t v125 = objc_opt_class();
    v126 = objc_msgSend(v124, "setWithObjects:", v125, objc_opt_class(), 0);
    [v123 setClasses:v126 forSelector:sel_initializeSessionWithConversation_handler_ argumentIndex:0 ofReply:0];

    v127 = [(SMSafetyMonitorManager *)self xpcConnection];
    v128 = [v127 remoteObjectInterface];
    v129 = (void *)MEMORY[0x263EFFA08];
    uint64_t v130 = objc_opt_class();
    uint64_t v131 = objc_opt_class();
    v132 = objc_msgSend(v129, "setWithObjects:", v130, v131, objc_opt_class(), 0);
    [v128 setClasses:v132 forSelector:sel_initializeSessionWithConversation_handler_ argumentIndex:0 ofReply:1];

    v133 = [(SMSafetyMonitorManager *)self xpcConnection];
    v134 = [v133 remoteObjectInterface];
    v135 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v134 setClasses:v135 forSelector:sel_showSuggestionsDetectionUIWithSuggestion_handler_ argumentIndex:0 ofReply:0];

    v136 = [(SMSafetyMonitorManager *)self xpcConnection];
    v137 = [v136 remoteObjectInterface];
    v138 = (void *)MEMORY[0x263EFFA08];
    uint64_t v139 = objc_opt_class();
    uint64_t v140 = objc_opt_class();
    uint64_t v141 = objc_opt_class();
    uint64_t v142 = objc_opt_class();
    uint64_t v143 = objc_opt_class();
    v144 = objc_msgSend(v138, "setWithObjects:", v139, v140, v141, v142, v143, objc_opt_class(), 0);
    [v137 setClasses:v144 forSelector:sel_fetchAllReceiverSessionStatusWithCompletion_ argumentIndex:0 ofReply:1];

    v145 = [(SMSafetyMonitorManager *)self xpcConnection];
    v146 = [v145 remoteObjectInterface];
    v147 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v146 setClasses:v147 forSelector:sel_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler_ argumentIndex:0 ofReply:0];

    v148 = [(SMSafetyMonitorManager *)self xpcConnection];
    v149 = [v148 remoteObjectInterface];
    v150 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v149 setClasses:v150 forSelector:sel_sendHeartbeatForSessionID_handler_ argumentIndex:0 ofReply:0];

    v151 = [(SMSafetyMonitorManager *)self xpcConnection];
    v152 = [v151 remoteObjectInterface];
    v153 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v152 setClasses:v153 forSelector:sel_fetchCurrentLocalSessionStateWithHandler_ argumentIndex:0 ofReply:1];

    v154 = [(SMSafetyMonitorManager *)self xpcConnection];
    v155 = [v154 remoteObjectInterface];
    v156 = (void *)MEMORY[0x263EFFA08];
    uint64_t v157 = objc_opt_class();
    uint64_t v158 = objc_opt_class();
    v159 = objc_msgSend(v156, "setWithObjects:", v157, v158, objc_opt_class(), 0);
    [v155 setClasses:v159 forSelector:sel_fetchSOSReceiversWithCompletion_ argumentIndex:0 ofReply:1];

    objc_initWeak((id *)location, self);
    v160 = [(SMSafetyMonitorManager *)self xpcConnection];
    v175[0] = MEMORY[0x263EF8330];
    v175[1] = 3221225472;
    v175[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke;
    v175[3] = &unk_265499C20;
    objc_copyWeak(&v176, (id *)location);
    [v160 setInvalidationHandler:v175];

    v161 = [(SMSafetyMonitorManager *)self xpcConnection];
    v173[0] = MEMORY[0x263EF8330];
    v173[1] = 3221225472;
    v173[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_325;
    v173[3] = &unk_265499C20;
    objc_copyWeak(&v174, (id *)location);
    [v161 setInterruptionHandler:v173];

    v162 = [(SMSafetyMonitorManager *)self xpcConnection];
    [v162 resume];

    v163 = [(SMSafetyMonitorManager *)self restorationIdentifier];

    if (v163)
    {
      v164 = [(SMSafetyMonitorManager *)self xpcConnection];
      v172[0] = MEMORY[0x263EF8330];
      v172[1] = 3221225472;
      v172[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_327;
      v172[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v172[4] = a2;
      v165 = [v164 remoteObjectProxyWithErrorHandler:v172];
      v166 = [(SMSafetyMonitorManager *)self restorationIdentifier];
      [v165 setRestorationIdentifier:v166];
    }
    objc_destroyWeak(&v174);
    objc_destroyWeak(&v176);
    objc_destroyWeak((id *)location);
  }
  v167 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG))
  {
    v168 = (objc_class *)objc_opt_class();
    v169 = NSStringFromClass(v168);
    v170 = [(SMSafetyMonitorManager *)self xpcConnection];
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v169;
    __int16 v178 = 2112;
    v179 = v170;
    _os_log_debug_impl(&dword_25B6E0000, v167, OS_LOG_TYPE_DEBUG, "%@, XPC Connection Created, %@", location, 0x16u);
  }
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_2;
  block[3] = &unk_265499BD0;
  block[4] = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __43__SMSafetyMonitorManager__createConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_25B6E0000, v2, OS_LOG_TYPE_INFO, "%@, xpc connection invalidated", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_325(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_2_326;
  block[3] = &unk_265499BD0;
  block[4] = WeakRetained;
  dispatch_async(v2, block);
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_2_326()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_25B6E0000, v0, OS_LOG_TYPE_INFO, "%@, xpc connection interrupted", (uint8_t *)&v3, 0xCu);
  }
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_327(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v8 = SMErrorConnectionCreate(*(const char **)(a1 + 32), @"%@", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v8;
    _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }
}

- (void)_setUpMonitoring
{
  int v3 = [(SMSafetyMonitorManager *)self sessionStateHandler];

  if (v3)
  {
    id v4 = [(SMSafetyMonitorManager *)self sessionStateHandler];
    [(SMSafetyMonitorManager *)self startMonitoringSessionStateWithHandler:v4];
  }
  uint64_t v5 = [(SMSafetyMonitorManager *)self initiatorSafetyCacheHandler];

  if (v5)
  {
    int v6 = [(SMSafetyMonitorManager *)self initiatorSafetyCacheHandler];
    [(SMSafetyMonitorManager *)self startMonitoringInitiatorSafetyCacheWithHandler:v6];
  }
  uint64_t v7 = [(SMSafetyMonitorManager *)self receiverSessionStatusHandler];

  if (v7)
  {
    uint64_t v8 = [(SMSafetyMonitorManager *)self receiverSessionStatusHandler];
    [(SMSafetyMonitorManager *)self startMonitoringReceiverSessionStatusWithHandler:v8];
  }
  uint64_t v9 = [(SMSafetyMonitorManager *)self receiverSafetyCacheHandler];

  if (v9)
  {
    id v10 = [(SMSafetyMonitorManager *)self receiverSafetyCacheHandler];
    [(SMSafetyMonitorManager *)self startMonitoringReceiverSafetyCacheWithHandler:v10];
  }
}

- (void)createConnection
{
  int v3 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SMSafetyMonitorManager_createConnection__block_invoke;
  block[3] = &unk_265499BD0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__SMSafetyMonitorManager_createConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createConnection];
}

- (id)_getConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = [(SMSafetyMonitorManager *)self xpcConnection];

  if (!v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_fault_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_FAULT, "%@, xpcConnection is nil, create new connection", (uint8_t *)&v9, 0xCu);
    }
    [(SMSafetyMonitorManager *)self _createConnection];
  }
  uint64_t v5 = [(SMSafetyMonitorManager *)self xpcConnection];
  return v5;
}

- (void)handleDaemonStart
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[SMSafetyMonitorManager handleDaemonStart]";
    _os_log_impl(&dword_25B6E0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v4 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager_handleDaemonStart__block_invoke;
  block[3] = &unk_265499BD0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __43__SMSafetyMonitorManager_handleDaemonStart__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) xpcConnection];

  if (v2)
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [*(id *)(a1 + 32) xpcConnection];
      uint64_t v5 = @"YES";
      if (!v4) {
        uint64_t v5 = @"NO";
      }
      int v7 = 136315394;
      uint64_t v8 = "-[SMSafetyMonitorManager handleDaemonStart]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_25B6E0000, v3, OS_LOG_TYPE_INFO, "%s, xpc connection, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _createConnection];
  }
  return [*(id *)(a1 + 32) _setUpMonitoring];
}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  return [(SMSafetyMonitorManager *)self _proxyForServicingSelector:a3 asynchronous:1 withErrorHandler:a4];
}

- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__SMSafetyMonitorManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke;
  aBlock[3] = &unk_26549A098;
  id v27 = v8;
  SEL v28 = a3;
  aBlock[4] = self;
  id v9 = v8;
  id v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v11 = [(SMSafetyMonitorManager *)self _getConnection];
  uint64_t v18 = v11;
  if (!v11)
  {
    uint64_t v20 = @"no xpc connection";
LABEL_10:
    long long v23 = SMErrorConnectionCreate(a3, v20, v12, v13, v14, v15, v16, v17, v25);
    v10[2](v10, v23);

    v22 = 0;
    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v19 = [v11 remoteObjectProxyWithErrorHandler:v10];
  }
  else
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_INFO, "vending synchronous remote object proxy.", (uint8_t *)&v25, 2u);
    }

    uint64_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v10];
  }
  v22 = (void *)v19;
  if (!v19)
  {
    uint64_t v20 = @"no remote object proxy";
    goto LABEL_10;
  }
LABEL_11:

  return v22;
}

void __83__SMSafetyMonitorManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = [*(id *)(a1 + 32) createSMProxyErrorWithSelector:*(void *)(a1 + 48) error:a2];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@, %@, Wrapped Proxy Error, %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
  }
}

- (id)createSMProxyErrorWithSelector:(SEL)a3 error:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [v5 domain];
  int v7 = (void *)*MEMORY[0x263F07F70];

  if (v6 == v7)
  {
    if ([v5 code] == 4097)
    {
      uint64_t v8 = 20;
    }
    else if ([v5 code] == 4099)
    {
      uint64_t v8 = 21;
    }
    else
    {
      uint64_t v8 = 8;
    }
  }
  else
  {
    uint64_t v8 = 8;
  }
  int v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F08320];
  id v10 = NSString;
  __int16 v11 = NSStringFromSelector(a3);
  uint64_t v12 = [v10 stringWithFormat:@"connection failure while servicing %@, %@", v11, v5];
  v17[0] = v12;
  __int16 v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = [v9 errorWithDomain:@"SMErrorDomain" code:v8 userInfo:v13];

  return v14;
}

- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  block[3] = &unk_265499C68;
  SEL v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_2;
  v7[3] = &unk_265499C90;
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = v3;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v7];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_INFO, "SMSafetyMonitorManager, %@, running task block", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 domain];
  id v5 = v4;
  if (v4 == @"SMErrorDomain")
  {
    if ([v3 code] == 20)
    {
    }
    else
    {
      uint64_t v7 = [v3 code];

      if (v7 != 21) {
        goto LABEL_3;
      }
    }
    if (*(void *)(a1 + 56))
    {
      id v8 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_3;
      block[3] = &unk_265499C68;
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 64);
      uint64_t v18 = v9;
      uint64_t v10 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v15 = v10;
      id v16 = *(id *)(a1 + 48);
      dispatch_async(v8, block);

      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_3:
  int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "%@, %@, running proxy handler, %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_6:
}

uint64_t __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 64) - 1;
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_25B6E0000, v2, OS_LOG_TYPE_INFO, "SMSafetyMonitorManager retrying, %@, count, %lu", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) launchTaskWithSelector:*(void *)(a1 + 56) remainingAttempts:*(void *)(a1 + 64) - 1 proxyErrorHandler:*(void *)(a1 + 40) taskBlock:*(void *)(a1 + 48)];
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    os_signpost_id_t v31 = 0;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    os_signpost_id_t v31 = v10;
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v29[3];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v14 = [v7 identifier];
      id v15 = [v14 description];
      uint64_t v16 = [v15 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v16;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMInitializationSessionLatency", " enableTelemetry=YES {handle:%{public,signpost.telemetry:string1}s}", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__1;
    uint64_t v35 = __Block_byref_object_dispose__1;
    id v36 = [MEMORY[0x263EFF910] now];
    uint64_t v17 = objc_alloc_init(SMHeartbeatTimer);
    [(SMSafetyMonitorManager *)self setHeartbeatTimer:v17];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke;
    v25[3] = &unk_265499CB8;
    id v27 = &v28;
    id v26 = v8;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_349;
    v19[3] = &unk_265499D08;
    __int16 v23 = &v28;
    p_long long buf = &buf;
    id v20 = v7;
    __int16 v21 = self;
    id v22 = v26;
    [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v25 taskBlock:v19];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", (uint8_t *)&buf, 2u);
    }
  }
}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_349(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_2;
  v6[3] = &unk_265499CE0;
  long long v9 = *(_OWORD *)(a1 + 56);
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  [a2 initializeSessionWithConversation:v4 handler:v6];
}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a2;
  long long v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v13 = 134349056;
    uint64_t v14 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SMInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v13, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceNow];
  [*(id *)(a1 + 32) submitInitializationAnalyticsEventWithError:v7 conversation:*(void *)(a1 + 40) duration:-v12];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cancelInitializationWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    *(void *)unint64_t v19 = 0;
    id v20 = v19;
    uint64_t v21 = 0x2020000000;
    os_signpost_id_t v22 = 0;
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    os_signpost_id_t v22 = v7;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    long long v9 = v8;
    os_signpost_id_t v10 = *((void *)v20 + 3);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SMCancelInitializationSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke;
    v15[3] = &unk_265499CB8;
    uint64_t v17 = v19;
    id v16 = v5;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_352;
    v12[3] = &unk_265499D30;
    uint64_t v14 = v19;
    id v13 = v16;
    [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];

    _Block_object_dispose(v19, 8);
  }
  else
  {
    os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v19 = 0;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v19, 2u);
    }
  }
}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_352(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_2;
  v5[3] = &unk_265499CB8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 cancelInitializationWithHandler:v5];
}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {{error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    *(void *)__int16 v23 = 0;
    id v24 = v23;
    uint64_t v25 = 0x2020000000;
    os_signpost_id_t v26 = 0;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    os_signpost_id_t v26 = v10;
    os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    double v12 = v11;
    os_signpost_id_t v13 = *((void *)v24 + 3);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMCancelInitializationSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke;
    v19[3] = &unk_265499CB8;
    uint64_t v21 = v23;
    id v20 = v8;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_353;
    v15[3] = &unk_265499EE0;
    id v16 = v7;
    uint64_t v18 = v23;
    id v17 = v20;
    [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];

    _Block_object_dispose(v23, 8);
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v23 = 0;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v23, 2u);
    }
  }
}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_353(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 cancelInitializationForSessionID:v3 handler:v6];
}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    *(void *)os_signpost_id_t v26 = 0;
    id v27 = v26;
    uint64_t v28 = 0x2020000000;
    os_signpost_id_t v29 = 0;
    os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    os_signpost_id_t v29 = v12;
    os_signpost_id_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    uint64_t v14 = v13;
    os_signpost_id_t v15 = *((void *)v27 + 3);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SMEndSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke;
    v22[3] = &unk_265499CB8;
    id v24 = v26;
    id v23 = v10;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_354;
    v17[3] = &unk_265499D58;
    id v20 = v26;
    unint64_t v21 = a4;
    id v18 = v9;
    id v19 = v23;
    [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v17];

    _Block_object_dispose(v26, 8);
  }
  else
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)os_signpost_id_t v26 = 0;
      _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v26, 2u);
    }
  }
}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMEndSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_354(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_2;
  v7[3] = &unk_265499CB8;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [a2 endSessionForSessionID:v3 reason:v4 handler:v7];
}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMEndSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke;
    v14[3] = &unk_265499D80;
    os_signpost_id_t v15 = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_2;
    v11[3] = &unk_26549A1D8;
    id v12 = v7;
    os_signpost_id_t v13 = v15;
    [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];

    id v10 = v15;
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_3;
  v4[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 handoffSessionForSessionID:v3 handler:v4];
}

uint64_t __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v24 = 0;
      _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v24, 2u);
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v24 = 0;
      _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration", v24, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  *(void *)id v24 = 0;
  uint64_t v25 = v24;
  uint64_t v26 = 0x2020000000;
  os_signpost_id_t v27 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v27 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = *((void *)v25 + 3);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = [v7 description];
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v29 = v15;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMModifySessionLatency", " enableTelemetry=YES {newConfiguration:%{public,signpost.telemetry:string1}s}", buf, 0xCu);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke;
  v21[3] = &unk_265499CB8;
  id v23 = v24;
  id v22 = v8;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_355;
  v17[3] = &unk_265499EE0;
  id v18 = v7;
  id v20 = v24;
  id v19 = v22;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v17];

  _Block_object_dispose(v24, 8);
LABEL_13:
}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMModifySessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_355(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 modifySessionWithConfiguration:v3 handler:v6];
}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMModifySessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  os_signpost_id_t v27 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v27 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = v25[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMSendSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke;
  v20[3] = &unk_265499CB8;
  id v22 = &v24;
  id v21 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_356;
  v16[3] = &unk_265499EE0;
  id v14 = v7;
  id v17 = v14;
  id v19 = &v24;
  id v15 = v21;
  id v18 = v15;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];

  _Block_object_dispose(&v24, 8);
}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMSendSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_356(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 sendSafetyCacheForSessionID:v3 handler:v6];
}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMSendSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  os_signpost_id_t v28 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v28 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = [v7 description];
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v30 = v15;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMStartSession", " enableTelemetry=YES {configuration:%{public,signpost.telemetry:string1}s}", buf, 0xCu);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke;
  v22[3] = &unk_265499CB8;
  uint64_t v24 = &v25;
  id v23 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_357;
  v18[3] = &unk_265499EE0;
  id v16 = v7;
  id v19 = v16;
  id v21 = &v25;
  id v17 = v23;
  id v20 = v17;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v18];

  _Block_object_dispose(&v25, 8);
}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_357(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 startSessionWithConfiguration:v3 handler:v6];
}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartSession", " enableTelemetry=YES error:%{public,signpost.telemetry:number1}ld", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  os_signpost_id_t v27 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v27 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = v25[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMInitializeAndStartSession", " enableTelemetry=YES ", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke;
  v20[3] = &unk_265499CB8;
  id v22 = &v24;
  id v21 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_358;
  v16[3] = &unk_265499EE0;
  id v14 = v7;
  id v17 = v14;
  id v19 = &v24;
  id v15 = v21;
  id v18 = v15;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];

  _Block_object_dispose(&v24, 8);
}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializeAndStartSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_358(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 initializeAndStartSessionWithConfiguration:v3 handler:v6];
}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializeAndStartSession", " enableTelemetry=YES error:%{public,signpost.telemetry:number1}ld", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  uint64_t v26 = 0;
  os_signpost_id_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  os_signpost_id_t v29 = 0;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  os_signpost_id_t v29 = v12;
  os_signpost_id_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v14 = v13;
  os_signpost_id_t v15 = v27[3];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 134349056;
    int64_t v31 = a4;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SMRespondToTriggerPrompt", " enableTelemetry=YES {response:%{public,signpost.telemetry:number1}ld}", buf, 0xCu);
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke;
  v23[3] = &unk_265499CB8;
  uint64_t v25 = &v26;
  id v24 = v10;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_359;
  v18[3] = &unk_265499D58;
  id v16 = v9;
  id v21 = &v26;
  int64_t v22 = a4;
  id v19 = v16;
  id v17 = v24;
  id v20 = v17;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v23 taskBlock:v18];

  _Block_object_dispose(&v26, 8);
}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMRespondToTriggerPrompt", " enableTelemetry=YES {error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_359(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
  v7[3] = &unk_265499CB8;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [a2 respondToTriggerPromptForSessionID:v3 response:v4 handler:v7];
}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMRespondToTriggerPrompt", " enableTelemetry=YES {error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  os_signpost_id_t v28 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v28 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v12 = v11;
  os_signpost_id_t v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = [v7 description];
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v30 = v15;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {context:%{public,signpost.telemetry:string1}s}", buf, 0xCu);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
  v22[3] = &unk_265499CB8;
  id v24 = &v25;
  id v23 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_360;
  v18[3] = &unk_265499EE0;
  id v16 = v7;
  id v19 = v16;
  id v21 = &v25;
  id v17 = v23;
  id v20 = v17;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v18];

  _Block_object_dispose(&v25, 8);
}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_360(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 promptDestinationAnomalyVerificationWithContext:v3 handler:v6];
}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
  v14[3] = &unk_265499D80;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_3;
  v4[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 promptRoundTripAnomalyVerificationWithContext:v3 handler:v4];
}

uint64_t __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  os_signpost_id_t v28 = 0;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v28 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = [v7 description];
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v30 = v15;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMPromptTimerEndedVerification", " enableTelemetry=YES {context:%{public,signpost.telemetry:string1}s}", buf, 0xCu);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke;
  v22[3] = &unk_265499CB8;
  id v24 = &v25;
  id v23 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_361;
  v18[3] = &unk_265499EE0;
  id v16 = v7;
  id v19 = v16;
  id v21 = &v25;
  id v17 = v23;
  id v20 = v17;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v18];

  _Block_object_dispose(&v25, 8);
}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptTimerEndedVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_361(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 promptTimerEndedVerificationWithContext:v3 handler:v6];
}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptTimerEndedVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke;
  v14[3] = &unk_265499D80;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke_2;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 promptSafeArrivalWithContext:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[SMSafetyMonitorManager promptWorkoutAnomalyVerificationWithContext:handler:]";
      __int16 v19 = 1024;
      int v20 = 757;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
  v15[3] = &unk_265499D80;
  id v16 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2;
  v12[3] = &unk_26549A1D8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_3;
  v4[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 promptWorkoutAnomalyVerificationWithContext:v3 handler:v4];
}

uint64_t __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke;
  v14[3] = &unk_265499D80;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke_2;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sendHeartbeatForSessionID:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)_startHeartbeatForSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSafetyMonitorManager *)self heartbeatTimer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SMSafetyMonitorManager__startHeartbeatForSessionID___block_invoke;
  v7[3] = &unk_265499DA8;
  id v8 = v4;
  id v6 = v4;
  [v5 startHeartbeatForSessionID:v6 handler:v7];
}

void __54__SMSafetyMonitorManager__startHeartbeatForSessionID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[SMSafetyMonitorManager _startHeartbeatForSessionID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_stopHeartbeat
{
  id v2 = [(SMSafetyMonitorManager *)self heartbeatTimer];
  [v2 stopHeartbeatWithHandler:&__block_literal_global_363];
}

void __40__SMSafetyMonitorManager__stopHeartbeat__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SMSafetyMonitorManager _stopHeartbeat]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_25B6E0000, v3, OS_LOG_TYPE_INFO, "%s, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)processStateForHeartbeat:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(SMSafetyMonitorManager *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__SMSafetyMonitorManager_processStateForHeartbeat_forActiveDevice_withError___block_invoke;
  v13[3] = &unk_265499DF0;
  id v14 = v9;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __77__SMSafetyMonitorManager_processStateForHeartbeat_forActiveDevice_withError___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    if (v2)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        unint64_t v3 = [v2 sessionState];
        if (v3 <= 0xE)
        {
          if (((1 << v3) & 0x5397) != 0)
          {
            int v4 = *(void **)(a1 + 48);
            [v4 _stopHeartbeat];
          }
          else if (((1 << v3) & 0xC00) != 0)
          {
            uint64_t v5 = *(void **)(a1 + 48);
            id v7 = [*(id *)(a1 + 40) configuration];
            __int16 v6 = [v7 sessionID];
            [v5 _startHeartbeatForSessionID:v6];
          }
        }
      }
    }
  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    __int16 v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 820;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)int64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  __int16 v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v17[3] = &unk_265499CB8;
  __int16 v19 = v22;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_364;
  v14[3] = &unk_265499D30;
  id v16 = v22;
  id v13 = v18;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, erroring immediately", (uint8_t *)&v9, 0xCu);
  }

  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  __int16 v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [v3 code];
    int v9 = 134349056;
    __int16 v10 = (const char *)v8;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_364(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2;
  v5[3] = &unk_265499E18;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 fetchCurrentWorkoutSnapshotWithHandler:v5];
}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  os_signpost_id_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = 134349056;
    uint64_t v11 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    os_signpost_id_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    os_signpost_id_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    BOOL v17 = v8;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,fetching active session share recipients", buf, 0x16u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke;
  v13[3] = &unk_26549A098;
  void v13[4] = self;
  SEL v15 = a2;
  id v14 = v5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke_366;
  v11[3] = &unk_265499E40;
  id v12 = v14;
  id v10 = v14;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v11];
}

void __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    os_signpost_id_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    os_signpost_id_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke_366(uint64_t a1, void *a2)
{
  return [a2 fetchSOSReceiversWithCompletion:*(void *)(a1 + 32)];
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    __int16 v12 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", buf, 0x20u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  v18[3] = &unk_265499E68;
  void v18[4] = self;
  SEL v21 = a2;
  id v20 = v8;
  id v19 = v7;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_367;
  v15[3] = &unk_26549A1D8;
  id v16 = v19;
  id v17 = v20;
  id v13 = v20;
  id v14 = v19;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v18 taskBlock:v15];
}

void __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v8 = 138412802;
    os_signpost_id_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_367(uint64_t a1, void *a2)
{
  return [a2 fetchInitiatorSafetyCacheForSessionID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)startMonitoringSessionStateWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager startMonitoringSessionStateWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 872;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)int64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  __int16 v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringSession", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    SEL v21 = "-[SMSafetyMonitorManager startMonitoringSessionStateWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setSessionStateHandler:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke;
  v17[3] = &unk_265499E90;
  id v19 = v22;
  void v17[4] = self;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_368;
  v14[3] = &unk_265499EE0;
  id v16 = v22;
  id v13 = v18;
  void v14[4] = self;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    id v5 = v4;
    os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      int v7 = 134349056;
      uint64_t v8 = [v3 code];
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setSessionStateHandler:0];
  }
}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_368(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_2;
  v6[3] = &unk_265499EB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  void v6[4] = *(void *)(a1 + 32);
  [a2 startMonitoringSessionStateWithHandler:v6];
}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", [v6 sessionState]);
    id v11 = objc_claimAutoreleasedReturnValue();
    int v12 = 136446466;
    uint64_t v13 = [v11 UTF8String];
    __int16 v14 = 2050;
    uint64_t v15 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMStartMonitoringSession", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v7) {
    [*(id *)(a1 + 32) setSessionStateHandler:0];
  }
}

- (void)stopMonitoringSessionStateWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager stopMonitoringSessionStateWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 897;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)int64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringSession", " enableTelemetry=YES ", buf, 2u);
  }

  int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    SEL v21 = "-[SMSafetyMonitorManager stopMonitoringSessionStateWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setSessionStateHandler:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke;
  v17[3] = &unk_265499CB8;
  id v19 = v22;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_370;
  v14[3] = &unk_265499D30;
  uint64_t v16 = v22;
  id v13 = v18;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_370(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_265499CB8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 stopMonitoringSessionStateWithHandler:v5];
}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v20 = 136315394;
      *(void *)&void v20[4] = "-[SMSafetyMonitorManager fetchCurrentSessionStateWithHandler:]";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 916;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v20, 0x12u);
    }
  }
  *(void *)id v20 = 0;
  *(void *)&v20[8] = v20;
  *(void *)&v20[16] = 0x2020000000;
  os_signpost_id_t v21 = 0;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v21 = v8;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v20[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentSessionState", " enableTelemetry=YES ", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke;
  v16[3] = &unk_265499CB8;
  id v18 = v20;
  id v17 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_371;
  v13[3] = &unk_265499D30;
  id v15 = v20;
  id v12 = v17;
  id v14 = v12;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];

  _Block_object_dispose(v20, 8);
}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchCurrentSessionState", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_371(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_265499F08;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 fetchCurrentSessionStateWithHandler:v5];
}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", [v6 sessionState]);
    id v11 = objc_claimAutoreleasedReturnValue();
    int v12 = 136446466;
    uint64_t v13 = [v11 UTF8String];
    __int16 v14 = 2050;
    uint64_t v15 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMFetchCurrentSessionState", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [(SMSafetyMonitorManager *)self sessionStateHandler];

  if (v9)
  {
    os_signpost_id_t v10 = [(SMSafetyMonitorManager *)self sessionStateHandler];
    ((void (**)(void, id, BOOL, id))v10)[2](v10, v12, v6, v8);
  }
  id v11 = [(SMSafetyMonitorManager *)self heartbeatTimer];

  if (v11) {
    [(SMSafetyMonitorManager *)self processStateForHeartbeat:v12 forActiveDevice:v6 withError:v8];
  }
}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v20 = 136315394;
      *(void *)&void v20[4] = "-[SMSafetyMonitorManager fetchCurrentLocalSessionStateWithHandler:]";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 943;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v20, 0x12u);
    }
  }
  *(void *)id v20 = 0;
  *(void *)&v20[8] = v20;
  *(void *)&v20[16] = 0x2020000000;
  os_signpost_id_t v21 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v21 = v8;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v20[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES ", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke;
  v16[3] = &unk_265499CB8;
  id v18 = v20;
  id v17 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_372;
  v13[3] = &unk_265499D30;
  uint64_t v15 = v20;
  id v12 = v17;
  id v14 = v12;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];

  _Block_object_dispose(v20, 8);
}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_372(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_265499F30;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 fetchCurrentLocalSessionStateWithHandler:v5];
}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = [v5 description];
    int v11 = 136446466;
    uint64_t v12 = [v10 UTF8String];
    __int16 v13 = 2050;
    uint64_t v14 = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringLocalSessionStateWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager startMonitoringLocalSessionStateWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 959;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)uint64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    os_signpost_id_t v21 = "-[SMSafetyMonitorManager startMonitoringLocalSessionStateWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setLocalSessionStateHandler:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke;
  v17[3] = &unk_265499E90;
  id v19 = v22;
  void v17[4] = self;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_374;
  v14[3] = &unk_265499EE0;
  uint64_t v16 = v22;
  id v13 = v18;
  void v14[4] = self;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    id v5 = v4;
    os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      int v7 = 134349056;
      uint64_t v8 = [v3 code];
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setLocalSessionStateHandler:0];
  }
}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_374(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_2;
  v6[3] = &unk_265499F58;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  void v6[4] = *(void *)(a1 + 32);
  [a2 startMonitoringLocalSessionStateWithHandler:v6];
}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = [v5 description];
    int v11 = 136446466;
    uint64_t v12 = [v10 UTF8String];
    __int16 v13 = 2050;
    uint64_t v14 = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v6) {
    [*(id *)(a1 + 32) setLocalSessionStateHandler:0];
  }
}

- (void)stopMonitoringLocalSessionStateWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager stopMonitoringLocalSessionStateWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 983;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)uint64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    os_signpost_id_t v21 = "-[SMSafetyMonitorManager stopMonitoringLocalSessionStateWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setLocalSessionStateHandler:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke;
  v17[3] = &unk_265499CB8;
  id v19 = v22;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_375;
  v14[3] = &unk_265499D30;
  uint64_t v16 = v22;
  id v13 = v18;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_375(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_265499CB8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 stopMonitoringSessionStateWithHandler:v5];
}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [(SMSafetyMonitorManager *)self localSessionStateHandler];

  if (v7)
  {
    uint64_t v8 = [(SMSafetyMonitorManager *)self localSessionStateHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchSuggestionsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchSuggestionsCountWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSuggestionsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SMSafetyMonitorManager_clearSuggestionsWithHandler___block_invoke;
  block[3] = &unk_265499FA8;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __54__SMSafetyMonitorManager_clearSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxyForServicingSelector:*(void *)(a1 + 48) withErrorHandler:*(void *)(a1 + 40)];
  [v2 clearSuggestionsWithHandler:*(void *)(a1 + 40)];
}

- (void)storeSuggestions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 storeSuggestions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 storeSessionManagerStates:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 storeSessionMonitorStates:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 storeSessionConfigurations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 storeTriggerDestinationStates:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchSessionManagerStatesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMostRecentSessionMonitorStateWithSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchSessionConfigurationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSessionsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke;
  block[3] = &unk_265499FA8;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  long long v4 = [v3 _proxyForServicingSelector:v2 withErrorHandler:v5];
  [v4 clearSessionsWithHandler:*(void *)(a1 + 40)];
}

uint64_t __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke;
  block[3] = &unk_265499FA8;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  long long v4 = [v3 _proxyForServicingSelector:v2 withErrorHandler:v5];
  [v4 clearSessionMonitorStatesWithHandler:*(void *)(a1 + 40)];
}

uint64_t __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke;
  block[3] = &unk_265499FA8;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  long long v4 = [v3 _proxyForServicingSelector:v2 withErrorHandler:v5];
  [v4 clearTriggerDestinationStatesWithHandler:*(void *)(a1 + 40)];
}

uint64_t __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchTriggerDestinationStateWithSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke;
  v17[3] = &unk_265499D80;
  id v18 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke_2;
  v13[3] = &unk_265499FD0;
  BOOL v16 = a4;
  id v14 = v9;
  id v15 = v18;
  id v11 = v18;
  id v12 = v9;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v13];
}

uint64_t __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 runProactiveSuggestionsEngineWithContext:*(void *)(a1 + 32) shouldStoreSuggestions:*(unsigned __int8 *)(a1 + 48) handler:*(void *)(a1 + 40)];
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke;
  v9[3] = &unk_265499D80;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke_2;
  v7[3] = &unk_265499E40;
  id v8 = v10;
  id v6 = v10;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchSuggestedSessionConfigurationWithHandler:*(void *)(a1 + 32)];
}

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
  v9[3] = &unk_265499D80;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2;
  v7[3] = &unk_265499E40;
  id v8 = v10;
  id v6 = v10;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:*(void *)(a1 + 32)];
}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__SMSafetyMonitorManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v11];
}

uint64_t __77__SMSafetyMonitorManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 launchSessionInitiationUIWithConfiguration:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 1192;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)uint64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    os_signpost_id_t v21 = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke;
  v17[3] = &unk_265499CB8;
  id v19 = v22;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_376;
  v14[3] = &unk_265499D30;
  BOOL v16 = v22;
  id v13 = v18;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_376(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2;
  v5[3] = &unk_265499FF8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 fetchMostLikelyReceiverHandlesWithHandler:v5];
}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = 134349056;
    uint64_t v11 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v27 = 136315394;
      *(void *)&v27[4] = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithOptions:handler:]";
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 1209;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v27, 0x12u);
    }
  }
  *(void *)uint64_t v27 = 0;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x2020000000;
  os_signpost_id_t v28 = 0;
  int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  os_signpost_id_t v28 = v11;
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(*(void *)&v27[8] + 24);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES ", buf, 2u);
  }

  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v26 = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithOptions:handler:]";
    _os_log_impl(&dword_25B6E0000, v15, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke;
  v22[3] = &unk_265499CB8;
  uint64_t v24 = v27;
  id v23 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_378;
  v18[3] = &unk_265499EE0;
  id v16 = v7;
  id v19 = v16;
  os_signpost_id_t v21 = v27;
  id v17 = v23;
  id v20 = v17;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v18];

  _Block_object_dispose(v27, 8);
}

void __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_378(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2;
  v6[3] = &unk_265499FF8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 fetchMostLikelyReceiverHandlesWithOptions:v3 handler:v6];
}

void __76__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = 134349056;
    uint64_t v11 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[SMSafetyMonitorManager fetchNumFavoriteRecipientsWithReceiverHandles:handler:]";
    __int16 v21 = 1024;
    int v22 = 1228;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[SMSafetyMonitorManager fetchNumFavoriteRecipientsWithReceiverHandles:handler:]";
      __int16 v21 = 1024;
      int v22 = 1229;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke;
  v17[3] = &unk_265499D80;
  id v18 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke_2;
  v14[3] = &unk_26549A1D8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchNumFavoriteRecipientsWithReceiverHandles:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[SMSafetyMonitorManager fetchNumEmergencyRecipientsWithReceiverHandles:handler:]";
    __int16 v21 = 1024;
    int v22 = 1241;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[SMSafetyMonitorManager fetchNumEmergencyRecipientsWithReceiverHandles:handler:]";
      __int16 v21 = 1024;
      int v22 = 1242;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke;
  v17[3] = &unk_265499D80;
  id v18 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke_2;
  v14[3] = &unk_26549A1D8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchNumEmergencyRecipientsWithReceiverHandles:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[SMSafetyMonitorManager fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:]";
    __int16 v21 = 1024;
    int v22 = 1254;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[SMSafetyMonitorManager fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:]";
      __int16 v21 = 1024;
      int v22 = 1255;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke;
  v17[3] = &unk_265499D80;
  id v18 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke_2;
  v14[3] = &unk_26549A1D8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchNumiCloudFamilyRecipientsWithReceiverHandles:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager fetchMostLikelySessionDestinationsWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 1266;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)int v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  os_signpost_id_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  int v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v21 = "-[SMSafetyMonitorManager fetchMostLikelySessionDestinationsWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke;
  v17[3] = &unk_265499CB8;
  id v19 = v22;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_379;
  v14[3] = &unk_265499D30;
  id v16 = v22;
  id v13 = v18;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_379(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_2;
  v5[3] = &unk_26549A020;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 fetchMostLikelySessionDestinationsWithHandler:v5];
}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v13 = 134349056;
    uint64_t v14 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v13, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke;
  v14[3] = &unk_265499D80;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke_2;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 showSuggestionsDetectionUIWithSuggestion:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
  v19[3] = &unk_265499D80;
  id v20 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke_2;
  v15[3] = &unk_26549A048;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

uint64_t __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke_2(void *a1, void *a2)
{
  return [a2 shouldShowKeyboardSuggestionsForInitiator:a1[4] receiver:a1[5] handler:a1[6]];
}

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
  v19[3] = &unk_265499D80;
  id v20 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke_2;
  v15[3] = &unk_26549A048;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

uint64_t __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke_2(void *a1, void *a2)
{
  return [a2 shouldShowTipKitSuggestionsForInitiator:a1[4] receiver:a1[5] handler:a1[6]];
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke;
  v9[3] = &unk_265499D80;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke_2;
  v7[3] = &unk_265499E40;
  id v8 = v10;
  id v6 = v10;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchShouldShowProactiveSuggestionsWithHandler:*(void *)(a1 + 32)];
}

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__SMSafetyMonitorManager_showAlwaysOnPromptWithConfiguration_handler___block_invoke;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v11];
}

uint64_t __70__SMSafetyMonitorManager_showAlwaysOnPromptWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 showAlwaysOnPromptWithConfiguration:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke;
  block[3] = &unk_26549A070;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke_2;
  v5[3] = &unk_26549A098;
  void v5[4] = v2;
  uint64_t v7 = v3;
  id v6 = *(id *)(a1 + 56);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 sendIDSMessage:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke_2;
  v5[3] = &unk_26549A098;
  void v5[4] = v2;
  uint64_t v7 = v3;
  id v6 = *(id *)(a1 + 48);
  long long v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 sendIDSMessageToMyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke_2;
  v6[3] = &unk_26549A098;
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = *(void *)(a1 + 56);
  id v5 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v6];
  [v5 sendIDSMessageToPairedDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SMSafetyMonitorManager *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
  v12[3] = &unk_265499F80;
  id v14 = v8;
  SEL v15 = a2;
  void v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke_2;
  v6[3] = &unk_26549A098;
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = *(void *)(a1 + 56);
  id v5 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v6];
  [v5 sendIDSMessageToMyNearbyDevices:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_26549A0C0;
  id v29 = v17;
  SEL v30 = a2;
  block[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v17;
  dispatch_async(v18, block);
}

void __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 80);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_2;
  v5[3] = &unk_26549A098;
  void v5[4] = v2;
  uint64_t v7 = v3;
  id v6 = *(id *)(a1 + 72);
  id v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 sendMadridMessage:*(void *)(a1 + 40) associatedGUID:*(void *)(a1 + 48) toConversation:*(void *)(a1 + 56) summaryText:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

void __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_26549A0E8;
  id v38 = v22;
  SEL v39 = a2;
  block[4] = self;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v24 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v16;
  id v30 = v22;
  dispatch_async(v23, block);
}

void __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_2;
  int v8 = &unk_26549A098;
  id v9 = v2;
  uint64_t v11 = v3;
  id v10 = *(id *)(a1 + 88);
  id v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:&v5];
  objc_msgSend(v4, "scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:summaryText:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), v5, v6, v7, v8, v9);
}

void __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [(SMSafetyMonitorManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  block[3] = &unk_26549A070;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke_2;
  v5[3] = &unk_26549A098;
  void v5[4] = v2;
  uint64_t v7 = v3;
  id v6 = *(id *)(a1 + 56);
  id v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 cancelMadridMessageSendForMessageGUID:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_26549A110;
  void v22[4] = self;
  v22[5] = a2;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke_381;
  v17[3] = &unk_26549A138;
  id v18 = v11;
  id v19 = v12;
  BOOL v21 = a5;
  id v20 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v17];
}

void __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke_381(uint64_t a1, void *a2)
{
  return [a2 iMessageSendFor:*(void *)(a1 + 32) guid:*(void *)(a1 + 40) successful:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(a1 + 48)];
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_26549A110;
  void v22[4] = self;
  v22[5] = a2;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke_382;
  v17[3] = &unk_26549A138;
  id v18 = v11;
  id v19 = v12;
  BOOL v21 = a5;
  id v20 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v17];
}

void __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke_382(uint64_t a1, void *a2)
{
  return [a2 iMessageScheduledSendScheduledFor:*(void *)(a1 + 32) guid:*(void *)(a1 + 40) successful:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(a1 + 48)];
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
  v17[3] = &unk_26549A110;
  void v17[4] = self;
  void v17[5] = a2;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke_383;
  v13[3] = &unk_26549A160;
  BOOL v16 = a4;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v13];
}

void __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke_383(uint64_t a1, void *a2)
{
  return [a2 iMessageScheduledSendCancelFor:*(void *)(a1 + 32) successful:*(unsigned __int8 *)(a1 + 48) withError:*(void *)(a1 + 40)];
}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  id v7 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke;
  v8[3] = &unk_26549A110;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke_384;
  v6[3] = &unk_26549A188;
  id v5 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke_384(uint64_t a1, void *a2)
{
  return [a2 iMessageScheduledSendTriggeredFor:*(void *)(a1 + 32)];
}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke;
  v17[3] = &unk_26549A110;
  void v17[4] = self;
  void v17[5] = a2;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke_385;
  v13[3] = &unk_26549A160;
  id v14 = v9;
  id v15 = v10;
  BOOL v16 = a5;
  id v11 = v10;
  id v12 = v9;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v13];
}

void __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke_385(uint64_t a1, void *a2)
{
  return [a2 iMessageReceived:*(void *)(a1 + 32) fromHandle:*(void *)(a1 + 40) fromMe:*(unsigned __int8 *)(a1 + 48)];
}

- (void)iMessageDeletedFor:(id)a3
{
  id v7 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke;
  v8[3] = &unk_26549A110;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke_386;
  v6[3] = &unk_26549A188;
  id v5 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke_386(uint64_t a1, void *a2)
{
  return [a2 iMessageDeletedFor:*(void *)(a1 + 32)];
}

- (void)iMessageConversationDeletedFor:(id)a3
{
  id v7 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke;
  v8[3] = &unk_26549A110;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke_387;
  v6[3] = &unk_26549A188;
  id v5 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke_387(uint64_t a1, void *a2)
{
  return [a2 iMessageConversationDeletedFor:*(void *)(a1 + 32)];
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);
  }
  id v12 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke;
  v13[3] = &unk_26549A110;
  void v13[4] = self;
  void v13[5] = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke_388;
  v11[3] = &unk_26549A188;
  id v10 = v5;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v11];
}

void __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke_388(uint64_t a1, void *a2)
{
  return [a2 iMessageGroupMembershipChangedFor:*(void *)(a1 + 32)];
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);
  }
  id v12 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke;
  v13[3] = &unk_26549A110;
  void v13[4] = self;
  void v13[5] = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke_389;
  v11[3] = &unk_26549A188;
  id v10 = v5;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v11];
}

void __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke_389(uint64_t a1, void *a2)
{
  return [a2 iMessageGroupDisplayNameChangedFor:*(void *)(a1 + 32)];
}

- (void)iMessageGroupPhotoChangedFor:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);
  }
  id v12 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke;
  v13[3] = &unk_26549A110;
  void v13[4] = self;
  void v13[5] = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke_390;
  v11[3] = &unk_26549A188;
  id v10 = v5;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v11];
}

void __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke_390(uint64_t a1, void *a2)
{
  return [a2 iMessageGroupPhotoChangedFor:*(void *)(a1 + 32)];
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);
  }
  id v12 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke;
  v13[3] = &unk_26549A110;
  void v13[4] = self;
  void v13[5] = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke_391;
  v11[3] = &unk_26549A188;
  id v10 = v5;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v11];
}

void __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke_391(uint64_t a1, void *a2)
{
  return [a2 kickedFromIMessageGroupWith:*(void *)(a1 + 32)];
}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = [v7 UUIDString];
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", buf, 0x20u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke;
  v19[3] = &unk_265499E68;
  void v19[4] = self;
  SEL v22 = a2;
  id v21 = v8;
  id v20 = v7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke_392;
  v16[3] = &unk_26549A1D8;
  id v17 = v20;
  id v18 = v21;
  id v14 = v21;
  id v15 = v20;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v16];
}

void __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke_392(uint64_t a1, void *a2)
{
  return [a2 fetchSessionReceiptForSessionID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)startMonitoringInitiatorSafetyCacheWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v14 = "-[SMSafetyMonitorManager startMonitoringInitiatorSafetyCacheWithHandler:]";
      __int16 v15 = 1024;
      int v16 = 1580;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v14 = "-[SMSafetyMonitorManager startMonitoringInitiatorSafetyCacheWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setInitiatorSafetyCacheHandler:v5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke;
  v11[3] = &unk_265499B20;
  void v11[4] = self;
  id v12 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_2;
  v9[3] = &unk_26549A1D8;
  void v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v11 taskBlock:v9];
}

uint64_t __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    id v3 = *(void **)(v2 + 32);
    return [v3 setInitiatorSafetyCacheHandler:0];
  }
  return result;
}

void __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_3;
  v5[3] = &unk_26549A1B0;
  id v4 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 startMonitoringInitiatorSafetyCacheWithHandler:v5];
}

uint64_t __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    uint64_t v7 = result;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    id v8 = *(void **)(v7 + 32);
    return [v8 setInitiatorSafetyCacheHandler:0];
  }
  return result;
}

- (void)stopMonitoringInitiatorSafetyCacheWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[SMSafetyMonitorManager stopMonitoringInitiatorSafetyCacheWithCompletion:]";
      __int16 v14 = 1024;
      int v15 = 1603;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }
  }
  [(SMSafetyMonitorManager *)self setInitiatorSafetyCacheHandler:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke;
  v10[3] = &unk_265499D80;
  id v11 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke_2;
  v8[3] = &unk_265499E40;
  id v9 = v11;
  id v7 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stopMonitoringInitiatorSafetyCacheWithCompletion:*(void *)(a1 + 32)];
}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [(SMSafetyMonitorManager *)self initiatorSafetyCacheHandler];

  if (v18)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      SEL v22 = [v13 UUIDString];
      id v23 = NSStringFromSelector(a2);
      int v25 = 138412802;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v23;
      _os_log_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,sessionID:%@,%@,received safety cache update", (uint8_t *)&v25, 0x20u);
    }
    id v24 = [(SMSafetyMonitorManager *)self initiatorSafetyCacheHandler];
    ((void (**)(void, id, id, id, id, id, void))v24)[2](v24, v13, v14, v15, v16, v17, 0);
  }
}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke;
  v9[3] = &unk_26549A098;
  void v9[4] = self;
  SEL v11 = a2;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke_394;
  v7[3] = &unk_265499E40;
  id v8 = v10;
  id v6 = v10;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

void __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    SEL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke_394(uint64_t a1, void *a2)
{
  return [a2 fetchAllReceiverSessionStatusWithCompletion:*(void *)(a1 + 32)];
}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  v14[3] = &unk_26549A098;
  void v14[4] = self;
  SEL v16 = a2;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke_395;
  v11[3] = &unk_26549A1D8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

void __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    SEL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke_395(uint64_t a1, void *a2)
{
  return [a2 fetchReceiverSessionStatusForSessionID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)startMonitoringReceiverSessionStatusWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)SEL v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager startMonitoringReceiverSessionStatusWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 1654;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)SEL v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  __int16 v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[SMSafetyMonitorManager startMonitoringReceiverSessionStatusWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setReceiverSessionStatusHandler:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke;
  v17[3] = &unk_265499E90;
  id v19 = v22;
  void v17[4] = self;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_396;
  v14[3] = &unk_265499EE0;
  SEL v16 = v22;
  id v13 = v18;
  void v14[4] = self;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setReceiverSessionStatusHandler:0];
  }
}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_396(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_2;
  v6[3] = &unk_26549A200;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  void v6[4] = *(void *)(a1 + 32);
  [a2 startMonitoringReceiverSessionStatusWithHandler:v6];
}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 134349056;
    uint64_t v10 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setReceiverSessionStatusHandler:0];
  }
}

- (void)stopMonitoringReceiverSessionStatusWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v20 = 136315394;
      *(void *)&void v20[4] = "-[SMSafetyMonitorManager stopMonitoringReceiverSessionStatusWithCompletion:]";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 1681;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v20, 0x12u);
    }
  }
  *(void *)id v20 = 0;
  *(void *)&v20[8] = v20;
  *(void *)&v20[16] = 0x2020000000;
  os_signpost_id_t v21 = 0;
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v21 = v8;
  int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v20[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES ", buf, 2u);
  }

  [(SMSafetyMonitorManager *)self setReceiverSessionStatusHandler:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke;
  v16[3] = &unk_265499CB8;
  id v18 = v20;
  id v17 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_398;
  v13[3] = &unk_265499D30;
  id v15 = v20;
  id v12 = v17;
  id v14 = v12;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];

  _Block_object_dispose(v20, 8);
}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_398(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_265499CB8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 stopMonitoringReceiverSessionStatusWithCompletion:v5];
}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [(SMSafetyMonitorManager *)self receiverSessionStatusHandler];

  if (v7)
  {
    uint64_t v8 = [(SMSafetyMonitorManager *)self receiverSessionStatusHandler];
    ((void (**)(void, id, id, void))v8)[2](v8, v9, v6, 0);
  }
}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  os_signpost_id_t v28 = 0;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v28 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v12 = v11;
  os_signpost_id_t v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES ", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke;
  v20[3] = &unk_26549A2C8;
  void v20[4] = self;
  uint64_t v22 = &v25;
  SEL v23 = a2;
  id v21 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_399;
  v16[3] = &unk_265499EE0;
  id v14 = v7;
  id v17 = v14;
  id v19 = &v25;
  id v15 = v21;
  id v18 = v15;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];

  _Block_object_dispose(&v25, 8);
}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v9 = (objc_class *)objc_opt_class();
    os_signpost_id_t v10 = NSStringFromClass(v9);
    os_signpost_id_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412802;
    uint64_t v13 = (uint64_t)v10;
    __int16 v14 = 2112;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v12, 0x20u);
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [v3 code];
    int v12 = 134349056;
    uint64_t v13 = v8;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_399(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_2;
  v6[3] = &unk_265499CB8;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 userRequestedCacheDownloadForSessionID:v3 completion:v6];
}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  os_signpost_id_t v28 = 0;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  os_signpost_id_t v28 = v10;
  os_signpost_id_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  int v12 = v11;
  os_signpost_id_t v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMFetchReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  v20[3] = &unk_26549A2C8;
  void v20[4] = self;
  uint64_t v22 = &v25;
  SEL v23 = a2;
  id v21 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_400;
  v16[3] = &unk_265499EE0;
  id v14 = v7;
  id v17 = v14;
  id v19 = &v25;
  id v15 = v21;
  id v18 = v15;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];

  _Block_object_dispose(&v25, 8);
}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    os_signpost_id_t v10 = NSStringFromClass(v9);
    os_signpost_id_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412802;
    uint64_t v13 = (uint64_t)v10;
    __int16 v14 = 2112;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v12, 0x20u);
  }
  long long v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [v3 code];
    int v12 = 134349056;
    uint64_t v13 = v8;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMFetchReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_400(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2;
  v6[3] = &unk_26549A228;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 fetchReceiverSafetyCacheForSessionID:v3 completion:v6];
}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  os_signpost_id_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    if (v9) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    int v14 = 136446466;
    uint64_t v15 = [(__CFString *)v13 UTF8String];
    __int16 v16 = 2050;
    uint64_t v17 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMFetchReceiverSafetyCache", " enableTelemetry=YES {phoneCacheAvailable:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v14, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringReceiverSafetyCacheWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)&void v22[4] = "-[SMSafetyMonitorManager startMonitoringReceiverSafetyCacheWithHandler:]";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 1746;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v22, 0x12u);
    }
  }
  *(void *)uint64_t v22 = 0;
  *(void *)&v22[8] = v22;
  *(void *)&v22[16] = 0x2020000000;
  os_signpost_id_t v23 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v23 = v8;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v22[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[SMSafetyMonitorManager startMonitoringReceiverSafetyCacheWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  [(SMSafetyMonitorManager *)self setReceiverSafetyCacheHandler:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke;
  v17[3] = &unk_265499E90;
  id v19 = v22;
  void v17[4] = self;
  id v18 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_402;
  v14[3] = &unk_265499EE0;
  __int16 v16 = v22;
  id v13 = v18;
  void v14[4] = self;
  id v15 = v13;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];

  _Block_object_dispose(v22, 8);
}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setReceiverSafetyCacheHandler:0];
  }
}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_402(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2;
  v6[3] = &unk_26549A250;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  void v6[4] = *(void *)(a1 + 32);
  [a2 startMonitoringReceiverSafetyCacheWithHandler:v6];
}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    if (a3) {
      os_signpost_id_t v11 = @"YES";
    }
    else {
      os_signpost_id_t v11 = @"NO";
    }
    int v12 = 136446466;
    uint64_t v13 = [(__CFString *)v11 UTF8String];
    __int16 v14 = 2050;
    uint64_t v15 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES {phoneCache:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setReceiverSafetyCacheHandler:0];
  }
}

- (void)stopMonitoringReceiverSafetyCacheWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v20 = 136315394;
      *(void *)&void v20[4] = "-[SMSafetyMonitorManager stopMonitoringReceiverSafetyCacheWithCompletion:]";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 1773;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v20, 0x12u);
    }
  }
  *(void *)id v20 = 0;
  *(void *)&v20[8] = v20;
  *(void *)&v20[16] = 0x2020000000;
  os_signpost_id_t v21 = 0;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v21 = v8;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(*(void *)&v20[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  [(SMSafetyMonitorManager *)self setReceiverSafetyCacheHandler:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke;
  v16[3] = &unk_265499CB8;
  id v18 = v20;
  id v17 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_404;
  v13[3] = &unk_265499D30;
  uint64_t v15 = v20;
  id v12 = v17;
  id v14 = v12;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];

  _Block_object_dispose(v20, 8);
}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_404(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_2;
  v5[3] = &unk_265499CB8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 stopMonitoringReceiverSafetyCacheWithCompletion:v5];
}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  os_signpost_id_t v10 = [(SMSafetyMonitorManager *)self receiverSafetyCacheHandler];

  if (v10)
  {
    os_signpost_id_t v11 = [(SMSafetyMonitorManager *)self receiverSafetyCacheHandler];
    ((void (**)(void, id, id, id, void))v11)[2](v11, v12, v8, v9, 0);
  }
}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v12 = "-[SMSafetyMonitorManager detailsViewOpenedForSessionID:]";
      __int16 v13 = 1024;
      int v14 = 1801;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke;
  v10[3] = &unk_26549A110;
  void v10[4] = self;
  v10[5] = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke_405;
  v8[3] = &unk_26549A188;
  id v7 = v5;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

void __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (objc_class *)objc_opt_class();
    os_signpost_id_t v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    os_signpost_id_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke_405(uint64_t a1, void *a2)
{
  return [a2 detailsViewOpenedForSessionID:*(void *)(a1 + 32)];
}

- (void)checkInitiatorEligibilityWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[SMSafetyMonitorManager checkInitiatorEligibilityWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1814;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke;
  v10[3] = &unk_265499D80;
  id v11 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_2;
  v8[3] = &unk_265499E40;
  id v9 = v11;
  id v7 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_3;
  v3[3] = &unk_26549A278;
  id v4 = *(id *)(a1 + 32);
  [a2 checkInitiatorEligibilityWithHandler:v3];
}

uint64_t __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkHasSimWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[SMSafetyMonitorManager checkHasSimWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1827;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke;
  v10[3] = &unk_265499D80;
  id v11 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_2;
  v8[3] = &unk_265499E40;
  id v9 = v11;
  id v7 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_3;
  v3[3] = &unk_26549A2A0;
  id v4 = *(id *)(a1 + 32);
  [a2 checkHasSimWithHandler:v3];
}

uint64_t __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
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
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[SMSafetyMonitorManager checkConversationEligibility:handler:]";
    __int16 v21 = 1024;
    int v22 = 1840;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[SMSafetyMonitorManager checkConversationEligibility:handler:]";
      __int16 v21 = 1024;
      int v22 = 1841;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke;
  v17[3] = &unk_265499D80;
  id v18 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_2;
  v14[3] = &unk_26549A1D8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_3;
  v4[3] = &unk_26549A278;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 checkConversationEligibility:v3 handler:v4];
}

uint64_t __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    os_signpost_id_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[SMSafetyMonitorManager fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1854;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v10[3] = &unk_265499D80;
  id v11 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
  v8[3] = &unk_265499E40;
  id v9 = v11;
  id v7 = v11;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_3;
  v3[3] = &unk_26549A278;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v3];
}

uint64_t __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkEligibilityOfDestination:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
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
    *(_DWORD *)long long buf = 136315394;
    __int16 v21 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]";
    __int16 v22 = 1024;
    int v23 = 1871;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v21 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]";
      __int16 v22 = 1024;
      int v23 = 1872;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke;
  v17[3] = &unk_265499B20;
  id v19 = v9;
  id v18 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke_408;
  v14[3] = &unk_26549A1D8;
  id v15 = v18;
  id v16 = v19;
  id v12 = v19;
  id v13 = v18;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

void __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      os_signpost_id_t v6 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke_408(uint64_t a1, void *a2)
{
  return [a2 checkEligibilityOfDestination:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)calculateDistanceToDestination:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
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
    *(_DWORD *)long long buf = 136315394;
    __int16 v21 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]";
    __int16 v22 = 1024;
    int v23 = 1890;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v21 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]";
      __int16 v22 = 1024;
      int v23 = 1891;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke;
  v17[3] = &unk_265499B20;
  id v19 = v9;
  id v18 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke_409;
  v14[3] = &unk_26549A1D8;
  id v15 = v18;
  id v16 = v19;
  id v12 = v19;
  id v13 = v18;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

void __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      os_signpost_id_t v6 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(1.79769313e308);
  }
}

uint64_t __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke_409(uint64_t a1, void *a2)
{
  return [a2 calculateDistanceToDestination:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v34 = 136315394;
      *(void *)&v34[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = 1910;
      _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", v34, 0x12u);
    }
  }
  if (!a4)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v34 = 136315394;
      *(void *)&v34[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = 1911;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: transportType (in %s:%d)", v34, 0x12u);
    }
  }
  if (!v10)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v34 = 136315394;
      *(void *)&v34[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = 1912;
      _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v34, 0x12u);
    }
  }
  *(void *)id v34 = 0;
  *(void *)&v34[8] = v34;
  *(void *)&v34[16] = 0x2020000000;
  os_signpost_id_t v35 = 0;
  __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  os_signpost_id_t v35 = v15;
  id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v17 = v16;
  os_signpost_id_t v18 = *(void *)(*(void *)&v34[8] + 24);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMEstimateETAToDestination", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v33 = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
    _os_log_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke;
  v27[3] = &unk_26549A2C8;
  id v30 = v34;
  id v29 = v10;
  id v28 = v9;
  unint64_t v31 = a4;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_410;
  v22[3] = &unk_265499D58;
  id v20 = v28;
  uint64_t v25 = v34;
  unint64_t v26 = a4;
  id v23 = v20;
  id v21 = v29;
  id v24 = v21;
  [(SMSafetyMonitorManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v27 taskBlock:v22];

  _Block_object_dispose(v34, 8);
}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v9, 0x16u);
    }

    int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v6 = v5;
    os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      uint64_t v8 = [v3 code];
      int v9 = 134349056;
      id v10 = (const char *)v8;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMEstimateETAToDestination", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(-1.0, -1.0);
  }
}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_410(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_2;
  v7[3] = &unk_26549A2F0;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [a2 estimateEtaToDestination:v3 transportType:v4 completionHandler:v7];
}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a2;
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  uint64_t v13 = v12;
  os_signpost_id_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v15 = 134349056;
    uint64_t v16 = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SMEstimateETAToDestination", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(a3, a4);
}

- (int64_t)prepareUserInfoForNotificationContent:(id)a3 initiatorHandle:(id)a4 messageUrl:(id)a5
{
  v85[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
      __int16 v79 = 1024;
      LODWORD(v80) = 1939;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiatorHandle (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v11) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
    __int16 v79 = 1024;
    LODWORD(v80) = 1940;
    _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: content (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    os_signpost_id_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
      __int16 v79 = 1024;
      LODWORD(v80) = 1941;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  int v15 = +[SMMessage createMessageFromURL:v11];
  uint64_t v16 = [(id)objc_opt_class() messageType];
  if (v16 == 2)
  {
    unint64_t v19 = +[SMSessionEndMessage sessionEndReasonFromURL:v11];
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19 == 4)
    {
      if (v21)
      {
        __int16 v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        id v24 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v79 = 2112;
        uint64_t v80 = v24;
        _os_log_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Session ended due to SafetyCheck, suppress notification", buf, 0x16u);
      }
      int64_t v18 = 2;
    }
    else
    {
      if (v21)
      {
        uint64_t v25 = (objc_class *)objc_opt_class();
        unint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v26;
        __int16 v79 = 2112;
        uint64_t v80 = v27;
        _os_log_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Session ended due to unhandled reason, use default delivery mechanism", buf, 0x16u);
      }
      int64_t v18 = 0;
    }

    goto LABEL_28;
  }
  if (v16 != 3)
  {
    int64_t v18 = 0;
LABEL_28:
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    id v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    id v30 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v29;
    __int16 v79 = 2112;
    uint64_t v80 = v30;
    _os_log_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Not a trigger message, use default delivery mechanism", buf, 0x16u);
    goto LABEL_44;
  }
  uint64_t v17 = v15;
  if ((unint64_t)([v17 triggerType] - 10) < 5
    || ([v17 isSOSTrigger] & 1) != 0)
  {
    int64_t v18 = 2;
    goto LABEL_42;
  }
  [v9 setInterruptionLevel:2];
  int64_t v31 = +[SMMobileSMSPreferencesUtilities criticalAlertPreference];
  if (v31 == 2)
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (objc_class *)objc_opt_class();
      id v38 = NSStringFromClass(v37);
      SEL v39 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v79 = 2112;
      uint64_t v80 = v39;
      v40 = "#NotificationDeliveryRequest,%@,%@, User opted out of Critical Alerst, falling back to Notify Anyway + Time Sensitive";
LABEL_39:
      _os_log_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_DEFAULT, v40, buf, 0x16u);
    }
  }
  else
  {
    if (v31 == 1)
    {
      [v9 setInterruptionLevel:3];
      id v32 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = (objc_class *)objc_opt_class();
        id v34 = NSStringFromClass(v33);
        os_signpost_id_t v35 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v79 = 2112;
        uint64_t v80 = v35;
        _os_log_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, User opted in for Critical Alert", buf, 0x16u);
      }
      uint64_t v36 = 0;
      goto LABEL_41;
    }
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (objc_class *)objc_opt_class();
      id v38 = NSStringFromClass(v41);
      SEL v39 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v79 = 2112;
      uint64_t v80 = v39;
      v40 = "#NotificationDeliveryRequest,%@,%@, Couldn't look up the the SafetyMonitorUsesCriticalAlertsKey in UserDefau"
            "lts. Perhaps user isn't on-boarded yet!";
      goto LABEL_39;
    }
  }
  uint64_t v36 = 1;
LABEL_41:

  int64_t v18 = v36;
LABEL_42:
  [v9 setContentType:*MEMORY[0x263F1E128]];
  id v29 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (objc_class *)objc_opt_class();
    id v30 = NSStringFromClass(v42);
    NSStringFromSelector(a2);
    v43 = int64_t v70 = v18;
    [v9 contentType];
    id v72 = v10;
    v44 = self;
    v45 = a2;
    uint64_t v47 = v46 = v15;
    *(_DWORD *)long long buf = 138413058;
    *(void *)&uint8_t buf[4] = v30;
    __int16 v79 = 2112;
    uint64_t v80 = v43;
    __int16 v81 = 2112;
    id v82 = v9;
    __int16 v83 = 2112;
    uint64_t v84 = v47;
    _os_log_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, content, %@, contentType, %@", buf, 0x2Au);

    int v15 = v46;
    a2 = v45;
    self = v44;
    id v10 = v72;

    int64_t v18 = v70;
LABEL_44:
  }
LABEL_46:

  dispatch_semaphore_t v48 = dispatch_semaphore_create(0);
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke;
  v74[3] = &unk_26549A318;
  v74[4] = self;
  SEL v77 = a2;
  id v49 = v9;
  id v75 = v49;
  v50 = v48;
  v76 = v50;
  +[SMReceiverNotificationUtilities prepareNotificationBodyFromMessage:v15 completionHandler:v74];
  v51 = v50;
  v52 = [MEMORY[0x263EFF910] now];
  dispatch_time_t v53 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v51, v53))
  {
    id v69 = v11;
    int64_t v71 = v18;
    uint64_t v68 = v15;
    id v73 = v10;
    v54 = [MEMORY[0x263EFF910] now];
    [v54 timeIntervalSinceDate:v52];
    double v56 = v55;
    v57 = objc_opt_new();
    v58 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_503];
    v59 = [MEMORY[0x263F08B88] callStackSymbols];
    uint64_t v60 = [v59 filteredArrayUsingPredicate:v58];
    uint64_t v61 = [v60 firstObject];

    [v57 submitToCoreAnalytics:v61 type:1 duration:v56];
    uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_25B6E0000, v62, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v63 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F37F20];
    v85[0] = *MEMORY[0x263F08320];
    *(void *)long long buf = @"semaphore wait timeout";
    v65 = [NSDictionary dictionaryWithObjects:buf forKeys:v85 count:1];
    v66 = [v63 errorWithDomain:v64 code:15 userInfo:v65];

    int64_t v18 = v71;
    id v10 = v73;
    int v15 = v68;
    id v11 = v69;
    if (v66) {
  }
    }
  return v18;
}

void __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_signpost_id_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      id v12 = v9;
      __int16 v13 = 2112;
      os_signpost_id_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@, error while fetching notification body: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    if (v5)
    {
      [*(id *)(a1 + 40) setBody:v5];
      goto LABEL_7;
    }
    os_signpost_id_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver, notification body is empty", (uint8_t *)&v11, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = [(SMSafetyMonitorManager *)self queue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
  v20[3] = &unk_26549A340;
  id v24 = v14;
  SEL v25 = a2;
  void v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v14;
  dispatch_async(v15, v20);
}

void __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke_2;
  v5[3] = &unk_265499D80;
  uint64_t v3 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  uint64_t v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 respondToNotificationWithIdentifier:*(void *)(a1 + 40) sessionIdentifier:*(void *)(a1 + 48) actionIdentifier:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

uint64_t __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldDropMessage:(id)a3 from:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v43 = 136315394;
    v44 = "-[SMSafetyMonitorManager shouldDropMessage:from:fromMe:]";
    __int16 v45 = 1024;
    LODWORD(v46) = 2038;
    _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl (in %s:%d)", (uint8_t *)&v43, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v43 = 136315394;
      v44 = "-[SMSafetyMonitorManager shouldDropMessage:from:fromMe:]";
      __int16 v45 = 1024;
      LODWORD(v46) = 2039;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: from (in %s:%d)", (uint8_t *)&v43, 0x12u);
    }
  }
LABEL_10:
  unint64_t v13 = +[SMMessage messageTypeFromURL:v8];
  if (+[SMMessage interfaceTypeFromMessageType:v13] == 1)
  {
    id v14 = +[SMMessage createMessageFromURL:v8];
    __int16 v15 = v14;
    if (!v14)
    {
      id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        id v24 = (char *)objc_claimAutoreleasedReturnValue();
        SEL v25 = NSStringFromSelector(a2);
        int v43 = 138413058;
        v44 = v24;
        __int16 v45 = 2112;
        v46 = v25;
        __int16 v47 = 2112;
        double v48 = *(double *)&v10;
        __int16 v49 = 2112;
        id v50 = v8;
        unint64_t v26 = "%@,%@,received message from %@ could not be converted to SMMessage,messageUrl,%@";
        uint64_t v27 = v22;
        uint32_t v28 = 42;
        goto LABEL_34;
      }
LABEL_21:
      BOOL v29 = 1;
LABEL_29:

      goto LABEL_30;
    }
    if (v13 == 3)
    {
      if ([v14 triggerType] == 15)
      {
        id v16 = (void *)MEMORY[0x263EFF910];
        [(SMSafetyMonitorManager *)self requestTimeFromTimed];
        id v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        id v18 = [v15 triggerDate];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        id v22 = v21;
        if (v20 < -10.0)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            id v24 = (char *)objc_claimAutoreleasedReturnValue();
            SEL v25 = NSStringFromSelector(a2);
            int v43 = 138412802;
            v44 = v24;
            __int16 v45 = 2112;
            v46 = v25;
            __int16 v47 = 2048;
            double v48 = fabs(v20);
            unint64_t v26 = "%@,%@,schedule send message time cross-check failed,arrived early by %lf seconds,drop message";
            uint64_t v27 = v22;
            uint32_t v28 = 32;
LABEL_34:
            _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v43, v28);

            goto LABEL_21;
          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          int64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
          id v32 = NSStringFromSelector(a2);
          int v43 = 138412802;
          v44 = v31;
          __int16 v45 = 2112;
          v46 = v32;
          __int16 v47 = 2048;
          double v48 = v20;
          id v33 = "%@,%@,schedule send message time cross-check passed,time difference is %lf seconds";
          os_signpost_id_t v35 = v22;
          uint32_t v36 = 32;
          goto LABEL_27;
        }
LABEL_28:
        BOOL v29 = 0;
        goto LABEL_29;
      }
      id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      id v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      int64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
      id v32 = NSStringFromSelector(a2);
      int v43 = 138412546;
      v44 = v31;
      __int16 v45 = 2112;
      v46 = v32;
      id v33 = "%@,%@,message is valid non-Scheduled-Send Key Release message";
    }
    else
    {
      id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      id v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      int64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
      id v32 = NSStringFromSelector(a2);
      int v43 = 138412546;
      v44 = v31;
      __int16 v45 = 2112;
      v46 = v32;
      id v33 = "%@,%@,message is valid and not a Key Release message";
    }
    os_signpost_id_t v35 = v22;
    uint32_t v36 = 22;
LABEL_27:
    _os_log_impl(&dword_25B6E0000, v35, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v43, v36);

    goto LABEL_28;
  }
  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    SEL v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (char *)objc_claimAutoreleasedReturnValue();
    v41 = NSStringFromSelector(a2);
    int v43 = 138412802;
    v44 = v40;
    __int16 v45 = 2112;
    v46 = v41;
    __int16 v47 = 1024;
    LODWORD(v48) = v13;
    _os_log_error_impl(&dword_25B6E0000, v15, OS_LOG_TYPE_ERROR, "%@,%@,message type (%d) is either unrecognized or not expected as an iMessage", (uint8_t *)&v43, 0x1Cu);
  }
  BOOL v29 = 1;
LABEL_30:

  return v29;
}

- (double)requestTimeFromTimed
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  TMGetReferenceTime();
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    unint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v13;
    _os_log_error_impl(&dword_25B6E0000, v3, OS_LOG_TYPE_ERROR, "%@,%@,TMGetReferenceTime returned invalid time, using time from CFAbsoluteTimeGetCurrent", buf, 0x16u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    os_signpost_id_t v7 = NSStringFromSelector(a2);
    id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:Current];
    id v9 = [v8 stringFromDate];
    *(_DWORD *)long long buf = 138413058;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    double v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%@,%@,referenceTime:%@,referenceTimeUnc:%f", buf, 0x2Au);
  }
  return Current;
}

- (void)submitInitializationAnalyticsEventWithError:(id)a3 conversation:(id)a4 duration:(double)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  id v10 = [NSNumber numberWithDouble:a5];
  [v9 setObject:v10 forKeyedSubscript:@"initializationDuration"];

  if (v7)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    [v9 setObject:v11 forKeyedSubscript:@"errorCodeEnum"];

    uint64_t v12 = MEMORY[0x263EFFA80];
  }
  else
  {
    uint64_t v12 = MEMORY[0x263EFFA88];
  }
  [v9 setObject:v12 forKeyedSubscript:@"success"];
  unint64_t v13 = NSNumber;
  id v14 = [v8 receiverHandles];

  __int16 v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  [v9 setObject:v15 forKeyedSubscript:@"numRecepients"];

  id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    id v18 = "-[SMSafetyMonitorManager submitInitializationAnalyticsEventWithError:conversation:duration:]";
    __int16 v19 = 2112;
    double v20 = @"com.apple.SafetyMonitor.initiator.initializationResult";
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_INFO, "%s, event name, %@, event, %@", (uint8_t *)&v17, 0x20u);
  }

  AnalyticsSendEvent();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (void)setRestorationIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SMHeartbeatTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (id)initiatorSafetyCacheHandler
{
  return self->_initiatorSafetyCacheHandler;
}

- (void)setInitiatorSafetyCacheHandler:(id)a3
{
}

- (id)sessionStateHandler
{
  return self->_sessionStateHandler;
}

- (void)setSessionStateHandler:(id)a3
{
}

- (id)localSessionStateHandler
{
  return self->_localSessionStateHandler;
}

- (void)setLocalSessionStateHandler:(id)a3
{
}

- (id)receiverSessionStatusHandler
{
  return self->_receiverSessionStatusHandler;
}

- (void)setReceiverSessionStatusHandler:(id)a3
{
}

- (id)receiverSafetyCacheHandler
{
  return self->_receiverSafetyCacheHandler;
}

- (void)setReceiverSafetyCacheHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiverSafetyCacheHandler, 0);
  objc_storeStrong(&self->_receiverSessionStatusHandler, 0);
  objc_storeStrong(&self->_localSessionStateHandler, 0);
  objc_storeStrong(&self->_sessionStateHandler, 0);
  objc_storeStrong(&self->_initiatorSafetyCacheHandler, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end