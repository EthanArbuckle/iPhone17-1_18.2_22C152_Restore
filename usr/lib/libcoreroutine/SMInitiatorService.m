@interface SMInitiatorService
+ (int64_t)periodicPurgePolicy;
- (BOOL)_hasSetupObjectsDependentOnPersistenceStack;
- (BOOL)fetchAllZonesFromContainerInProgress;
- (BOOL)fetchAllZonesRetried;
- (BOOL)frequentSingleShotFetchAllZonesInProgress;
- (BOOL)sessionManagerBootstrapped;
- (BOOL)sessionsLoadedFromDisk;
- (NSHashTable)observers;
- (NSMutableArray)cacheManagerArray;
- (NSTimer)workoutSessionEndBufferTimerAlarm;
- (RTAuthorizationManager)authorizationManager;
- (RTBatteryManager)batteryManager;
- (RTBiomeManager)biomeManager;
- (RTContactsManager)contactsManager;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTHealthKitManager)healthKitManager;
- (RTInvocationDispatcher)dispatcher;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationAwarenessManager)locationAwarenessManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTNetworkOfInterestManager)networkOfInterestManager;
- (RTPlatform)platform;
- (RTStarkManager)starkManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTWatchWristStateManager)wristStateManager;
- (RTXPCActivityManager)xpcActivityManager;
- (SMActiveSessionZone)activeSessionDetailsZone;
- (SMAppDeletionManager)appDeletionManager;
- (SMCMNoMovementMonitor)noMovementMonitor;
- (SMDeviceConfigurationChecker)deviceConfigurationChecker;
- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 messagingService:(id)a8 safetyCacheStore:(id)a9 sessionStore:(id)a10 dataProtectionManager:(id)a11 batteryManager:(id)a12 xpcActivityManager:(id)a13 networkOfInterestManager:(id)a14 authorizationManager:(id)a15 wristStateManager:(id)a16 vehicleLocationProvider:(id)a17 starkManager:(id)a18 suggestionsManager:(id)a19 suggestionsHelper:(id)a20 learnedLocationManager:(id)a21 healthKitManager:(id)a22 deviceConfigurationChecker:(id)a23 noMovementMonitor:(id)a24 biomeManager:(id)a25 appDeletionManager:(id)a26;
- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 sessionManager:(id)a8 sessionMonitor:(id)a9 messagingService:(id)a10 safetyCacheStore:(id)a11 sessionStore:(id)a12 dataProtectionManager:(id)a13 batteryManager:(id)a14 xpcActivityManager:(id)a15 networkOfInterestManager:(id)a16 authorizationManager:(id)a17 wristStateManager:(id)a18 vehicleLocationProvider:(id)a19 starkManager:(id)a20 suggestionsManager:(id)a21 suggestionsHelper:(id)a22 learnedLocationManager:(id)a23 healthKitManager:(id)a24 deviceConfigurationChecker:(id)a25 noMovementMonitor:(id)a26 biomeManager:(id)a27 appDeletionManager:(id)a28;
- (SMInitiatorSessionInitializationRequest)pendingInitializationRequest;
- (SMMessagingService)messagingService;
- (SMSafetyCacheStore)safetyCacheStore;
- (SMSessionManager)sessionManager;
- (SMSessionMetricManager)sessionMetricManager;
- (SMSessionMonitor)sessionMonitor;
- (SMSessionReceiptZone)sessionReceiptZone;
- (SMSessionStore)sessionStore;
- (SMSuggestionsHelper)suggestionsHelper;
- (SMSuggestionsManager)suggestionsManager;
- (SMWatchdog)watchdog;
- (id)_createInitiatorCacheManagerForSessionID:(id)a3 conversation:(id)a4;
- (id)convertEligibilityToSMErrorWithInitiator:(int64_t)a3 receiver:(int64_t)a4;
- (id)getCacheManagerForSessionID:(id)a3;
- (id)invocationError;
- (int64_t)convertInitiatorEligibilityToSMError:(int64_t)a3;
- (int64_t)convertReceiverEligibilityToSMError:(int64_t)a3;
- (unint64_t)safetyCacheStoreAvailability;
- (unint64_t)sessionStoreAvailability;
- (void)_cancelInitializationForSessionID:(id)a3 handler:(id)a4;
- (void)_cancelInitializationWithHandler:(id)a3;
- (void)_endSessionEarlyIfNecessaryWithConfiguration:(id)a3;
- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)_fetchAllZonesFromContainerSynchronizerWithHandler:(id)a3;
- (void)_fetchAllZonesFromContainerWithHandler:(id)a3;
- (void)_fetchCurrentLocalSessionStateWithHandler:(id)a3;
- (void)_fetchCurrentSessionStateWithHandler:(id)a3;
- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3;
- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3;
- (void)_fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)_fetchSOSReceiversWithCompletion:(id)a3;
- (void)_fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4;
- (void)_handoffSessionForSessionID:(id)a3 handler:(id)a4;
- (void)_initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)_initializeSessionReceiptZone;
- (void)_initializeSessionWithConversation:(id)a3 handler:(id)a4;
- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)_onBecomingActiveDevice:(id)a3;
- (void)_onBecomingNonActiveDevice:(id)a3;
- (void)_onDeletedConversation:(id)a3;
- (void)_onDeletedMessage:(id)a3;
- (void)_onMessageReceived:(id)a3;
- (void)_onNearbyEffectivePairedDeviceChangedNotification:(id)a3;
- (void)_onSafetyCacheStoreNotification:(id)a3;
- (void)_onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)_onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)_onSessionStartMessageSendResult:(id)a3;
- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)_onSessionStoreNotification:(id)a3;
- (void)_onWorkoutPause;
- (void)_onWorkoutResume;
- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)_promptSafeArrivalWithContext:(id)a3 handler:(id)a4;
- (void)_promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4;
- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)_purgePredating:(id)a3 completion:(id)a4;
- (void)_respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6;
- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)_sendHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)_sendSafetyCacheForSessionID:(id)a3 handler:(id)a4;
- (void)_sendSessionStartMessageWithInvitationTokenMap:(id)a3;
- (void)_setup;
- (void)_setupCacheManagersWithHandler:(id)a3;
- (void)_setupOncePersistenceStackAvailable;
- (void)_setupSessionManager;
- (void)_setupSessionMonitor;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startFrequentSingleShotFetchAllZonesActivity;
- (void)_startInfrequentPeriodicFetchAllZonesActivity;
- (void)_startInitializationProcess;
- (void)_startSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)_stopFrequentSingleShotFetchAllZonesActivity;
- (void)addObserver:(id)a3;
- (void)addObserverForSessionManager:(id)a3;
- (void)cacheManagerCleanedUpForSessionID:(id)a3;
- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4;
- (void)cancelInitializationWithHandler:(id)a3;
- (void)checkAndDeleteKey:(id)a3 forIdentifier:(id)a4;
- (void)dealloc;
- (void)deleteAllStoredDefaults;
- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5;
- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3;
- (void)fetchCurrentSessionStateWithHandler:(id)a3;
- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3;
- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3;
- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)fetchSOSReceiversWithCompletion:(id)a3;
- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4;
- (void)handleSessionStateForNonActiveSessions:(id)a3;
- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4;
- (void)iMessageGroupDisplayNameChangedFor:(id)a3;
- (void)iMessageGroupMembershipChangedFor:(id)a3;
- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4;
- (void)kickedFromIMessageGroupWith:(id)a3;
- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4;
- (void)notifyObserversSafetyCacheDidUpdateForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7;
- (void)onBecomingActiveDevice:(id)a3;
- (void)onBecomingNonActiveDevice:(id)a3;
- (void)onDeletedConversation:(id)a3;
- (void)onDeletedMessage:(id)a3;
- (void)onHealthKitManagerNotification:(id)a3;
- (void)onMessageReceived:(id)a3;
- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3;
- (void)onSafetyCacheStoreNotification:(id)a3;
- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStartMessageSendResult:(id)a3;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStoreNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4;
- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4;
- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4;
- (void)receivedEmergencyContactsNotifiedSyncMessage:(id)a3;
- (void)receivedKeyReleaseInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedResponseToTriggerPromptRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionConfigurationUpdateRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionEndRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionStartInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionStateUpdateReqMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionSyncMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionTypeKeyRelease:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)removeObserver:(id)a3;
- (void)removeObserverForSessionManager:(id)a3;
- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6;
- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5;
- (void)scheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4;
- (void)scheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5;
- (void)scheduledSendMessageSent:(id)a3;
- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4;
- (void)setActiveSessionDetailsZone:(id)a3;
- (void)setAppDeletionManager:(id)a3;
- (void)setBiomeManager:(id)a3;
- (void)setCacheManagerArray:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setFetchAllZonesFromContainerInProgress:(BOOL)a3;
- (void)setFetchAllZonesRetried:(BOOL)a3;
- (void)setFrequentSingleShotFetchAllZonesInProgress:(BOOL)a3;
- (void)setLocationAwarenessManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setNoMovementMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPendingInitializationRequest:(id)a3;
- (void)setSafetyCacheStoreAvailability:(unint64_t)a3;
- (void)setSessionManagerBootstrapped:(BOOL)a3;
- (void)setSessionReceiptZone:(id)a3;
- (void)setSessionStoreAvailability:(unint64_t)a3;
- (void)setSessionsLoadedFromDisk:(BOOL)a3;
- (void)setWatchdog:(id)a3;
- (void)setWorkoutSessionEndBufferTimerAlarm:(id)a3;
- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4;
@end

@implementation SMInitiatorService

- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 sessionManager:(id)a8 sessionMonitor:(id)a9 messagingService:(id)a10 safetyCacheStore:(id)a11 sessionStore:(id)a12 dataProtectionManager:(id)a13 batteryManager:(id)a14 xpcActivityManager:(id)a15 networkOfInterestManager:(id)a16 authorizationManager:(id)a17 wristStateManager:(id)a18 vehicleLocationProvider:(id)a19 starkManager:(id)a20 suggestionsManager:(id)a21 suggestionsHelper:(id)a22 learnedLocationManager:(id)a23 healthKitManager:(id)a24 deviceConfigurationChecker:(id)a25 noMovementMonitor:(id)a26 biomeManager:(id)a27 appDeletionManager:(id)a28
{
  id v107 = a3;
  id v106 = a4;
  id v105 = a5;
  id v104 = a6;
  id v103 = a7;
  id v79 = a8;
  id v89 = a8;
  id v78 = a9;
  id v88 = a9;
  id v102 = a10;
  id v101 = a11;
  id v100 = a12;
  id v86 = a13;
  id v85 = a14;
  id v84 = a15;
  id v99 = a16;
  id v98 = a17;
  id v83 = a18;
  id v82 = a19;
  id v97 = a20;
  id v96 = a21;
  id v95 = a22;
  id v94 = a23;
  id v93 = a24;
  id v92 = a25;
  id v91 = a26;
  id v90 = a27;
  id v33 = a28;
  v87 = v33;
  if (v107)
  {
    if (v106)
    {
      if (v105)
      {
        if (v104)
        {
          if (v103)
          {
            if (v102)
            {
              if (v101)
              {
                if (v100)
                {
                  if (v99)
                  {
                    if (v98)
                    {
                      if (v97)
                      {
                        if (v96)
                        {
                          if (v95)
                          {
                            if (v94)
                            {
                              if (v93)
                              {
                                if (v92)
                                {
                                  if (v91)
                                  {
                                    if (v90)
                                    {
                                      if (v33)
                                      {
                                        v108.receiver = self;
                                        v108.super_class = (Class)SMInitiatorService;
                                        v34 = [(RTNotifier *)&v108 init];
                                        v35 = v34;
                                        if (v34)
                                        {
                                          objc_storeStrong((id *)&v34->_defaultsManager, a3);
                                          objc_storeStrong((id *)&v35->_contactsManager, a4);
                                          objc_storeStrong((id *)&v35->_locationManager, a5);
                                          objc_storeStrong((id *)&v35->_motionActivityManager, a6);
                                          objc_storeStrong((id *)&v35->_platform, a7);
                                          uint64_t v36 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
                                          observers = v35->_observers;
                                          v35->_observers = (NSHashTable *)v36;

                                          objc_storeStrong((id *)&v35->_safetyCacheStore, a11);
                                          v35->_safetyCacheStoreAvailability = 0;
                                          objc_storeStrong((id *)&v35->_sessionStore, a12);
                                          v35->_sessionStoreAvailability = 0;
                                          objc_storeStrong((id *)&v35->_dataProtectionManager, a13);
                                          objc_storeStrong((id *)&v35->_xpcActivityManager, a15);
                                          objc_storeStrong((id *)&v35->_batteryManager, a14);
                                          uint64_t v38 = objc_opt_new();
                                          cacheManagerArray = v35->_cacheManagerArray;
                                          v35->_cacheManagerArray = (NSMutableArray *)v38;

                                          objc_storeStrong((id *)&v35->_authorizationManager, a17);
                                          objc_storeStrong((id *)&v35->_wristStateManager, a18);
                                          objc_storeStrong((id *)&v35->_vehicleLocationProvider, a19);
                                          objc_storeStrong((id *)&v35->_starkManager, a20);
                                          objc_storeStrong((id *)&v35->_suggestionsManager, a21);
                                          objc_storeStrong((id *)&v35->_suggestionsHelper, a22);
                                          objc_storeStrong((id *)&v35->_learnedLocationManager, a23);
                                          objc_storeStrong((id *)&v35->_healthKitManager, a24);
                                          objc_storeStrong((id *)&v35->_deviceConfigurationChecker, a25);
                                          v40 = [RTInvocationDispatcher alloc];
                                          v41 = [(RTNotifier *)v35 queue];
                                          uint64_t v42 = [(RTInvocationDispatcher *)v40 initWithQueue:v41];
                                          dispatcher = v35->_dispatcher;
                                          v35->_dispatcher = (RTInvocationDispatcher *)v42;

                                          objc_storeStrong((id *)&v35->_noMovementMonitor, a26);
                                          objc_storeStrong((id *)&v35->_biomeManager, a27);
                                          objc_storeStrong((id *)&v35->_appDeletionManager, a28);
                                          if (v89)
                                          {
                                            objc_storeStrong((id *)&v35->_sessionManager, v79);
                                            -[SMSessionManager addObserver:](v35->_sessionManager, "addObserver:", v35, a9);
                                          }
                                          if (v88)
                                          {
                                            p_sessionMonitor = (id *)&v35->_sessionMonitor;
                                            objc_storeStrong((id *)&v35->_sessionMonitor, v78);
                                            if (v89)
                                            {
                                              [*p_sessionMonitor setSessionManagerDelegate:v35->_sessionManager];
                                              [(SMSessionManager *)v35->_sessionManager addObserver:*p_sessionMonitor];
                                            }
                                          }
                                          objc_storeStrong((id *)&v35->_networkOfInterestManager, a16);
                                          p_messagingService = (id *)&v35->_messagingService;
                                          objc_storeStrong((id *)&v35->_messagingService, a10);
                                          messagingService = v35->_messagingService;
                                          +[RTNotification notificationName];
                                          v48 = v47 = v35;
                                          [(RTNotifier *)messagingService addObserver:v35 selector:sel_onSessionStartMessageSendResult_ name:v48];

                                          v49 = v35->_messagingService;
                                          v50 = +[RTNotification notificationName];
                                          [(RTNotifier *)v49 addObserver:v35 selector:sel_onMessageReceived_ name:v50];

                                          v51 = v35->_messagingService;
                                          v52 = +[RTNotification notificationName];
                                          [(RTNotifier *)v51 addObserver:v35 selector:sel_onNearbyEffectivePairedDeviceChangedNotification_ name:v52];

                                          v53 = v35->_messagingService;
                                          v54 = +[RTNotification notificationName];
                                          [(RTNotifier *)v53 addObserver:v35 selector:sel_onDeletedMessage_ name:v54];

                                          v55 = v35->_messagingService;
                                          v56 = +[RTNotification notificationName];
                                          [(RTNotifier *)v55 addObserver:v35 selector:sel_onDeletedConversation_ name:v56];

                                          v57 = [SMSessionMetricManager alloc];
                                          v58 = [(SMInitiatorService *)v35 defaultsManager];
                                          v59 = [(SMInitiatorService *)v35 learnedLocationManager];
                                          v60 = [(SMInitiatorService *)v35 sessionStore];
                                          v61 = [(SMInitiatorService *)v47 locationManager];
                                          v62 = [*p_messagingService deviceIdentifier];
                                          uint64_t v63 = [(SMSessionMetricManager *)v57 initWithDefaultsManager:v58 learnedLocationManager:v59 sessionStore:v60 locationManager:v61 currentDeviceIdentifier:v62];
                                          sessionMetricManager = v47->_sessionMetricManager;
                                          v47->_sessionMetricManager = (SMSessionMetricManager *)v63;

                                          v35 = v47;
                                          [(RTService *)v47 setup];
                                        }
                                        v65 = v35;
                                        v66 = v65;
                                        v67 = v107;
                                        v69 = v85;
                                        v68 = v86;
                                        v71 = v83;
                                        v70 = v84;
                                        v72 = v82;
                                        goto LABEL_69;
                                      }
                                      v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                                      {
                                        *(_WORD *)buf = 0;
                                        v76 = "Invalid parameter not satisfying: appDeletionManager";
                                        goto LABEL_67;
                                      }
LABEL_68:

                                      v66 = 0;
                                      v67 = v107;
                                      v69 = v85;
                                      v68 = v86;
                                      v71 = v83;
                                      v70 = v84;
                                      v65 = self;
                                      v72 = v82;
LABEL_69:
                                      v73 = v106;
                                      goto LABEL_70;
                                    }
                                    v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_68;
                                    }
                                    *(_WORD *)buf = 0;
                                    v76 = "Invalid parameter not satisfying: biomeManager";
                                  }
                                  else
                                  {
                                    v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_68;
                                    }
                                    *(_WORD *)buf = 0;
                                    v76 = "Invalid parameter not satisfying: noMovementMonitor";
                                  }
                                }
                                else
                                {
                                  v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                  if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                                    goto LABEL_68;
                                  }
                                  *(_WORD *)buf = 0;
                                  v76 = "Invalid parameter not satisfying: deviceConfigurationChecker";
                                }
                              }
                              else
                              {
                                v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                                if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_68;
                                }
                                *(_WORD *)buf = 0;
                                v76 = "Invalid parameter not satisfying: healthKitManager";
                              }
                            }
                            else
                            {
                              v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                              if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_68;
                              }
                              *(_WORD *)buf = 0;
                              v76 = "Invalid parameter not satisfying: learnedLocationManager";
                            }
                          }
                          else
                          {
                            v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                            if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_68;
                            }
                            *(_WORD *)buf = 0;
                            v76 = "Invalid parameter not satisfying: suggestionsHelper";
                          }
                        }
                        else
                        {
                          v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                          if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_68;
                          }
                          *(_WORD *)buf = 0;
                          v76 = "Invalid parameter not satisfying: suggestionsManager";
                        }
                      }
                      else
                      {
                        v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_68;
                        }
                        *(_WORD *)buf = 0;
                        v76 = "Invalid parameter not satisfying: starkManager";
                      }
                    }
                    else
                    {
                      v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_68;
                      }
                      *(_WORD *)buf = 0;
                      v76 = "Invalid parameter not satisfying: authorizationManager";
                    }
                  }
                  else
                  {
                    v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_68;
                    }
                    *(_WORD *)buf = 0;
                    v76 = "Invalid parameter not satisfying: networkOfInterestManager";
                  }
                }
                else
                {
                  v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_68;
                  }
                  *(_WORD *)buf = 0;
                  v76 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_68;
                }
                *(_WORD *)buf = 0;
                v76 = "Invalid parameter not satisfying: safetyCacheStore";
              }
            }
            else
            {
              v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                goto LABEL_68;
              }
              *(_WORD *)buf = 0;
              v76 = "Invalid parameter not satisfying: messagingService";
            }
          }
          else
          {
            v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
              goto LABEL_68;
            }
            *(_WORD *)buf = 0;
            v76 = "Invalid parameter not satisfying: platform";
          }
        }
        else
        {
          v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
          *(_WORD *)buf = 0;
          v76 = "Invalid parameter not satisfying: motionActivityManager";
        }
      }
      else
      {
        v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        v76 = "Invalid parameter not satisfying: locationManager";
      }
    }
    else
    {
      v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v76 = "Invalid parameter not satisfying: contactsManager";
    }
LABEL_67:
    _os_log_error_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_68;
  }
  v73 = v106;
  v74 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
  }

  v66 = 0;
  v67 = 0;
  v69 = v85;
  v68 = v86;
  v71 = v83;
  v70 = v84;
  v65 = self;
  v72 = v82;
LABEL_70:

  return v66;
}

- (SMInitiatorService)initWithDefaultsManager:(id)a3 contactsManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 messagingService:(id)a8 safetyCacheStore:(id)a9 sessionStore:(id)a10 dataProtectionManager:(id)a11 batteryManager:(id)a12 xpcActivityManager:(id)a13 networkOfInterestManager:(id)a14 authorizationManager:(id)a15 wristStateManager:(id)a16 vehicleLocationProvider:(id)a17 starkManager:(id)a18 suggestionsManager:(id)a19 suggestionsHelper:(id)a20 learnedLocationManager:(id)a21 healthKitManager:(id)a22 deviceConfigurationChecker:(id)a23 noMovementMonitor:(id)a24 biomeManager:(id)a25 appDeletionManager:(id)a26
{
  return -[SMInitiatorService initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:sessionManager:sessionMonitor:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:appDeletionManager:](self, "initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:sessionManager:sessionMonitor:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:appDeletionManager:", a3, a4, a5, a6, a7, 0, 0, a8, a9, a10, a11, a12, a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

- (void)_initializeSessionReceiptZone
{
  v4 = [SMSessionReceiptZone alloc];
  v5 = [(RTNotifier *)self queue];
  v6 = [(SMSessionReceiptZone *)v4 initWithQueue:v5];
  sessionReceiptZone = self->_sessionReceiptZone;
  self->_sessionReceiptZone = v6;

  [(SMInitiatorService *)self _startInfrequentPeriodicFetchAllZonesActivity];
  v8 = [(SMInitiatorService *)self defaultsManager];
  v9 = [v8 objectForKey:@"RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"];

  if (v9 && ([v9 BOOLValue] & 1) != 0)
  {
    [(SMInitiatorService *)self _stopFrequentSingleShotFetchAllZonesActivity];
  }
  else
  {
    [(SMInitiatorService *)self _startFrequentSingleShotFetchAllZonesActivity];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SMInitiatorService__initializeSessionReceiptZone__block_invoke;
    v10[3] = &unk_1E6B96B48;
    v10[4] = self;
    v10[5] = a2;
    [(SMInitiatorService *)self _fetchAllZonesFromContainerSynchronizerWithHandler:v10];
  }
}

void __51__SMInitiatorService__initializeSessionReceiptZone__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v10 = 138413058;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler returned error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);
  }
}

- (void)_setup
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v4 = _os_feature_enabled_impl();
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      int v20 = 138412546;
      v21 = v8;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@", (uint8_t *)&v20, 0x16u);
    }
    sessionStore = self->_sessionStore;
    v11 = +[RTNotification notificationName];
    [(RTNotifier *)sessionStore addObserver:self selector:sel_onSessionStoreNotification_ name:v11];

    safetyCacheStore = self->_safetyCacheStore;
    v13 = +[RTNotification notificationName];
    [(RTNotifier *)safetyCacheStore addObserver:self selector:sel_onSafetyCacheStoreNotification_ name:v13];

    if ([MEMORY[0x1E4F99880] zelkovaWorkoutEnabled])
    {
      healthKitManager = self->_healthKitManager;
      id v15 = +[RTNotification notificationName];
      [(RTNotifier *)healthKitManager addObserver:self selector:sel_onHealthKitManagerNotification_ name:v15];
    }
    [MEMORY[0x1E4F998E0] migrateIfNeeded];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SiriSettingsLockScreenPrefsDidChange, (CFStringRef)*MEMORY[0x1E4F99B88], 0, (CFNotificationSuspensionBehavior)0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      v19 = NSStringFromSelector(a2);
      int v20 = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F99B88], 0);
  v4.receiver = self;
  v4.super_class = (Class)SMInitiatorService;
  [(SMInitiatorService *)&v4 dealloc];
}

- (void)_setupOncePersistenceStackAvailable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      sessionManager = self->_sessionManager;
      sessionMonitor = self->_sessionMonitor;
      uint64_t v6 = [(NSMutableArray *)self->_cacheManagerArray count];
      *(_DWORD *)buf = 136315906;
      __int16 v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
      __int16 v13 = 2112;
      __int16 v14 = sessionManager;
      __int16 v15 = 2112;
      __int16 v16 = sessionMonitor;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, has already run. sessionManager, %@, sessionMonitor, %@, cacheManagerArray Count, %lu", buf, 0x2Au);
    }
LABEL_11:

    return;
  }
  if ([(SMInitiatorService *)self sessionStoreAvailability] != 2
    || [(SMInitiatorService *)self safetyCacheStoreAvailability] != 2)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = +[RTStore availabilityToString:[(SMInitiatorService *)self sessionStoreAvailability]];
      v9 = +[RTStore availabilityToString:[(SMInitiatorService *)self safetyCacheStoreAvailability]];
      *(_DWORD *)buf = 136315650;
      __int16 v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
      __int16 v13 = 2112;
      __int16 v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "%s, Deferring - Both stores are not available. Session Store, %@, Safety Cache Store, %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]";
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%s, Setting up session monitor, cache managers, and session manager", buf, 0xCu);
  }

  [(SMInitiatorService *)self _setupSessionMonitor];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke;
  v10[3] = &unk_1E6B90840;
  v10[4] = self;
  [(SMInitiatorService *)self _setupCacheManagersWithHandler:v10];
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [SMWatchdog alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 88);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_2;
  __int16 v12 = &unk_1E6B96B70;
  id v13 = v3;
  uint64_t v14 = v5;
  id v7 = v3;
  v8 = [(SMWatchdog *)v4 initWithDefaultsManager:v6 handler:&v9];
  [*(id *)(a1 + 32) setWatchdog:v8, v9, v10, v11, v12];

  [*(id *)(a1 + 32) _setupSessionManager];
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [v5 configuration];
    int v16 = 136315650;
    __int16 v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke_2";
    __int16 v18 = 2112;
    id v19 = v14;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%s, Watch dog fired with state, %@, error, %@", (uint8_t *)&v16, 0x20u);
  }
  if (!*(void *)(a1 + 32))
  {
    if ([v5 sessionState] == 10 || objc_msgSend(v5, "sessionState") == 11)
    {
      v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v5 configuration];
      uint64_t v10 = [v9 sessionID];
      [v8 cancelInitializationForSessionID:v10 handler:&__block_literal_global_58];
    }
    else
    {
      if ([v5 sessionState] == 12)
      {
        v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          __int16 v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, transitioning to not active", (uint8_t *)&v16, 0xCu);
        }

        uint64_t v9 = [*(id *)(a1 + 40) sessionManager];
        __int16 v12 = [v5 configuration];
        id v13 = [v12 sessionID];
        [v9 terminateSessionWithSessionID:v13];

        goto LABEL_8;
      }
      if ([v5 isPromptState])
      {
        uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          int v16 = 136315394;
          __int16 v17 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
          __int16 v18 = 2112;
          id v19 = v5;
          _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "%s, Watch dog fired, logging fault for prompt state, %@", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_8;
      }
      __int16 v15 = *(void **)(a1 + 40);
      uint64_t v9 = [v5 configuration];
      uint64_t v10 = [v9 sessionID];
      [v15 endSessionForSessionID:v10 reason:6 handler:&__block_literal_global_141];
    }

LABEL_8:
  }
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, cancelled initialization, error %@", (uint8_t *)&v4, 0x16u);
  }
}

void __57__SMInitiatorService__setupOncePersistenceStackAvailable__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SMInitiatorService _setupOncePersistenceStackAvailable]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "%s, Watch dog fired, cancelled session, error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_setupSessionMonitor
{
  self->_sessionMonitor = [[SMSessionMonitor alloc] initWithDefaultsManager:self->_defaultsManager dataProtectionManager:self->_dataProtectionManager healthKitManager:self->_healthKitManager locationManager:self->_locationManager motionActivityManager:self->_motionActivityManager platform:self->_platform sessionMetricManager:self->_sessionMetricManager sessionStore:self->_sessionStore wristStateManager:self->_wristStateManager noMovementMonitor:self->_noMovementMonitor];

  MEMORY[0x1F41817F8]();
}

- (void)_setupSessionManager
{
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v16 addObject:self];
  id v3 = [(SMInitiatorService *)self sessionMonitor];

  if (v3)
  {
    int v4 = [(SMInitiatorService *)self sessionMonitor];
    [v16 addObject:v4];
  }
  id v5 = [(SMInitiatorService *)self watchdog];

  if (v5)
  {
    __int16 v6 = [(SMInitiatorService *)self watchdog];
    [v16 addObject:v6];
  }
  id v7 = [(SMInitiatorService *)self suggestionsManager];

  if (v7)
  {
    uint64_t v8 = [(SMInitiatorService *)self suggestionsManager];
    [v16 addObject:v8];
  }
  uint64_t v9 = [(SMInitiatorService *)self sessionMetricManager];

  if (v9)
  {
    uint64_t v10 = [(SMInitiatorService *)self sessionMetricManager];
    [v16 addObject:v10];
  }
  v11 = [SMCarPlayAlertManager alloc];
  __int16 v12 = [(RTNotifier *)self queue];
  id v13 = [(SMCarPlayAlertManager *)v11 initWithQueue:v12 defaultsManager:self->_defaultsManager contactsManager:self->_contactsManager starkManager:self->_starkManager];

  uint64_t v14 = [[SMSessionManager alloc] initWithAuthorizationManager:self->_authorizationManager biomeManager:self->_biomeManager contactsManager:self->_contactsManager defaultsManager:self->_defaultsManager locationManager:self->_locationManager platform:self->_platform sessionMetricManager:self->_sessionMetricManager sessionStore:self->_sessionStore messagingService:self->_messagingService carPlayAlertManager:v13 observers:v16 activeSessionDetailsDelegate:self->_activeSessionDetailsZone wristStateManager:self->_wristStateManager appDeletionManager:self->_appDeletionManager];
  sessionManager = self->_sessionManager;
  self->_sessionManager = v14;

  [(SMSessionMonitor *)self->_sessionMonitor setSessionManagerDelegate:self->_sessionManager];
}

- (void)_setupCacheManagersWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SMInitiatorService *)self _initializeSessionReceiptZone];
  __int16 v6 = [SMActiveSessionZone alloc];
  id v7 = [(RTNotifier *)self queue];
  uint64_t v8 = [(SMInitiatorService *)self defaultsManager];
  uint64_t v9 = [(SMActiveSessionZone *)v6 initWithQueue:v7 defaultsManager:v8];
  activeSessionDetailsZone = self->_activeSessionDetailsZone;
  self->_activeSessionDetailsZone = v9;

  v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = NSStringFromSelector(a2);
    __int16 v15 = [(SMActiveSessionZone *)self->_activeSessionDetailsZone getLatestActiveSessionDetails];
    *(_DWORD *)buf = 138412802;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, _activeSessionDetailsZone.latestActiveSessionDetails %@", buf, 0x20u);
  }
  safetyCacheStore = self->_safetyCacheStore;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke;
  v18[3] = &unk_1E6B91468;
  id v19 = v5;
  SEL v20 = a2;
  v18[4] = self;
  id v17 = v5;
  [(SMSafetyCacheStore *)safetyCacheStore fetchInitiatorContactsWithHandler:v18];
}

void __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke_2;
  block[3] = &unk_1E6B91C48;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  id v16 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

uint64_t __53__SMInitiatorService__setupCacheManagersWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = NSStringFromSelector(*(SEL *)(a1 + 64));
      v30 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v50 = v28;
      __int16 v51 = 2112;
      v52 = v29;
      __int16 v53 = 2112;
      v54 = v30;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch receiver contacts with error %@", buf, 0x20u);
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      int v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v45 != v32) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            uint64_t v8 = [v6 sessionUUID];
            id v9 = (objc_class *)objc_opt_class();
            id v10 = NSStringFromClass(v9);
            id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
            *(_DWORD *)buf = 138412802;
            v50 = v8;
            __int16 v51 = 2112;
            v52 = v10;
            __int16 v53 = 2112;
            v54 = v11;
            _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded initiator contact from disk", buf, 0x20u);
          }
          v43 = [SMInitiatorCacheManager alloc];
          long long v12 = *(void **)(a1 + 40);
          v41 = v6;
          uint64_t v42 = v12[18];
          uint64_t v39 = v12[11];
          uint64_t v40 = v12[20];
          uint64_t v38 = v12[5];
          v37 = [v12 queue];
          id v13 = *(void **)(a1 + 40);
          uint64_t v35 = v13[24];
          uint64_t v36 = v13[23];
          uint64_t v34 = v13[15];
          uint64_t v14 = v13[16];
          uint64_t v15 = v13[25];
          uint64_t v16 = v13[30];
          uint64_t v17 = v13[31];
          uint64_t v18 = v13[38];
          id v19 = [v13 healthKitManager];
          SEL v20 = [*(id *)(a1 + 40) platform];
          id v21 = [*(id *)(a1 + 40) appDeletionManager];
          uint64_t v22 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:](v43, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:", v41, 1, v42, v40, v39, v38, v37, v36, v35, v34, v14, v15, v16, v17, v18,
                  v19,
                  v20,
                  v21);

          [(SMInitiatorCacheManager *)v22 setDelegate:*(void *)(a1 + 40)];
          __int16 v23 = [*(id *)(a1 + 40) cacheManagerArray];
          [v23 addObject:v22];
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v33);
    }

    [*(id *)(a1 + 40) setSessionsLoadedFromDisk:1];
    [*(id *)(a1 + 40) deleteAllStoredDefaults];
    uint64_t v24 = [*(id *)(a1 + 40) activeSessionDetailsZone];
    int v25 = [v24 isActiveSessionDetailsOutOfSync];

    if (v25)
    {
      v26 = [*(id *)(a1 + 40) activeSessionDetailsZone];
      [v26 updateActiveSessionDetailsFromCloudKitRecord];
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      int v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (BOOL)_hasSetupObjectsDependentOnPersistenceStack
{
  return self->_sessionManager && self->_sessionMonitor && self->_sessionManagerBootstrapped;
}

- (id)invocationError
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@, %@, failed invoking pending invocation - store did not become available", v5, v6];

  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v7;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F99A48];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  uint64_t v15 = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  long long v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];

  return v12;
}

- (void)deleteAllStoredDefaults
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = [(SMInitiatorService *)self defaultsManager];
  uint64_t v5 = *MEMORY[0x1E4F99AF8];
  id v6 = (void *)[v4 copyKeyListContainingString:*MEMORY[0x1E4F99AF8]];

  if (v6 && [v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [(SMInitiatorService *)self checkAndDeleteKey:v12, @"com.apple.routined.cacheMaintenance.periodic", (void)v16 forIdentifier];
          [(SMInitiatorService *)self checkAndDeleteKey:v12 forIdentifier:@"com.apple.routined.scheduleSend.cancelRetry"];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v5;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,nil stored defaults for %@, early return", buf, 0x20u);
    }
  }
}

- (void)checkAndDeleteKey:(id)a3 forIdentifier:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 containsString:v8])
  {
    uint64_t v9 = [v7 rangeOfString:v8];
    uint64_t v11 = v10;
    if ([v7 length] <= (unint64_t)(v9 + v10))
    {
      uint64_t v26 = [(SMInitiatorService *)self defaultsManager];
      [v26 setObject:0 forKey:v7];
    }
    else
    {
      aSelector = a2;
      id v29 = v8;
      uint64_t v12 = [v7 substringFromIndex:v9 + v11 + 1];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v28 = self;
      id v13 = [(SMInitiatorService *)self cacheManagerArray];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
LABEL_5:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [*(id *)(*((void *)&v30 + 1) + 8 * v17) initiatorContact];
          long long v19 = [v18 sessionUUID];
          SEL v20 = [v19 UUIDString];
          char v21 = [v20 isEqualToString:v12];

          if (v21) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v15) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          __int16 v23 = (objc_class *)objc_opt_class();
          uint64_t v24 = NSStringFromClass(v23);
          __int16 v25 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          uint64_t v35 = v24;
          __int16 v36 = 2112;
          v37 = v25;
          __int16 v38 = 2112;
          id v39 = v7;
          _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,deleted default for %@", buf, 0x20u);
        }
        id v13 = [(SMInitiatorService *)v28 defaultsManager];
        [v13 setObject:0 forKey:v7];
      }
      id v8 = v29;
    }
  }
}

- (void)addObserverForSessionManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SMInitiatorService_addObserverForSessionManager___block_invoke;
    block[3] = &unk_1E6B91220;
    void block[4] = self;
    id v9 = v5;
    SEL v10 = a2;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __51__SMInitiatorService_addObserverForSessionManager___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _hasSetupObjectsDependentOnPersistenceStack];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v9 = [v3 sessionManager];
    [v9 addObserver:*(void *)(a1 + 40)];
  }
  else
  {
    int v4 = [v3 dispatcher];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SMInitiatorService_addObserverForSessionManager___block_invoke_2;
    v10[3] = &unk_1E6B90BF0;
    id v5 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v5;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v4 enqueueBlock:v10, @"%@-%@", v7, v8 description];
  }
}

void __51__SMInitiatorService_addObserverForSessionManager___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  [v2 addObserver:*(void *)(a1 + 40)];
}

- (void)removeObserverForSessionManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SMInitiatorService_removeObserverForSessionManager___block_invoke;
    block[3] = &unk_1E6B91220;
    void block[4] = self;
    id v9 = v5;
    SEL v10 = a2;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __54__SMInitiatorService_removeObserverForSessionManager___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _hasSetupObjectsDependentOnPersistenceStack];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v9 = [v3 sessionManager];
    [v9 removeObserver:*(void *)(a1 + 40)];
  }
  else
  {
    int v4 = [v3 dispatcher];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SMInitiatorService_removeObserverForSessionManager___block_invoke_2;
    v10[3] = &unk_1E6B90BF0;
    id v5 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v5;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v4 enqueueBlock:v10, @"%@-%@", v7, v8 description];
  }
}

void __54__SMInitiatorService_removeObserverForSessionManager___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  [v2 removeObserver:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__SMInitiatorService_addObserver___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __34__SMInitiatorService_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__SMInitiatorService_removeObserver___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __37__SMInitiatorService_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)notifyObserversSafetyCacheDidUpdateForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    SEL v20 = [v28 UUIDString];
    char v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v35 = v19;
    __int16 v36 = 2112;
    v37 = v20;
    __int16 v38 = 2112;
    id v39 = v21;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,sessionID:%@,%@,sending safety cache update to observers", buf, 0x20u);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v22 = [(SMInitiatorService *)self observers];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * v26);
        if (objc_opt_respondsToSelector()) {
          [v27 onInitiatorSafetyCacheChangeForSessionID:v28 phoneCache:v13 watchCache:v14 cacheExpiryDate:v15 cacheReleaseDate:v16];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  SEL v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__SMInitiatorService_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __66__SMInitiatorService_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _purgePredating:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)_purgePredating:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = dispatch_group_create();
  SEL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  dispatch_group_enter(v9);
  id v11 = [(SMInitiatorService *)self sessionStore];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke;
  v57[3] = &unk_1E6B96B98;
  v57[4] = self;
  SEL v61 = a2;
  id v12 = v7;
  id v58 = v12;
  id v13 = v10;
  id v59 = v13;
  id v14 = v9;
  v60 = v14;
  [v11 deleteSessionsPredating:v12 handler:v57];

  dispatch_group_enter(v14);
  id v15 = [(SMInitiatorService *)self sessionStore];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_160;
  v52[3] = &unk_1E6B96B98;
  v52[4] = self;
  SEL v56 = a2;
  id v16 = v12;
  id v53 = v16;
  id v17 = v13;
  id v54 = v17;
  long long v18 = v14;
  uint64_t v55 = v18;
  [v15 deleteSessionMonitorStatesPredating:v16 handler:v52];

  dispatch_group_enter(v18);
  long long v19 = [(SMInitiatorService *)self sessionStore];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_162;
  v47[3] = &unk_1E6B96B98;
  v47[4] = self;
  SEL v51 = a2;
  id v20 = v16;
  id v48 = v20;
  id v21 = v17;
  id v49 = v21;
  uint64_t v22 = v18;
  v50 = v22;
  [v19 deleteTriggerDestinationStatesPredating:v20 handler:v47];

  dispatch_group_enter(v22);
  uint64_t v23 = [(SMInitiatorService *)self sessionStore];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_164;
  v42[3] = &unk_1E6B96B98;
  v42[4] = self;
  SEL v46 = a2;
  id v24 = v20;
  id v43 = v24;
  id v25 = v21;
  id v44 = v25;
  uint64_t v26 = v22;
  long long v45 = v26;
  [v23 deleteSMLocationMOPredating:v24 handler:v42];

  dispatch_group_enter(v26);
  uint64_t v27 = [(SMInitiatorService *)self sessionStore];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_166;
  v37[3] = &unk_1E6B96B98;
  SEL v41 = a2;
  v37[4] = self;
  id v38 = v24;
  id v28 = v25;
  id v39 = v28;
  uint64_t v40 = v26;
  long long v29 = v26;
  id v30 = v24;
  [v27 deleteSMWorkoutEventMOPredating:v30 handler:v37];

  long long v31 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_168;
  block[3] = &unk_1E6B90CE0;
  id v35 = v28;
  id v36 = v8;
  id v32 = v8;
  id v33 = v28;
  dispatch_group_notify(v29, v31, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2;
  block[3] = &unk_1E6B90F80;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, deleted sessions, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) addObject:];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_160(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_161;
  block[3] = &unk_1E6B90F80;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_161(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, deleted session monitor states, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) addObject:];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_162(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_163;
  block[3] = &unk_1E6B90F80;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_163(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, deleted triggerDestinations, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) addObject:];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_164(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_165;
  block[3] = &unk_1E6B90F80;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_165(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, deleted SMLocationMOs, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) addObject:];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__purgePredating_completion___block_invoke_2_167;
  block[3] = &unk_1E6B90F80;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__purgePredating_completion___block_invoke_2_167(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, deleted SMWorkoutEventMOs, predating, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) addObject:];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __49__SMInitiatorService__purgePredating_completion___block_invoke_168(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = _RTSafeArray();
    _RTMultiErrorCreate();
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

  return MEMORY[0x1F41817F8]();
}

- (id)getCacheManagerForSessionID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_cacheManagerArray;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        __int16 v10 = [v9 sessionUUID];
        int v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_createInitiatorCacheManagerForSessionID:(id)a3 conversation:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    __int16 v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v37 = v35;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    SEL v41 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@", buf, 0x20u);
  }
  uint64_t v10 = [(SMInitiatorService *)self getCacheManagerForSessionID:v35];
  if (v10)
  {
    int v11 = (SMInitiatorCacheManager *)v10;
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      long long v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v37 = v14;
      __int16 v38 = 2112;
      id v39 = v15;
      _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,cache manager already exists", buf, 0x16u);
    }
  }
  else
  {
    long long v31 = [SMInitiatorCacheManager alloc];
    id v33 = [(SMInitiatorService *)self safetyCacheStore];
    uint64_t v34 = [(SMInitiatorService *)self sessionStore];
    id v30 = [(SMInitiatorService *)self defaultsManager];
    long long v29 = [(SMInitiatorService *)self locationManager];
    id v28 = [(RTNotifier *)self queue];
    uint64_t v27 = [(SMInitiatorService *)self batteryManager];
    id v32 = [(SMInitiatorService *)self xpcActivityManager];
    uint64_t v26 = [(SMInitiatorService *)self messagingService];
    id v25 = [(SMInitiatorService *)self networkOfInterestManager];
    id v24 = [(SMInitiatorService *)self authorizationManager];
    uint64_t v23 = [(SMInitiatorService *)self wristStateManager];
    long long v16 = [(SMInitiatorService *)self vehicleLocationProvider];
    uint64_t v22 = [(SMInitiatorService *)self activeSessionDetailsZone];
    id v17 = [(SMInitiatorService *)self healthKitManager];
    uint64_t v18 = [(SMInitiatorService *)self platform];
    long long v19 = [(SMInitiatorService *)self appDeletionManager];
    int v11 = -[SMInitiatorCacheManager initWithSafetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:sessionID:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:](v31, "initWithSafetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:sessionID:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:", v33, v34, v30, v29, v28, v27, v32, v26, v25, v24, v35, v23, v16, v22, v17,
            v18,
            v19);

    [(SMInitiatorCacheManager *)v11 setDelegate:self];
    uint64_t v12 = [(SMInitiatorService *)self cacheManagerArray];
    [v12 addObject:v11];
  }

  id v20 = v11;

  return v20;
}

- (void)_startInitializationProcess
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMInitiatorService *)self pendingInitializationRequest];
  id v4 = [v3 sessionID];
  uint64_t v5 = [(SMInitiatorService *)self getCacheManagerForSessionID:v4];

  if (v5)
  {
    id v6 = [(SMInitiatorService *)self pendingInitializationRequest];
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[SMInitiatorService _startInitializationProcess]";
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%s, starting initialization sequence for request, %@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke;
    v18[3] = &unk_1E6B96C10;
    v18[4] = self;
    id v19 = v6;
    id v8 = v6;
    [v5 initializeSessionWithCompletion:v18];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [(SMInitiatorService *)self pendingInitializationRequest];
      id v17 = [v16 sessionID];
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[SMInitiatorService _startInitializationProcess]";
      __int16 v24 = 2112;
      id v25 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%s, failed to find InitiatorCacheManager for sessionID %@", buf, 0x16u);
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F99A48];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v12 = [NSString stringWithFormat:@"Couldn't find InitiatorCacheManager"];
    id v21 = v12;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v8 = (id)[v10 initWithDomain:v11 code:0 userInfo:v13];

    long long v14 = [(SMInitiatorService *)self pendingInitializationRequest];
    long long v15 = [v14 handler];
    ((void (**)(void, void, void, void, id))v15)[2](v15, 0, 0, 0, v8);

    [(SMInitiatorService *)self setPendingInitializationRequest:0];
  }
}

void __49__SMInitiatorService__startInitializationProcess__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  id v58 = a4;
  id v59 = a5;
  id v16 = a8;
  uint64_t v17 = [*(id *)(a1 + 32) pendingInitializationRequest];
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = (void *)v17;
  [*(id *)(a1 + 32) pendingInitializationRequest];
  uint64_t v20 = v19 = v14;
  [v20 sessionID];
  uint64_t v22 = v21 = v15;
  uint64_t v23 = [*(id *)(a1 + 40) sessionID];
  char v24 = [v22 isEqual:v23];

  id v15 = v21;
  id v14 = v19;

  if (v24)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [*(id *)(a1 + 32) pendingInitializationRequest];
      if (v59) {
        uint64_t v27 = @"YES";
      }
      else {
        uint64_t v27 = @"NO";
      }
      id v28 = initiatorEligiblityStatusToString();
      long long v29 = [MEMORY[0x1E4F99860] convertEligibilityTypeToString:a7];
      *(_DWORD *)buf = 136317186;
      v66 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      __int16 v67 = 2112;
      v68 = v26;
      __int16 v69 = 2112;
      id v70 = v19;
      __int16 v71 = 2112;
      id v72 = v21;
      __int16 v73 = 2112;
      id v74 = v58;
      __int16 v75 = 2112;
      v76 = v27;
      __int16 v77 = 2112;
      id v78 = v28;
      __int16 v79 = 2112;
      v80 = v29;
      __int16 v81 = 2112;
      id v82 = v16;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "%s, Session cacheManager initialization result for request, %@, allowReadToken, %@, safetyCacheKey, %@, scheduledSendGUID, %@, invitationTokens, %@, initiatorEligibility, %@, receiverEligibility, %@, error, %@", buf, 0x5Cu);

      id v15 = v21;
    }

    if (a6 == 1 && a7 == 1)
    {
      id v30 = *(void **)(a1 + 32);
      id v14 = v19;
      if (!v59 || v16)
      {
        long long v47 = [v30 pendingInitializationRequest];
        id v48 = [v47 sessionID];

        id v49 = (void *)MEMORY[0x1E4F999C8];
        v50 = [*(id *)(a1 + 32) pendingInitializationRequest];
        SEL v51 = [v50 conversation];
        v52 = [v51 identifier];
        [v49 fileRadarWithError:v16 conversationIdentifier:v52 completionHandler:&__block_literal_global_186];

        id v53 = [*(id *)(a1 + 32) pendingInitializationRequest];
        id v54 = [v53 handler];
        ((void (**)(void, void, uint64_t, uint64_t, id))v54)[2](v54, 0, 1, 1, v16);

        [*(id *)(a1 + 32) setPendingInitializationRequest:0];
        uint64_t v55 = [*(id *)(a1 + 32) sessionManager];
        [v55 cancelInitializationForSessionID:v48 handler:&__block_literal_global_188_0];
      }
      else
      {
        long long v31 = [v30 sessionManager];
        id v32 = [*(id *)(a1 + 32) pendingInitializationRequest];
        id v33 = [v32 sessionID];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke_5;
        v60[3] = &unk_1E6B96BE8;
        uint64_t v34 = *(void **)(a1 + 40);
        v60[4] = *(void *)(a1 + 32);
        id v61 = v34;
        id v62 = 0;
        int64x2_t v64 = vdupq_n_s64(1uLL);
        id v63 = v59;
        [v31 sessionInitializedWithSessionID:v33 allowReadToken:v19 safetyCacheKey:v15 scheduledSendMessageGUID:v58 completionHandler:v60];
      }
    }
    else
    {
      id v37 = [*(id *)(a1 + 32) pendingInitializationRequest];
      __int16 v38 = [v37 sessionID];

      id v39 = [*(id *)(a1 + 32) convertEligibilityToSMErrorWithInitiator:a6 receiver:a7];
      if (drand48() < 0.5)
      {
        __int16 v40 = (void *)MEMORY[0x1E4F999C8];
        SEL v41 = [*(id *)(a1 + 32) pendingInitializationRequest];
        [v41 conversation];
        uint64_t v42 = v56 = v38;
        id v43 = [v42 identifier];
        [v40 fileRadarWithError:v39 conversationIdentifier:v43 completionHandler:&__block_literal_global_182];

        __int16 v38 = v56;
      }
      id v44 = [*(id *)(a1 + 32) pendingInitializationRequest];
      long long v45 = [v44 handler];
      ((void (**)(void, void, uint64_t, uint64_t, void *))v45)[2](v45, 0, a6, a7, v39);

      [*(id *)(a1 + 32) setPendingInitializationRequest:0];
      SEL v46 = [*(id *)(a1 + 32) sessionManager];
      [v46 cancelInitializationForSessionID:v38 handler:&__block_literal_global_184];

      id v14 = v19;
      id v15 = v21;
    }
  }
  else
  {
LABEL_13:
    id v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v66 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      __int16 v67 = 2112;
      v68 = v36;
      __int16 v69 = 2112;
      id v70 = v16;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing initialization process for request, %@, error, %@", buf, 0x20u);
    }
  }
}

void __49__SMInitiatorService__startInitializationProcess__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMInitiatorService__startInitializationProcess__block_invoke_6;
  block[3] = &unk_1E6B96BC0;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  long long v12 = *(_OWORD *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __49__SMInitiatorService__startInitializationProcess__block_invoke_6(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pendingInitializationRequest];
  if (!v2) {
    goto LABEL_9;
  }
  id v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 32) pendingInitializationRequest];
  uint64_t v5 = [v4 sessionID];
  id v6 = [*(id *)(a1 + 40) sessionID];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) pendingInitializationRequest];
      uint64_t v10 = *(void *)(a1 + 56);
      int v26 = 136315650;
      uint64_t v27 = "-[SMInitiatorService _startInitializationProcess]_block_invoke";
      __int16 v28 = 2112;
      long long v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%s, sessionManager transition to ready for request, %@, error, %@", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    long long v12 = [*(id *)(a1 + 32) pendingInitializationRequest];
    long long v13 = v12;
    if (!v11)
    {
      id v25 = [v12 handler];
      v25[2](v25, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), 0);

      [*(id *)(a1 + 32) setPendingInitializationRequest:0];
      return;
    }
    id v14 = [v12 sessionID];

    if (drand48() < 0.5)
    {
      id v15 = (void *)MEMORY[0x1E4F999C8];
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = [*(id *)(a1 + 32) pendingInitializationRequest];
      uint64_t v18 = [v17 conversation];
      id v19 = [v18 identifier];
      [v15 fileRadarWithError:v16 conversationIdentifier:v19 completionHandler:&__block_literal_global_191];
    }
    uint64_t v20 = [*(id *)(a1 + 32) pendingInitializationRequest];
    id v21 = [v20 handler];
    v21[2](v21, 0, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 56));

    [*(id *)(a1 + 32) setPendingInitializationRequest:0];
    uint64_t v22 = [*(id *)(a1 + 32) sessionManager];
    [v22 cancelInitializationForSessionID:v14 handler:&__block_literal_global_194];
  }
  else
  {
LABEL_9:
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void **)(a1 + 40);
      uint64_t v24 = *(void *)(a1 + 48);
      int v26 = 136315650;
      uint64_t v27 = "-[SMInitiatorService _startInitializationProcess]_block_invoke_6";
      __int16 v28 = 2112;
      long long v29 = v23;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing transition to ready for request, %@, error, %@", (uint8_t *)&v26, 0x20u);
    }
  }
}

- (void)onSessionStartMessageSendResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(RTNotifier *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__SMInitiatorService_onSessionStartMessageSendResult___block_invoke;
    v14[3] = &unk_1E6B90BF0;
    v14[4] = self;
    id v15 = v5;
    dispatch_async(v6, v14);
  }
  else
  {
    char v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      NSStringFromSelector(a2);
      uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
      long long v12 = [v5 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized notification,%@", buf, 0x20u);
    }
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v13 = [v5 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      id v19 = "-[SMInitiatorService onSessionStartMessageSendResult:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 1043;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __54__SMInitiatorService_onSessionStartMessageSendResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStartMessageSendResult:*(void *)(a1 + 40)];
}

- (void)_onSessionStartMessageSendResult:(id)a3
{
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self sessionManager];
    char v7 = [v5 message];
    id v8 = [v5 messageGUID];
    uint64_t v9 = [v5 success];
    uint64_t v10 = [v5 error];
    [v6 onSessionStartMessageSendResultWithMessage:v7 messageGUID:v8 success:v9 error:v10];
  }
  else
  {
    uint64_t v11 = [(SMInitiatorService *)self dispatcher];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__SMInitiatorService__onSessionStartMessageSendResult___block_invoke;
    v15[3] = &unk_1E6B90BF0;
    v15[4] = self;
    id v16 = v5;
    long long v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    [v11 enqueueBlock:v15, @"%@-%@", v13, v14 description];
  }
}

uint64_t __55__SMInitiatorService__onSessionStartMessageSendResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStartMessageSendResult:*(void *)(a1 + 40)];
}

- (void)onDeletedMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__SMInitiatorService_onDeletedMessage___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 name];
      *(_DWORD *)buf = 136315394;
      long long v13 = "-[SMInitiatorService onDeletedMessage:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,unrecognized notification,%@", buf, 0x16u);
    }
    char v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      long long v13 = v9;
      __int16 v14 = 2080;
      id v15 = "-[SMInitiatorService onDeletedMessage:]";
      __int16 v16 = 1024;
      int v17 = 1072;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __39__SMInitiatorService_onDeletedMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedMessage:*(void *)(a1 + 40)];
}

- (void)_onDeletedMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    if (v5 && ([v5 message], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      char v7 = [(SMInitiatorService *)self sessionManager];
      id v8 = [v5 message];
      [v7 onDeletedMessage:v8 handler:&__block_literal_global_198];
    }
    else
    {
      char v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      id v8 = [v5 name];
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[SMInitiatorService _onDeletedMessage:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,invalid notification,%@", buf, 0x16u);
    }

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v9 = [(SMInitiatorService *)self dispatcher];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__SMInitiatorService__onDeletedMessage___block_invoke;
  v13[3] = &unk_1E6B90BF0;
  v13[4] = self;
  id v14 = v5;
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  long long v12 = NSStringFromSelector(a2);
  [v9 enqueueBlock:v13, @"%@-%@", v11, v12 description];

LABEL_9:
}

uint64_t __40__SMInitiatorService__onDeletedMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedMessage:*(void *)(a1 + 40)];
}

void __40__SMInitiatorService__onDeletedMessage___block_invoke_196(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    id v5 = "-[SMInitiatorService _onDeletedMessage:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "SMInitiatorService,%s,sessionManager,error,%@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onDeletedConversation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__SMInitiatorService_onDeletedConversation___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    __int16 v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 name];
      *(_DWORD *)buf = 136315394;
      long long v13 = "-[SMInitiatorService onDeletedConversation:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,unrecognized notification,%@", buf, 0x16u);
    }
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      long long v13 = v9;
      __int16 v14 = 2080;
      id v15 = "-[SMInitiatorService onDeletedConversation:]";
      __int16 v16 = 1024;
      int v17 = 1106;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __44__SMInitiatorService_onDeletedConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedConversation:*(void *)(a1 + 40)];
}

- (void)_onDeletedConversation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    if (v5
      && ([v5 conversation], __int16 v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      id v7 = [(SMInitiatorService *)self sessionManager];
      uint64_t v8 = [v5 conversation];
      [v7 onDeletedConversation:v8 handler:&__block_literal_global_201];
    }
    else
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      uint64_t v8 = [v5 name];
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[SMInitiatorService _onDeletedConversation:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "SMInitiatorService,%s,invalid notification,%@", buf, 0x16u);
    }

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v9 = [(SMInitiatorService *)self dispatcher];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__SMInitiatorService__onDeletedConversation___block_invoke;
  v13[3] = &unk_1E6B90BF0;
  v13[4] = self;
  id v14 = v5;
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  long long v12 = NSStringFromSelector(a2);
  [v9 enqueueBlock:v13, @"%@-%@", v11, v12 description];

LABEL_9:
}

uint64_t __45__SMInitiatorService__onDeletedConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeletedConversation:*(void *)(a1 + 40)];
}

void __45__SMInitiatorService__onDeletedConversation___block_invoke_199(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    id v5 = "-[SMInitiatorService _onDeletedConversation:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "SMInitiatorService,%s,sessionManager,error,%@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)onMessageReceived:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v6 = [(RTNotifier *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__SMInitiatorService_onMessageReceived___block_invoke;
    v14[3] = &unk_1E6B90BF0;
    v14[4] = self;
    id v15 = v5;
    dispatch_async(v6, v14);
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      NSStringFromSelector(a2);
      id v11 = (char *)objc_claimAutoreleasedReturnValue();
      long long v12 = [v5 name];
      *(_DWORD *)buf = 138412802;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized notification,%@", buf, 0x20u);
    }
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v13 = [v5 name];
      *(_DWORD *)buf = 138412802;
      __int16 v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[SMInitiatorService onMessageReceived:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 1141;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __40__SMInitiatorService_onMessageReceived___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMessageReceived:*(void *)(a1 + 40)];
}

- (void)_onMessageReceived:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    __int16 v6 = [v5 message];
    uint64_t v7 = [(id)objc_opt_class() messageType];

    switch(v7)
    {
      case 1:
      case 2:
      case 6:
      case 10:
      case 13:
      case 15:
      case 20:
        uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_9;
        }
        uint64_t v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        id v11 = NSStringFromSelector(a2);
        long long v12 = [v5 message];
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        id v25 = v11;
        __int16 v26 = 1024;
        int v27 = [(id)objc_opt_class() messageType];
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,ignore message type,%d", buf, 0x1Cu);
        goto LABEL_5;
      case 3:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionTypeKeyRelease:fromHandle:fromMe:](self, "receivedSessionTypeKeyRelease:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 7:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionSyncMessage:fromHandle:fromMe:](self, "receivedSessionSyncMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 8:
      case 9:
        break;
      case 11:
        __int16 v17 = [v5 message];
        [(SMInitiatorService *)self receivedEmergencyContactsNotifiedSyncMessage:v17];
        goto LABEL_19;
      case 12:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionStartInfoRequestMessage:fromHandle:fromMe:](self, "receivedSessionStartInfoRequestMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 14:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedKeyReleaseInfoRequestMessage:fromHandle:fromMe:](self, "receivedKeyReleaseInfoRequestMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 16:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionStateUpdateReqMessage:fromHandle:fromMe:](self, "receivedSessionStateUpdateReqMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 17:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionEndRemoteControlMessage:fromHandle:fromMe:](self, "receivedSessionEndRemoteControlMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 18:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedSessionConfigurationUpdateRemoteControlMessage:fromHandle:fromMe:](self, "receivedSessionConfigurationUpdateRemoteControlMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
        goto LABEL_18;
      case 19:
        __int16 v17 = [v5 message];
        __int16 v18 = [v5 from];
        -[SMInitiatorService receivedResponseToTriggerPromptRemoteControlMessage:fromHandle:fromMe:](self, "receivedResponseToTriggerPromptRemoteControlMessage:fromHandle:fromMe:", v17, v18, [v5 fromMe]);
LABEL_18:

LABEL_19:
        break;
      default:
        uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (objc_class *)objc_opt_class();
          uint64_t v10 = NSStringFromClass(v19);
          id v11 = NSStringFromSelector(a2);
          long long v12 = [v5 message];
          *(_DWORD *)buf = 138412802;
          uint64_t v23 = v10;
          __int16 v24 = 2112;
          id v25 = v11;
          __int16 v26 = 1024;
          int v27 = [(id)objc_opt_class() messageType];
          _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,unrecognized message type,%d", buf, 0x1Cu);
LABEL_5:
        }
LABEL_9:

        break;
    }
  }
  else
  {
    long long v13 = [(SMInitiatorService *)self dispatcher];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41__SMInitiatorService__onMessageReceived___block_invoke;
    v20[3] = &unk_1E6B90BF0;
    v20[4] = self;
    id v21 = v5;
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    [v13 enqueueBlock:v20, @"%@-%@", v15, v16 description];
  }
}

uint64_t __41__SMInitiatorService__onMessageReceived___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMessageReceived:*(void *)(a1 + 40)];
}

- (void)receivedResponseToTriggerPromptRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v9 sessionID];
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      __int16 v17 = [v9 sourceDeviceID];
      int v21 = 138413826;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);
    }
    long long v12 = [(SMInitiatorService *)self sessionManager];
    [v12 processResponseToTriggerPromptRemoteControlMessage:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    __int16 v20 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = v19;
    __int16 v23 = 2112;
    __int16 v24 = v20;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);
  }
}

- (void)receivedSessionEndRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v9 sessionID];
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      __int16 v17 = [v9 sourceDeviceID];
      int v21 = 138413826;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);
    }
    long long v12 = [(SMInitiatorService *)self sessionManager];
    [v12 processSessionEndRemoteControlMessage:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    __int16 v20 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = v19;
    __int16 v23 = 2112;
    __int16 v24 = v20;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);
  }
}

- (void)receivedSessionConfigurationUpdateRemoteControlMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v9 sessionID];
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      __int16 v17 = [v9 sourceDeviceID];
      int v21 = 138413826;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#RemoteControl,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d, sourceDeviceId, %@ ,message,%@", (uint8_t *)&v21, 0x44u);
    }
    long long v12 = [(SMInitiatorService *)self sessionManager];
    [v12 processModifySessionConfigurationRemoteControlMessage:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    __int16 v20 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = v19;
    __int16 v23 = 2112;
    __int16 v24 = v20;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v21, 0x16u);
  }
}

- (void)receivedSessionSyncMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v9 sessionID];
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      int v20 = 138413570;
      int v21 = v13;
      __int16 v22 = 2112;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      __int16 v25 = v16;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 1024;
      int v29 = 1;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x3Au);
    }
    long long v12 = [(SMInitiatorService *)self sessionManager];
    [v12 processStateSyncMessage:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    uint64_t v19 = NSStringFromSelector(a2);
    int v20 = 138412546;
    int v21 = v18;
    __int16 v22 = 2112;
    __int16 v23 = v19;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v20, 0x16u);
  }
}

- (void)receivedSessionTypeKeyRelease:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v12 = v11;
  if (a5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v9 sessionID];
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      int v20 = 138413570;
      int v21 = v13;
      __int16 v22 = 2112;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      __int16 v25 = v16;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 1024;
      int v29 = 1;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x3Au);
    }
    long long v12 = [(SMInitiatorService *)self sessionManager];
    [v12 processSessionTypeKeyRelease:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    uint64_t v19 = NSStringFromSelector(a2);
    int v20 = 138412546;
    int v21 = v18;
    __int16 v22 = 2112;
    __int16 v23 = v19;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v20, 0x16u);
  }
}

- (void)receivedSessionStateUpdateReqMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v21 = (objc_class *)objc_opt_class();
    __int16 v22 = NSStringFromClass(v21);
    __int16 v23 = NSStringFromSelector(a2);
    int v25 = 138412546;
    __int16 v26 = v22;
    __int16 v27 = 2112;
    __int16 v28 = v23;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message not from my own device", (uint8_t *)&v25, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  id v11 = [(SMInitiatorService *)self messagingService];
  long long v12 = [v11 deviceIdentifier];
  long long v13 = [v9 deviceToRequest];
  char v14 = [v12 isEqual:v13];

  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  __int16 v16 = v15;
  if ((v14 & 1) == 0)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    __int16 v24 = (objc_class *)objc_opt_class();
    __int16 v22 = NSStringFromClass(v24);
    __int16 v23 = NSStringFromSelector(a2);
    int v25 = 138412802;
    __int16 v26 = v22;
    __int16 v27 = 2112;
    __int16 v28 = v23;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,received state sync req message for unmatched device identifier,%@", (uint8_t *)&v25, 0x20u);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [v9 sessionID];
    __int16 v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    int v20 = NSStringFromSelector(a2);
    int v25 = 138413570;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v19;
    __int16 v29 = 2112;
    id v30 = v20;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 1024;
    int v34 = 1;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v25, 0x3Au);
  }
  __int16 v16 = [(SMInitiatorService *)self sessionManager];
  [v16 processStateSyncUpdateReqMessage:v9];
LABEL_11:
}

- (void)receivedEmergencyContactsNotifiedSyncMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v11 = 138412802;
    long long v12 = v8;
    __int16 v13 = 2112;
    char v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,%@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(SMInitiatorService *)self sessionManager];
  [v10 processEmergencyContactsNotifiedMessage:v5];
}

- (void)receivedSessionStartInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v5)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      char v14 = NSStringFromSelector(a2);
      int v26 = 138412546;
      __int16 v27 = v13;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message from my own device", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    __int16 v15 = [v9 sessionID];
    int v11 = [(SMInitiatorService *)self getCacheManagerForSessionID:v15];

    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v17 = v16;
    if (v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = [v9 sessionID];
        uint64_t v19 = (objc_class *)objc_opt_class();
        int v20 = NSStringFromClass(v19);
        int v21 = NSStringFromSelector(a2);
        int v26 = 138413570;
        __int16 v27 = v18;
        __int16 v28 = 2112;
        __int16 v29 = v20;
        __int16 v30 = 2112;
        __int16 v31 = v21;
        __int16 v32 = 2112;
        id v33 = v10;
        __int16 v34 = 1024;
        int v35 = 0;
        __int16 v36 = 2112;
        id v37 = v9;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v26, 0x3Au);
      }
      [v11 processSessionStartInfoRequest:v9];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = [v9 sessionID];
        __int16 v23 = (objc_class *)objc_opt_class();
        __int16 v24 = NSStringFromClass(v23);
        int v25 = NSStringFromSelector(a2);
        int v26 = 138412802;
        __int16 v27 = v22;
        __int16 v28 = 2112;
        __int16 v29 = v24;
        __int16 v30 = 2112;
        __int16 v31 = v25;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager for this session not found", (uint8_t *)&v26, 0x20u);
      }
      int v11 = 0;
    }
  }
}

- (void)receivedKeyReleaseInfoRequestMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v5)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      char v14 = NSStringFromSelector(a2);
      int v27 = 138412546;
      __int16 v28 = v13;
      __int16 v29 = 2112;
      __int16 v30 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,message from my own device", (uint8_t *)&v27, 0x16u);
    }
  }
  else
  {
    __int16 v15 = [v9 sessionID];
    int v11 = [(SMInitiatorService *)self getCacheManagerForSessionID:v15];

    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v17 = v16;
    if (v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = [v9 sessionID];
        uint64_t v19 = [v18 UUIDString];
        int v20 = (objc_class *)objc_opt_class();
        int v21 = NSStringFromClass(v20);
        __int16 v22 = NSStringFromSelector(a2);
        int v27 = 138413570;
        __int16 v28 = v19;
        __int16 v29 = 2112;
        __int16 v30 = v21;
        __int16 v31 = 2112;
        __int16 v32 = v22;
        __int16 v33 = 2112;
        id v34 = v10;
        __int16 v35 = 1024;
        int v36 = 0;
        __int16 v37 = 2112;
        id v38 = v9;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v27, 0x3Au);
      }
      [v11 processKeyReleaseInfoRequest:v9];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = [v9 sessionID];
        __int16 v24 = (objc_class *)objc_opt_class();
        int v25 = NSStringFromClass(v24);
        int v26 = NSStringFromSelector(a2);
        int v27 = 138412802;
        __int16 v28 = v23;
        __int16 v29 = 2112;
        __int16 v30 = v25;
        __int16 v31 = 2112;
        __int16 v32 = v26;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager for this session not found", (uint8_t *)&v27, 0x20u);
      }
      int v11 = 0;
    }
  }
}

- (void)onSessionStoreNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SMInitiatorService_onSessionStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__SMInitiatorService_onSessionStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onSessionStoreNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 availability];
    if ([(SMInitiatorService *)self sessionStoreAvailability] != v8)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = +[RTStore availabilityToString:self->_sessionStoreAvailability];
        int v11 = +[RTStore availabilityToString:v8];
        int v12 = 136315650;
        __int16 v13 = "-[SMInitiatorService _onSessionStoreNotification:]";
        __int16 v14 = 2112;
        __int16 v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%s, sessionStoreAvailability availability change from , %@, to, %@", (uint8_t *)&v12, 0x20u);
      }
      [(SMInitiatorService *)self setSessionStoreAvailability:v8];
      [(SMInitiatorService *)self _setupOncePersistenceStackAvailable];
    }
  }
}

- (void)onSafetyCacheStoreNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMInitiatorService_onSafetyCacheStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SMInitiatorService_onSafetyCacheStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSafetyCacheStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onSafetyCacheStoreNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 availability];
    if ([(SMInitiatorService *)self safetyCacheStoreAvailability] != v8)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = +[RTStore availabilityToString:self->_safetyCacheStoreAvailability];
        int v11 = +[RTStore availabilityToString:v8];
        int v12 = 136315650;
        __int16 v13 = "-[SMInitiatorService _onSafetyCacheStoreNotification:]";
        __int16 v14 = 2112;
        __int16 v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%s, safetyCacheStoreAvailability availability change from , %@, to, %@", (uint8_t *)&v12, 0x20u);
      }
      [(SMInitiatorService *)self setSafetyCacheStoreAvailability:v8];
      [(SMInitiatorService *)self _setupOncePersistenceStackAvailable];
    }
  }
}

- (void)onHealthKitManagerNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMInitiatorService_onHealthKitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SMInitiatorService_onHealthKitManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onHealthKitManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onWorkoutPause
{
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v8 = [(SMInitiatorService *)self sessionMonitor];
    [v8 onWorkoutPause];
  }
  else
  {
    id v4 = [(SMInitiatorService *)self dispatcher];
    v9[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__SMInitiatorService__onWorkoutPause__block_invoke;
    v10[3] = &unk_1E6B90E70;
    v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__SMInitiatorService__onWorkoutPause__block_invoke_2;
    v9[3] = &unk_1E6B90E70;
    BOOL v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = NSStringFromSelector(a2);
    [v4 enqueueBlock:v10, v9, @"%@-%@", v6, v7 failureBlock description];
  }
}

uint64_t __37__SMInitiatorService__onWorkoutPause__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkoutPause];
}

void __37__SMInitiatorService__onWorkoutPause__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) invocationError];
    int v4 = 136315394;
    BOOL v5 = "-[SMInitiatorService _onWorkoutPause]_block_invoke_2";
    __int16 v6 = 2112;
    int v7 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%s, workout pause signal ended with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_onWorkoutResume
{
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v8 = [(SMInitiatorService *)self sessionMonitor];
    [v8 onWorkoutResume];
  }
  else
  {
    int v4 = [(SMInitiatorService *)self dispatcher];
    v9[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__SMInitiatorService__onWorkoutResume__block_invoke;
    v10[3] = &unk_1E6B90E70;
    v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__SMInitiatorService__onWorkoutResume__block_invoke_2;
    v9[3] = &unk_1E6B90E70;
    BOOL v5 = (objc_class *)objc_opt_class();
    __int16 v6 = NSStringFromClass(v5);
    int v7 = NSStringFromSelector(a2);
    [v4 enqueueBlock:v10, v9, @"%@-%@", v6, v7 failureBlock description];
  }
}

uint64_t __38__SMInitiatorService__onWorkoutResume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkoutResume];
}

void __38__SMInitiatorService__onWorkoutResume__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) invocationError];
    int v4 = 136315394;
    BOOL v5 = "-[SMInitiatorService _onWorkoutResume]_block_invoke_2";
    __int16 v6 = 2112;
    int v7 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%s, workout resume signal ended with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SMInitiatorService_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__SMInitiatorService_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentWorkoutSnapshotWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[SMInitiatorService _fetchCurrentWorkoutSnapshotWithHandler:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  healthKitManager = self->_healthKitManager;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SMInitiatorService__fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v8[3] = &unk_1E6B96C38;
  id v9 = v4;
  id v7 = v4;
  [(RTHealthKitManager *)healthKitManager fetchCurrentWorkoutSnapshotWithHandler:v8];
}

void __62__SMInitiatorService__fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = [v5 sessionState];
    uint64_t v8 = (v7 < 6) & (0x34u >> v7);
    id v9 = objc_alloc(MEMORY[0x1E4F99840]);
    id v10 = [v5 sessionIdentifier];
    int v11 = [v9 initWithSessionIdentifier:v10 activityType:[v5 activityType] isWorkoutOngoing:v8 isFirstPartyWorkout:[v5 isFirstPartyWorkout]];
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    __int16 v14 = "-[SMInitiatorService _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "%s, calling handler", (uint8_t *)&v13, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchAllZonesFromContainerSynchronizerWithHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, uint64_t))a3;
  if ([(SMInitiatorService *)self fetchAllZonesFromContainerInProgress])
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v23 = v8;
      __int16 v24 = 2112;
      int v25 = v9;
      __int16 v26 = 1024;
      BOOL v27 = [(SMInitiatorService *)self fetchAllZonesFromContainerInProgress];
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainerInProgress:%d,early return", buf, 0x1Cu);
    }
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    int v21 = @"FetchAllZoneFromContainer in progress";
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v12 = [v10 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:9 userInfo:v11];
    v5[2](v5, v12, 1);
  }
  else
  {
    [(SMInitiatorService *)self setFetchAllZonesFromContainerInProgress:1];
    [(SMInitiatorService *)self setFetchAllZonesRetried:0];
    int v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      int v25 = v16;
      __int16 v26 = 1024;
      BOOL v27 = [(SMInitiatorService *)self fetchAllZonesFromContainerInProgress];
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainerInProgress:%d,Attempt fetching all zones", buf, 0x1Cu);
    }
    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__SMInitiatorService__fetchAllZonesFromContainerSynchronizerWithHandler___block_invoke;
    v17[3] = &unk_1E6B96C60;
    objc_copyWeak(&v19, (id *)buf);
    uint64_t v18 = v5;
    [(SMInitiatorService *)self _fetchAllZonesFromContainerWithHandler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __73__SMInitiatorService__fetchAllZonesFromContainerSynchronizerWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setFetchAllZonesFromContainerInProgress:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchAllZonesFromContainerWithHandler:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(SMInitiatorService *)self sessionReceiptZone];
  id v9 = [v8 container];
  id v10 = [(SMInitiatorService *)self sessionReceiptZone];
  int v11 = [v10 privateDatabase];
  uint64_t v12 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke;
  v15[3] = &unk_1E6B96C88;
  objc_copyWeak(v18, &location);
  id v13 = v7;
  id v16 = v13;
  v18[1] = (id)a2;
  id v14 = v5;
  id v17 = v14;
  +[SMCloudKitZone fetchAllZonesFromContainer:v9 database:v11 qos:v12 withCompletion:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v7 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke_212;
    block[3] = &unk_1E6B90FA8;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    id v19 = v8;
    uint64_t v23 = v9;
    id v20 = v4;
    id v21 = v6;
    id v22 = *(id *)(a1 + 40);
    dispatch_async(v7, block);

    id v10 = v19;
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      __int16 v29 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,nil self", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    int v25 = @"self is nil";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v15 = [v13 errorWithDomain:v14 code:5 userInfo:v10];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
  }
}

uint64_t __61__SMInitiatorService__fetchAllZonesFromContainerWithHandler___block_invoke_212(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    int v19 = 138412802;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,CloudKit (Fetch) Operation for initialize using PCS Identities, error %@", (uint8_t *)&v19, 0x20u);
  }
  if (*(void *)(a1 + 40)
    && +[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:")
    && ([*(id *)(a1 + 48) fetchAllZonesRetried] & 1) == 0)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = [*(id *)(a1 + 48) fetchAllZonesRetried];
      int v19 = 138413058;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 1024;
      int v26 = v18;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainer,error:%@,fetchAllZonesRetried:%d, retry once more", (uint8_t *)&v19, 0x26u);
    }
    [*(id *)(a1 + 48) setFetchAllZonesRetried:1];
    return [*(id *)(a1 + 48) _fetchAllZonesFromContainerWithHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = [*(id *)(a1 + 48) fetchAllZonesRetried];
      int v19 = 138413058;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      __int16 v25 = 1024;
      int v26 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, fetchAllZonesFromContainer,error:%@,fetchAllZonesRetried:%d, not retrying", (uint8_t *)&v19, 0x26u);
    }
    int v11 = *(void **)(a1 + 48);
    if (*(void *)(a1 + 40))
    {
      [v11 _startFrequentSingleShotFetchAllZonesActivity];
    }
    else
    {
      uint64_t v12 = [v11 defaultsManager];
      [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"];

      [*(id *)(a1 + 48) _stopFrequentSingleShotFetchAllZonesActivity];
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_startFrequentSingleShotFetchAllZonesActivity
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(SMInitiatorService *)self frequentSingleShotFetchAllZonesInProgress])
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      __int16 v31 = v7;
      __int16 v32 = 1024;
      LODWORD(v33) = [(SMInitiatorService *)self frequentSingleShotFetchAllZonesInProgress];
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@, frequentSingleShotFetchAllZonesInProgress:%d,early return", buf, 0x1Cu);
    }
  }
  else
  {
    [(SMInitiatorService *)self setFrequentSingleShotFetchAllZonesInProgress:1];
    id v8 = [(SMInitiatorService *)self defaultsManager];
    id v4 = [v8 objectForKey:@"RTDefaultsInitiatorServiceSingleShotFetchAllZonesGracePeriod"];

    if (v4)
    {
      [v4 doubleValue];
      double v10 = v9;
    }
    else
    {
      double v10 = 60.0;
    }
    int v11 = [(SMInitiatorService *)self defaultsManager];
    uint64_t v12 = [v11 objectForKey:@"RTDefaultsInitiatorServicePeriodicFetchAllZonesDelay"];

    if (v12)
    {
      [v12 doubleValue];
      double v14 = v13;
    }
    else
    {
      double v14 = 1800.0;
    }
    LOBYTE(v24) = 1;
    uint64_t v15 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:0 requireNetworkConnectivity:10240 requireInexpensiveNetworkConnectivity:10240 networkTransferUploadSize:1 networkTransferDownloadSize:0.0 allowBattery:v10 powerNap:v14 delay:v24 requireBatteryLevel:&unk_1F34512F0];
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      int v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v18;
      __int16 v30 = 2112;
      __int16 v31 = v19;
      __int16 v32 = 2048;
      uint64_t v33 = 0;
      __int16 v34 = 2048;
      double v35 = v10;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,schedule single shot fetch all zones xpc activity,interval,%f,grace period,%f", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v20 = (objc_class *)objc_opt_class();
    __int16 v21 = NSStringFromClass(v20);
    id v22 = [(SMInitiatorService *)self xpcActivityManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke;
    v25[3] = &unk_1E6B96CD8;
    objc_copyWeak(v27, (id *)buf);
    id v23 = v21;
    id v26 = v23;
    v27[1] = (id)a2;
    [v22 registerActivityWithIdentifier:@"com.apple.routined.cloudkit.frequentFetchAllZones" criteria:v15 handler:v25];

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_2;
    v9[3] = &unk_1E6B90C40;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v13 = v8;
    id v11 = v5;
    id v12 = v3;
    dispatch_async(v6, v9);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    double v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,single shot fetch all zones xpc fired", buf, 0x16u);
  }
  [*(id *)(a1 + 40) setFrequentSingleShotFetchAllZonesInProgress:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_222;
  v8[3] = &unk_1E6B96CB0;
  uint64_t v5 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v10 = v7;
  [v5 _fetchAllZonesFromContainerSynchronizerWithHandler:v8];
}

void __67__SMInitiatorService__startFrequentSingleShotFetchAllZonesActivity__block_invoke_222(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138413058;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler, error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

- (void)_startInfrequentPeriodicFetchAllZonesActivity
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMInitiatorService *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsInitiatorServicePeriodicFetchAllZonesInterval"];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 86400.0;
  }
  uint64_t v8 = [(SMInitiatorService *)self defaultsManager];
  uint64_t v9 = [v8 objectForKey:@"RTDefaultsInitiatorServicePeriodicFetchAllZonesGracePeriod"];

  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 1800.0;
  }
  __int16 v12 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:0 requireNetworkConnectivity:3 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:1 allowBattery:v7 powerNap:v11];
  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    __int16 v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    __int16 v28 = 2048;
    double v29 = v7;
    __int16 v30 = 2048;
    double v31 = v11;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,schedule periodic fetch all zones xpc activity,interval,%f,grace period,%f", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  int v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  int v19 = [(SMInitiatorService *)self xpcActivityManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke;
  v21[3] = &unk_1E6B96CD8;
  objc_copyWeak(v23, (id *)buf);
  id v20 = v18;
  id v22 = v20;
  v23[1] = (id)a2;
  [v19 registerActivityWithIdentifier:@"com.apple.routined.cloudkit.infrequentFetchAllZones" criteria:v12 handler:v21];

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = [WeakRetained queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_2;
    v9[3] = &unk_1E6B90C40;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v13 = v8;
    id v11 = v5;
    id v12 = v3;
    dispatch_async(v6, v9);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,periodic fetch all zones xpc fired", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 40) defaultsManager];
  [v5 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsInitiatorServiceRecentCloudKitBootstrapSuccess"];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_230;
  v9[3] = &unk_1E6B96CB0;
  double v6 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v8;
  long long v11 = v8;
  [v6 _fetchAllZonesFromContainerSynchronizerWithHandler:v9];
}

void __67__SMInitiatorService__startInfrequentPeriodicFetchAllZonesActivity__block_invoke_230(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    long long v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138413058;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,_fetchAllZonesFromContainerSynchronizerWithHandler, error:%@, inProgress:%d", (uint8_t *)&v10, 0x26u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

- (void)_stopFrequentSingleShotFetchAllZonesActivity
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);
  }
  long long v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  int v10 = [(SMInitiatorService *)self xpcActivityManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SMInitiatorService__stopFrequentSingleShotFetchAllZonesActivity__block_invoke;
  v12[3] = &unk_1E6B90CB8;
  id v13 = v9;
  SEL v14 = a2;
  id v11 = v9;
  [v10 unregisterActivityWithIdentifier:@"com.apple.routined.cloudkit.frequentFetchAllZones" handler:v12];
}

void __66__SMInitiatorService__stopFrequentSingleShotFetchAllZonesActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SMInitiatorService_onNearbyEffectivePairedDeviceChangedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__SMInitiatorService_onNearbyEffectivePairedDeviceChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNearbyEffectivePairedDeviceChangedNotification:*(void *)(a1 + 40)];
}

- (void)_onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    __int16 v9 = NSStringFromSelector(a2);
    int v16 = 138412802;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,on paired device notification %@", (uint8_t *)&v16, 0x20u);
  }
  int v10 = [v5 name];
  __int16 v11 = +[RTNotification notificationName];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    id v13 = v5;
    SEL v14 = [(SMInitiatorService *)self sessionManager];
    id v15 = [v13 device];

    [v14 processNearbyEffectivePairedDeviceChanged:v15];
  }
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v16 = "-[SMInitiatorService initializeSessionWithConversation:handler:]";
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%s, User requested to initialize the session", buf, 0xCu);
  }

  __int16 v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SMInitiatorService_initializeSessionWithConversation_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __64__SMInitiatorService_initializeSessionWithConversation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSessionWithConversation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_18;
  }
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    if (v7 && (conversationHandlesValid() & 1) != 0)
    {
      __int16 v9 = [(SMInitiatorService *)self pendingInitializationRequest];

      if (v9)
      {
        id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [(SMInitiatorService *)self pendingInitializationRequest];
          *(_DWORD *)buf = 136315394;
          long long v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
          __int16 v48 = 2112;
          id v49 = v11;
          _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, canceling previous initialization request %@", buf, 0x16u);
        }
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = *MEMORY[0x1E4F99A48];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v14 = [NSString stringWithFormat:@"Canceled due to new request"];
        id v43 = v14;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        int v16 = (void *)[v12 initWithDomain:v13 code:22 userInfo:v15];

        uint64_t v17 = [(SMInitiatorService *)self pendingInitializationRequest];
        __int16 v18 = [v17 handler];
        ((void (**)(void, void, void, void, void *))v18)[2](v18, 0, 0, 0, v16);

        [(SMInitiatorService *)self setPendingInitializationRequest:0];
      }
      uint64_t v19 = [SMInitiatorSessionInitializationRequest alloc];
      __int16 v20 = [MEMORY[0x1E4F29128] UUID];
      id v21 = [(SMInitiatorSessionInitializationRequest *)v19 initWithSessionID:v20 conversation:v7 handler:v8];
      [(SMInitiatorService *)self setPendingInitializationRequest:v21];

      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [(SMInitiatorService *)self pendingInitializationRequest];
        *(_DWORD *)buf = 136315394;
        long long v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
        __int16 v48 = 2112;
        id v49 = v23;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, "%s, request a transition to initializing for request, %@", buf, 0x16u);
      }
      uint64_t v24 = [(SMInitiatorService *)self pendingInitializationRequest];
      __int16 v25 = [(SMInitiatorService *)self sessionManager];
      __int16 v26 = [v24 sessionID];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_238;
      v37[3] = &unk_1E6B93748;
      v37[4] = self;
      id v38 = v24;
      uint64_t v27 = v24;
      [v25 initializeSessionWithSessionID:v26 conversation:v7 handler:v37];
    }
    else
    {
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v47 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]";
        __int16 v48 = 2112;
        id v49 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%s, invalid conversation %@", buf, 0x16u);
      }

      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F99A48];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      double v35 = [NSString stringWithFormat:@"Invalid conversation"];
      long long v45 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v27 = [v33 initWithDomain:v34 code:7 userInfo:v36];

      (*((void (**)(id, void, void, void, NSObject *))v8 + 2))(v8, 0, 0, 0, v27);
    }
LABEL_18:

    goto LABEL_19;
  }
  __int16 v28 = [(SMInitiatorService *)self dispatcher];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke;
  v39[3] = &unk_1E6B90660;
  v39[4] = self;
  id v40 = v7;
  id v41 = v8;
  double v29 = (objc_class *)objc_opt_class();
  __int16 v30 = NSStringFromClass(v29);
  double v31 = NSStringFromSelector(a2);
  [v28 enqueueBlock:v39, @"%@-%@", v30, v31 description];

LABEL_19:
}

uint64_t __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSessionWithConversation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_238(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_2;
  block[3] = &unk_1E6B92F80;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __65__SMInitiatorService__initializeSessionWithConversation_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pendingInitializationRequest];
  if (!v2) {
    goto LABEL_7;
  }
  id v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 32) pendingInitializationRequest];
  id v5 = [v4 sessionID];
  id v6 = [*(id *)(a1 + 40) sessionID];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) pendingInitializationRequest];
      uint64_t v10 = *(void *)(a1 + 48);
      int v17 = 136315650;
      __int16 v18 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%s, sessionManager finished attempting state change to initialization for request, %@, error, %@", (uint8_t *)&v17, 0x20u);
    }
    id v11 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48))
    {
      id v12 = [v11 pendingInitializationRequest];
      uint64_t v13 = [v12 handler];
      v13[2](v13, 0, 0, 0, *(void *)(a1 + 48));

      [*(id *)(a1 + 32) setPendingInitializationRequest:0];
    }
    else
    {
      [v11 _startInitializationProcess];
    }
  }
  else
  {
LABEL_7:
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      int v17 = 136315650;
      __int16 v18 = "-[SMInitiatorService _initializeSessionWithConversation:handler:]_block_invoke_2";
      __int16 v19 = 2112;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "%s, request was canceled prior to finishing transition to initializing for request, %@, error, %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)cancelInitializationWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SMInitiatorService cancelInitializationWithHandler:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, User requested to cancel initialization", buf, 0xCu);
  }

  id v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SMInitiatorService_cancelInitializationWithHandler___block_invoke;
  v8[3] = &unk_1E6B90CE0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __54__SMInitiatorService_cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelInitializationWithHandler:*(void *)(a1 + 40)];
}

- (void)_cancelInitializationWithHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self pendingInitializationRequest];

    if (v6)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [(SMInitiatorService *)self pendingInitializationRequest];
        *(_DWORD *)buf = 136315394;
        __int16 v28 = "-[SMInitiatorService _cancelInitializationWithHandler:]";
        __int16 v29 = 2112;
        __int16 v30 = v8;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, responding to previous initialization request %@", buf, 0x16u);
      }
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = *MEMORY[0x1E4F99A48];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v11 = [NSString stringWithFormat:@"Initialization canceled"];
      __int16 v26 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v13 = (void *)[v9 initWithDomain:v10 code:42 userInfo:v12];

      id v14 = [(SMInitiatorService *)self pendingInitializationRequest];
      id v15 = [v14 handler];
      ((void (**)(void, void, void, void, void *))v15)[2](v15, 0, 0, 0, v13);

      [(SMInitiatorService *)self setPendingInitializationRequest:0];
    }
    uint64_t v16 = [(SMInitiatorService *)self sessionManager];
    [v16 cancelInitializationWithHandler:v5];
  }
  else
  {
    int v17 = [(SMInitiatorService *)self dispatcher];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    id v23[2] = __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke;
    v23[3] = &unk_1E6B90CE0;
    v23[4] = self;
    id v24 = v5;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke_2;
    v21[3] = &unk_1E6B90D08;
    void v21[4] = self;
    id v22 = v24;
    __int16 v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    __int16 v20 = NSStringFromSelector(a2);
    [v17 enqueueBlock:v23, v21, @"%@-%@", v19, v20 failureBlock description];
  }
}

uint64_t __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelInitializationWithHandler:*(void *)(a1 + 40)];
}

void __55__SMInitiatorService__cancelInitializationWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SMInitiatorService cancelInitializationForSessionID:handler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, User requested to cancel initialization with session ID %@", buf, 0x16u);
  }

  id v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SMInitiatorService_cancelInitializationForSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __63__SMInitiatorService_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelInitializationForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    uint64_t v9 = [(SMInitiatorService *)self pendingInitializationRequest];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(SMInitiatorService *)self pendingInitializationRequest];
      uint64_t v12 = [v11 sessionID];
      int v13 = [v12 isEqual:v7];

      if (v13)
      {
        id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [(SMInitiatorService *)self pendingInitializationRequest];
          *(_DWORD *)buf = 136315394;
          uint64_t v36 = "-[SMInitiatorService _cancelInitializationForSessionID:handler:]";
          __int16 v37 = 2112;
          id v38 = v15;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, responding to previous initialization request %@", buf, 0x16u);
        }
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F99A48];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        id v18 = [NSString stringWithFormat:@"Initialization canceled"];
        uint64_t v34 = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        __int16 v20 = (void *)[v16 initWithDomain:v17 code:2 userInfo:v19];

        __int16 v21 = [(SMInitiatorService *)self pendingInitializationRequest];
        id v22 = [v21 handler];
        ((void (**)(void, void, void, void, void *))v22)[2](v22, 0, 0, 0, v20);

        [(SMInitiatorService *)self setPendingInitializationRequest:0];
      }
    }
    uint64_t v23 = [(SMInitiatorService *)self sessionManager];
    [v23 cancelInitializationForSessionID:v7 handler:v8];
  }
  else
  {
    id v24 = [(SMInitiatorService *)self dispatcher];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke;
    v30[3] = &unk_1E6B90660;
    v30[4] = self;
    id v31 = v7;
    id v32 = v8;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke_2;
    v28[3] = &unk_1E6B90D08;
    v28[4] = self;
    id v29 = v32;
    uint64_t v25 = (objc_class *)objc_opt_class();
    __int16 v26 = NSStringFromClass(v25);
    uint64_t v27 = NSStringFromSelector(a2);
    [v24 enqueueBlock:v30, v28, @"%@-%@", v26, v27 failureBlock description];
  }
}

uint64_t __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelInitializationForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __64__SMInitiatorService__cancelInitializationForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMInitiatorService_startSessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__SMInitiatorService_startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSessionWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 startSessionWithConfiguration:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSessionWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __61__SMInitiatorService__startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _initializeAndStartSessionWithConfiguration:v2 handler:v3];
}

void __73__SMInitiatorService_initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = [v3 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F99A48]];

    if (v5)
    {
      uint64_t v6 = [v10 code];
      if (v6 == 42) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [MEMORY[0x1E4F99910] sendMessageFailureAlertCannotSendTitle];
    CFStringRef v8 = (const __CFString *)[MEMORY[0x1E4F99910] sendValidityAlertMessageForSMError:v6];
    id v9 = [MEMORY[0x1E4F99910] sendMessageFailureAlertOKButtonText];
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v7, v8, v9, 0, 0, 0);
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [v7 conversation];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_3;
    v17[3] = &unk_1E6B96D50;
    id v18 = v7;
    id v19 = v8;
    void v17[4] = self;
    id v10 = v7;
    [(SMInitiatorService *)self _initializeSessionWithConversation:v9 handler:v17];

    id v11 = v19;
  }
  else
  {
    id v12 = [(SMInitiatorService *)self dispatcher];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke;
    v22[3] = &unk_1E6B90660;
    v22[4] = self;
    id v23 = v7;
    id v24 = v8;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
    v20[3] = &unk_1E6B90D08;
    v20[4] = self;
    id v21 = v24;
    id v13 = v7;
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    id v16 = NSStringFromSelector(a2);
    [v12 enqueueBlock:v22, v20, @"%@-%@", v15, v16 failureBlock description];

    id v11 = v23;
  }
}

uint64_t __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeAndStartSessionWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (v7)
  {
    id v9 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_247;
    v18[3] = &unk_1E6B96D28;
    id v22 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v19 = v10;
    uint64_t v20 = v11;
    id v21 = v7;
    [v9 _fetchCurrentSessionStateWithHandler:v18];
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v26 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke_3";
      _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "%s, missing invitation token with no error", buf, 0xCu);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F99A48];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v15 = [NSString stringWithFormat:@"Missing invitation token with no error"];
    id v24 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v17 = (void *)[v13 initWithDomain:v14 code:0 userInfo:v16];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_247(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "%s, ready state fetch error, %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if ([v7 sessionState] == 11 && (a3 & 1) != 0)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v7 configuration];
      id v12 = [v11 sessionID];
      id v13 = (void *)[v10 copyConfigurationWithNewSessionID:v12];

      uint64_t v14 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_251;
      v22[3] = &unk_1E6B96D00;
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 40);
      id v25 = v15;
      v22[4] = v16;
      id v23 = v7;
      id v24 = *(id *)(a1 + 48);
      [v14 _startSessionWithConfiguration:v13 handler:v22];
    }
    else
    {
      id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v29 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2048;
        uint64_t v33 = a3;
        _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "%s, expected ready state but got unexpected state, %@, activeDevice, %ld", buf, 0x20u);
      }

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F99A48];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v20 = [NSString stringWithFormat:@"Unexpected state during initialization"];
      uint64_t v27 = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v13 = (void *)[v18 initWithDomain:v19 code:41 userInfo:v21];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_251(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315394;
      id v9 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_FAULT, "%s, start error, %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    int v5 = *(void **)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) configuration];
    id v7 = [v6 sessionID];
    [v5 _cancelInitializationForSessionID:v7 handler:&__block_literal_global_254];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) _sendSessionStartMessageWithInvitationTokenMap:*(void *)(a1 + 48)];
  }
}

void __74__SMInitiatorService__initializeAndStartSessionWithConfiguration_handler___block_invoke_252(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SMInitiatorService _initializeAndStartSessionWithConfiguration:handler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, cancel initialization after start failure with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_sendSessionStartMessageWithInvitationTokenMap:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke;
  v6[3] = &unk_1E6B96D98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SMInitiatorService *)self _fetchCurrentSessionStateWithHandler:v6];
}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v10 = "%s, fetch error, %@";
      id v11 = v9;
      uint32_t v12 = 22;
LABEL_9:
      _os_log_fault_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_FAULT, v10, buf, v12);
    }
  }
  else if ([v7 sessionState] == 2 && (a3 & 1) != 0)
  {
    id v13 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_257;
    v16[3] = &unk_1E6B95848;
    id v17 = v7;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v18 = v14;
    uint64_t v19 = v15;
    [v13 _fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v16];

    id v9 = v17;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v21 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2048;
      uint64_t v25 = a3;
      __int16 v10 = "%s, expected monitoring state but got unexpected state, %@, activeDevice, %ld";
      id v11 = v9;
      uint32_t v12 = 32;
      goto LABEL_9;
    }
  }
}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_257(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    a2 = 0;
  }
  uint64_t v23 = a2;
  id v5 = objc_alloc(MEMORY[0x1E4F99990]);
  id v29 = [*(id *)(a1 + 32) sessionStateTransitionDate];
  __int16 v6 = [MEMORY[0x1E4F29128] UUID];
  __int16 v28 = [*(id *)(a1 + 32) configuration];
  __int16 v24 = [v28 sessionID];
  uint64_t v30 = *(void *)(a1 + 40);
  uint64_t v27 = [*(id *)(a1 + 32) configuration];
  uint64_t v22 = [v27 sessionType];
  uint64_t v26 = [*(id *)(a1 + 32) configuration];
  id v21 = [v26 estimatedEndDate];
  uint64_t v25 = [*(id *)(a1 + 32) configuration];
  id v7 = [v25 coarseEstimatedEndDate];
  id v8 = [*(id *)(a1 + 32) configuration];
  id v9 = [v8 destination];
  uint64_t v10 = [v9 destinationType];
  id v11 = [*(id *)(a1 + 32) configuration];
  uint32_t v12 = [v11 destination];
  id v13 = [v12 destinationMapItem];
  id v31 = (void *)[v5 initWithDate:v29 messageID:v6 sessionID:v24 invitationTokenDict:v30 sessionType:v22 estimatedEndTime:v21 coarseEstimatedEndTime:v7 destinationType:v10 destinationMapItem:v13 lowPowerModeWarningState:v23];

  id v14 = [*(id *)(a1 + 48) messagingService];
  uint64_t v15 = [v14 madridMessenger];
  uint64_t v16 = [*(id *)(a1 + 32) configuration];
  id v17 = [v16 conversation];
  id v18 = [v31 summaryText];
  [v15 sendMadridMessage:v31 associatedGUID:0 toConversation:v17 summaryText:v18 completion:&__block_literal_global_261];

  uint64_t v19 = *(void **)(a1 + 48);
  uint64_t v20 = [*(id *)(a1 + 32) configuration];
  [v19 _endSessionEarlyIfNecessaryWithConfiguration:v20];
}

void __69__SMInitiatorService__sendSessionStartMessageWithInvitationTokenMap___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v18 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke_2";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%s, sent start message with GUID, %@, success, %ld, error, %@", buf, 0x2Au);
  }

  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F99A48];
    id v11 = [NSString stringWithFormat:@"Unable to send message", *MEMORY[0x1E4F28568]];
    uint64_t v16 = v11;
    uint32_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v13 = (void *)[v9 initWithDomain:v10 code:5 userInfo:v12];

    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[SMInitiatorService _sendSessionStartMessageWithInvitationTokenMap:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, messages unable to send start message, error: %@", buf, 0x16u);
    }
  }
}

- (void)_endSessionEarlyIfNecessaryWithConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, starting", buf, 0xCu);
  }

  if ([v4 sessionType] == 4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke;
    v7[3] = &unk_1E6B96DC0;
    v7[4] = self;
    id v8 = v4;
    [(SMInitiatorService *)self _fetchCurrentWorkoutSnapshotWithHandler:v7];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]";
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%s, not ending session because not workout-bound", buf, 0xCu);
    }
  }
}

void __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = [v5 isWorkoutOngoing];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, workoutSnapshot: %@, isWorkoutOngoing: %{Bool}d", buf, 0x1Cu);
  }

  if (v5 && ([v5 isWorkoutOngoing] & 1) != 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, session continuing", buf, 0xCu);
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, ending session because there no longer a workout", buf, 0xCu);
    }

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) sessionID];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke_266;
    v12[3] = &unk_1E6B93748;
    id v13 = *(id *)(a1 + 40);
    id v14 = v6;
    [v10 _endSessionForSessionID:v11 reason:8 handler:v12];

    id v8 = v13;
  }
}

void __67__SMInitiatorService__endSessionEarlyIfNecessaryWithConfiguration___block_invoke_266(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sessionID];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315650;
    id v6 = "-[SMInitiatorService _endSessionEarlyIfNecessaryWithConfiguration:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "%s, session ended for sessionID, %@, error, %@", (uint8_t *)&v5, 0x20u);
  }
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SMInitiatorService_modifySessionWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__SMInitiatorService_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifySessionWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 modifySessionWithConfiguration:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifySessionWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __62__SMInitiatorService__modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SMInitiatorService_handoffSessionForSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__SMInitiatorService_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handoffSessionForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 handoffSessionForSessionID:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handoffSessionForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __58__SMInitiatorService__handoffSessionForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SMInitiatorService_endSessionForSessionID_reason_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __60__SMInitiatorService_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSessionForSessionID:*(void *)(a1 + 40) reason:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v11 = [(SMInitiatorService *)self sessionManager];
    [v11 endSessionForSessionID:v9 reason:a4 handler:v10];
  }
  else
  {
    id v12 = [(SMInitiatorService *)self dispatcher];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke;
    v18[3] = &unk_1E6B90C40;
    void v18[4] = self;
    id v19 = v9;
    unint64_t v21 = a4;
    id v20 = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke_2;
    v16[3] = &unk_1E6B90D08;
    void v16[4] = self;
    id v17 = v20;
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    [v12 enqueueBlock:v18, v16, @"%@-%@", v14, v15 failureBlock description];
  }
}

uint64_t __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSessionForSessionID:*(void *)(a1 + 40) reason:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

void __61__SMInitiatorService__endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SMInitiatorService_sendSafetyCacheForSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__SMInitiatorService_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSafetyCacheForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 sendSafetyCacheForSessionID:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSafetyCacheForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __59__SMInitiatorService__sendSafetyCacheForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SMInitiatorService_respondToTriggerPromptForSessionID_response_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __74__SMInitiatorService_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _respondToTriggerPromptForSessionID:*(void *)(a1 + 40) response:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v11 = [(SMInitiatorService *)self sessionManager];
    [v11 respondToTriggerPromptForSessionID:v9 response:a4 handler:v10];
  }
  else
  {
    id v12 = [(SMInitiatorService *)self dispatcher];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke;
    v18[3] = &unk_1E6B90C40;
    void v18[4] = self;
    id v19 = v9;
    int64_t v21 = a4;
    id v20 = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
    v16[3] = &unk_1E6B90D08;
    void v16[4] = self;
    id v17 = v20;
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    [v12 enqueueBlock:v18, v16, @"%@-%@", v14, v15 failureBlock description];
  }
}

uint64_t __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _respondToTriggerPromptForSessionID:*(void *)(a1 + 40) response:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

void __75__SMInitiatorService__respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SMInitiatorService_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __78__SMInitiatorService_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptDestinationAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 promptDestinationAnomalyVerificationWithContext:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptDestinationAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __79__SMInitiatorService__promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SMInitiatorService_promptTimerEndedVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__SMInitiatorService_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptTimerEndedVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 promptTimerEndedVerificationWithContext:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptTimerEndedVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __71__SMInitiatorService__promptTimerEndedVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SMInitiatorService_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __76__SMInitiatorService_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptRoundTripAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 promptRoundTripAnomalyVerificationWithContext:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptRoundTripAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __77__SMInitiatorService__promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMInitiatorService_promptSafeArrivalWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__SMInitiatorService_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptSafeArrivalWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 promptSafeArrivalWithContext:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptSafeArrivalWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __60__SMInitiatorService__promptSafeArrivalWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SMInitiatorService_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__SMInitiatorService_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptWorkoutAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v9 = [(SMInitiatorService *)self sessionManager];
    [v9 promptWorkoutAnomalyVerificationWithContext:v7 handler:v8];
  }
  else
  {
    id v10 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
    v16[3] = &unk_1E6B90660;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2;
    v14[3] = &unk_1E6B90D08;
    v14[4] = self;
    id v15 = v18;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    [v10 enqueueBlock:v16, v14, @"%@-%@", v12, v13 failureBlock description];
  }
}

uint64_t __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptWorkoutAnomalyVerificationWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __75__SMInitiatorService__promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SMInitiatorService_fetchCurrentSessionStateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__SMInitiatorService_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentSessionStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentSessionStateWithHandler:(id)a3
{
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self sessionManager];
    [v6 fetchCurrentSessionStateWithHandler:v5];
  }
  else
  {
    id v7 = [(SMInitiatorService *)self dispatcher];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke;
    v13[3] = &unk_1E6B90CE0;
    v13[4] = self;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke_2;
    v11[3] = &unk_1E6B90D08;
    v11[4] = self;
    id v12 = v14;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 enqueueBlock:v13, v11, @"%@-%@", v9, v10 failureBlock description];
  }
}

uint64_t __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentSessionStateWithHandler:*(void *)(a1 + 40)];
}

void __59__SMInitiatorService__fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__SMInitiatorService_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __82__SMInitiatorService_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self deviceConfigurationChecker];
    [v6 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v5];
  }
  else
  {
    id v7 = [(SMInitiatorService *)self dispatcher];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
    v13[3] = &unk_1E6B90CE0;
    v13[4] = self;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
    v11[3] = &unk_1E6B90D08;
    v11[4] = self;
    id v12 = v14;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 enqueueBlock:v13, v11, @"%@-%@", v9, v10 failureBlock description];
  }
}

uint64_t __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:*(void *)(a1 + 40)];
}

void __83__SMInitiatorService__fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SMInitiatorService_fetchCurrentLocalSessionStateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __63__SMInitiatorService_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentLocalSessionStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v5 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self sessionManager];
    [v6 fetchCurrentLocalSessionStateWithHandler:v5];
  }
  else
  {
    id v7 = [(SMInitiatorService *)self dispatcher];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v13[3] = &unk_1E6B90CE0;
    v13[4] = self;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
    v11[3] = &unk_1E6B90D08;
    v11[4] = self;
    id v12 = v14;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 enqueueBlock:v13, v11, @"%@-%@", v9, v10 failureBlock description];
  }
}

uint64_t __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentLocalSessionStateWithHandler:*(void *)(a1 + 40)];
}

void __64__SMInitiatorService__fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMInitiatorService_sendHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__SMInitiatorService_sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHeartbeatForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int64_t v21 = "-[SMInitiatorService _sendHeartbeatForSessionID:handler:]";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, heartbeat received for sessionID, %@", buf, 0x16u);
  }

  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v10 = [(SMInitiatorService *)self watchdog];
    [v10 receiveHeartbeatForSessionID:v7 handler:v8];
  }
  else
  {
    id v11 = [(SMInitiatorService *)self dispatcher];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke;
    v17[3] = &unk_1E6B90660;
    void v17[4] = self;
    id v18 = v7;
    id v19 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke_2;
    v15[3] = &unk_1E6B90D08;
    void v15[4] = self;
    id v16 = v19;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    [v11 enqueueBlock:v17, v15, @"%@-%@", v13, v14 failureBlock description];
  }
}

uint64_t __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHeartbeatForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __57__SMInitiatorService__sendHeartbeatForSessionID_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SMInitiatorService_fetchSOSReceiversWithCompletion___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__SMInitiatorService_fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSOSReceiversWithCompletion:*(void *)(a1 + 40)];
}

- (void)_fetchSOSReceiversWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke;
  block[3] = &unk_1E6B921E0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  SEL v14 = a2;
  dispatch_async(v6, block);

  id v8 = [(SMInitiatorService *)self sessionManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_4;
  v10[3] = &unk_1E6B92A68;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchSOSReceiversWithCompletion:v10];
}

void __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasSetupObjectsDependentOnPersistenceStack] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) dispatcher];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_2;
    v10[3] = &unk_1E6B90CE0;
    id v3 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_3;
    v8[3] = &unk_1E6B90D08;
    id v4 = *(id *)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v4;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v2 enqueueBlock:v10, v8, @"%@-%@", v6, v7 failureBlock description];
  }
}

uint64_t __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSOSReceiversWithCompletion:*(void *)(a1 + 40)];
}

void __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], v2);
}

uint64_t __55__SMInitiatorService__fetchSOSReceiversWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SMInitiatorService_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__SMInitiatorService_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInitiatorSafetyCacheForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void, void, void, void, void))v8;
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v17 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v17 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v10 = [(SMInitiatorService *)self getCacheManagerForSessionID:v7];
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        id v13 = [v7 UUIDString];
        SEL v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        id v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v41 = v13;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        long long v45 = v16;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", buf, 0x20u);
      }
      [v10 fetchInitiatorSafetyCacheForSessionID:v7 completion:v9];
    }
    else
    {
      if (v12)
      {
        __int16 v22 = [v7 UUIDString];
        id v23 = (objc_class *)objc_opt_class();
        uint64_t v24 = NSStringFromClass(v23);
        uint64_t v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v41 = v22;
        __int16 v42 = 2112;
        id v43 = v24;
        __int16 v44 = 2112;
        long long v45 = v25;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No CacheManager found Invalid", buf, 0x20u);
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F99A48];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      __int16 v28 = [NSString stringWithFormat:@"No CacheManager found Invalid session id"];
      uint64_t v39 = v28;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v30 = (void *)[v26 initWithDomain:v27 code:7 userInfo:v29];

      ((void (**)(void, void, void, void, void, void, void *))v9)[2](v9, 0, 0, 0, 0, 0, v30);
    }
    goto LABEL_17;
  }
  id v18 = [(SMInitiatorService *)self dispatcher];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  v35[3] = &unk_1E6B90660;
  v35[4] = self;
  id v36 = v7;
  __int16 v37 = v9;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_2;
  v31[3] = &unk_1E6B92118;
  uint64_t v34 = v37;
  id v32 = v36;
  uint64_t v33 = self;
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  int64_t v21 = NSStringFromSelector(a2);
  [v18 enqueueBlock:v35, v31, @"%@-%@", v20, v21 failureBlock description];

LABEL_18:
}

uint64_t __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInitiatorSafetyCacheForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __72__SMInitiatorService__fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) invocationError];
  (*(void (**)(uint64_t, uint64_t, void, void, void, void, id))(v2 + 16))(v2, v1, 0, 0, 0, 0, v3);
}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 UUIDString];
    id v11 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    int64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", buf, 0x20u);
  }
  SEL v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SMInitiatorService_fetchSessionReceiptForSessionID_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v18 = v7;
  id v19 = v8;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v14, block);
}

uint64_t __65__SMInitiatorService_fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSessionReceiptForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    id v19 = "Invalid parameter not satisfying: sessionID";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_12;
  }
  if (!v8)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v19 = "Invalid parameter not satisfying: completion";
    goto LABEL_17;
  }
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    sessionReceiptZone = self->_sessionReceiptZone;
    if (!sessionReceiptZone)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL v12 = [v7 UUIDString];
        id v13 = (objc_class *)objc_opt_class();
        SEL v14 = NSStringFromClass(v13);
        id v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = v12;
        __int16 v34 = 2112;
        double v35 = v14;
        __int16 v36 = 2112;
        __int16 v37 = v15;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No _sessionReceiptZone Object found", buf, 0x20u);
      }
      [(SMInitiatorService *)self _initializeSessionReceiptZone];
      sessionReceiptZone = self->_sessionReceiptZone;
    }
    id v16 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke_271;
    v24[3] = &unk_1E6B96DE8;
    id v25 = v7;
    uint64_t v26 = self;
    SEL v28 = a2;
    id v27 = v9;
    [(SMSessionReceiptZone *)sessionReceiptZone fetchSessionReceiptRecordWithSessionID:v25 qos:v16 completion:v24];

    id v17 = v25;
  }
  else
  {
    id v20 = [(SMInitiatorService *)self dispatcher];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke;
    v29[3] = &unk_1E6B90660;
    v29[4] = self;
    id v30 = v7;
    id v31 = v9;
    int64_t v21 = (objc_class *)objc_opt_class();
    __int16 v22 = NSStringFromClass(v21);
    id v23 = NSStringFromSelector(a2);
    [v20 enqueueBlock:v29, @"%@-%@", v22, v23 description];

    id v17 = v30;
  }

LABEL_15:
}

uint64_t __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSessionReceiptForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __66__SMInitiatorService__fetchSessionReceiptForSessionID_completion___block_invoke_271(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      SEL v14 = [*(id *)(a1 + 32) UUIDString];
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v18 = 138413058;
      id v19 = v14;
      __int16 v20 = 2112;
      int64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session receipt fetch failed with error %@", (uint8_t *)&v18, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(a1 + 32) UUIDString];
    id v11 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v18 = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    int64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session receipt fetch success", (uint8_t *)&v18, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)scheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = v11;
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    SEL v14 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    SEL v14 = "Invalid parameter not satisfying: guid";
    goto LABEL_12;
  }
  if (!v11)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    SEL v14 = "Invalid parameter not satisfying: date";
    goto LABEL_12;
  }
  if (![(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v15 = [(SMInitiatorService *)self dispatcher];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__SMInitiatorService_scheduledSendMessageScheduledForSessionID_guid_date___block_invoke;
    v19[3] = &unk_1E6B96E10;
    v19[4] = self;
    id v20 = v9;
    id v21 = v10;
    id v22 = v12;
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    int v18 = NSStringFromSelector(a2);
    [v15 enqueueBlock:v19, @"%@-%@", v17, v18 description];

    goto LABEL_14;
  }
  id v13 = [(SMInitiatorService *)self sessionManager];
  [v13 onScheduledSendMessageScheduledForSessionID:v9 guid:v10 date:v12];
LABEL_13:

LABEL_14:
}

uint64_t __74__SMInitiatorService_scheduledSendMessageScheduledForSessionID_guid_date___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduledSendMessageScheduledForSessionID:*(void *)(a1 + 40) guid:*(void *)(a1 + 48) date:*(void *)(a1 + 56)];
}

- (void)scheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v11 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_8;
  }
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v11 = "Invalid parameter not satisfying: guid";
    goto LABEL_12;
  }
  if (![(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    BOOL v12 = [(SMInitiatorService *)self dispatcher];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SMInitiatorService_scheduledSendMessageCanceledForSessionID_guid___block_invoke;
    v16[3] = &unk_1E6B92F80;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v9;
    id v13 = (objc_class *)objc_opt_class();
    SEL v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    [v12 enqueueBlock:v16, @"%@-%@", v14, v15 description];

    goto LABEL_9;
  }
  id v10 = [(SMInitiatorService *)self sessionManager];
  [v10 onScheduledSendMessageCanceledForSessionID:v7 guid:v9];
LABEL_8:

LABEL_9:
}

uint64_t __68__SMInitiatorService_scheduledSendMessageCanceledForSessionID_guid___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduledSendMessageCanceledForSessionID:*(void *)(a1 + 40) guid:*(void *)(a1 + 48)];
}

- (void)scheduledSendMessageSent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (![(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
    {
      id v7 = [(SMInitiatorService *)self dispatcher];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__SMInitiatorService_scheduledSendMessageSent___block_invoke;
      v11[3] = &unk_1E6B90BF0;
      v11[4] = self;
      id v12 = v5;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      [v7 enqueueBlock:v11, @"%@-%@", v9, v10 description];

      goto LABEL_8;
    }
    id v6 = [(SMInitiatorService *)self sessionManager];
    [v6 onScheduledSendForSessionID:v5];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }

LABEL_8:
}

uint64_t __47__SMInitiatorService_scheduledSendMessageSent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduledSendMessageSent:*(void *)(a1 + 40)];
}

- (void)cacheManagerCleanedUpForSessionID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
    goto LABEL_13;
  }
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v6 = [(SMInitiatorService *)self getCacheManagerForSessionID:v5];
    if (v6)
    {
      id v7 = [(SMInitiatorService *)self cacheManagerArray];
      [v7 removeObject:v6];

      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v6 sessionUUID];
        id v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        id v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v24 = v9;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        __int16 v27 = 2112;
        SEL v28 = v12;
        id v13 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,remove SMInitiatorCacheManager";
        SEL v14 = v8;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_1D9BFA000, v14, v15, v13, buf, 0x20u);
      }
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [v5 UUIDString];
        id v20 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v20);
        id v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v24 = v9;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        __int16 v27 = 2112;
        SEL v28 = v12;
        id v13 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,no SMInitiatorCacheManager to remove";
        SEL v14 = v8;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
        goto LABEL_11;
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  id v16 = [(SMInitiatorService *)self dispatcher];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__SMInitiatorService_cacheManagerCleanedUpForSessionID___block_invoke;
  v21[3] = &unk_1E6B90BF0;
  void v21[4] = self;
  id v22 = v5;
  id v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  id v19 = NSStringFromSelector(a2);
  [v16 enqueueBlock:v21, @"%@-%@", v18, v19 description];

LABEL_14:
}

uint64_t __56__SMInitiatorService_cacheManagerCleanedUpForSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacheManagerCleanedUpForSessionID:*(void *)(a1 + 40)];
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      SEL v14 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@,%@,responding to change in group membership", (uint8_t *)&v11, 0x16u);
    }
    id v10 = [(SMInitiatorService *)self sessionManager];
    [v10 iMessageGroupMembershipChangedFor:v5];
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SMInitiatorService *)self sessionManager];
    [v5 iMessageGroupDisplayNameChangedFor:v4];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v6, 2u);
    }
  }
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SMInitiatorService *)self sessionManager];
    [v5 kickedFromIMessageGroupWith:v4];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v6, 2u);
    }
  }
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMInitiatorService_onSessionStateChanged_forActiveDevice___block_invoke;
  block[3] = &unk_1E6B91328;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __60__SMInitiatorService_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStateChanged:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  v103[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    if (v4)
    {
      if ([v7 sessionState] == 1)
      {
        uint64_t v8 = [(SMInitiatorService *)self pendingInitializationRequest];
        if (v8)
        {
          id v9 = (void *)v8;
          id v10 = [(SMInitiatorService *)self pendingInitializationRequest];
          BOOL v11 = [v10 sessionID];
          id v12 = [v7 configuration];
          __int16 v13 = [v12 sessionID];
          int v14 = [v11 isEqual:v13];

          if (v14)
          {
            uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [(SMInitiatorService *)self pendingInitializationRequest];
              *(_DWORD *)buf = 136315394;
              id v95 = "-[SMInitiatorService _onSessionStateChanged:forActiveDevice:]";
              __int16 v96 = 2112;
              id v97 = v16;
              _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%s, responding to previous initialization request %@", buf, 0x16u);
            }
            id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v18 = *MEMORY[0x1E4F99A48];
            uint64_t v102 = *MEMORY[0x1E4F28568];
            id v19 = [NSString stringWithFormat:@"Transitioned to NotActive for unknown reason"];
            v103[0] = v19;
            id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:&v102 count:1];
            id v21 = (void *)[v17 initWithDomain:v18 code:0 userInfo:v20];

            id v22 = [(SMInitiatorService *)self pendingInitializationRequest];
            id v23 = [v22 handler];
            ((void (**)(void, void, void, void, void *))v23)[2](v23, 0, 0, 0, v21);

            [(SMInitiatorService *)self setPendingInitializationRequest:0];
          }
        }
      }
      uint64_t v24 = [v7 sessionState];
      __int16 v25 = [v7 configuration];
      uint64_t v26 = [v25 sessionID];
      if (v24 != 10)
      {
        uint64_t v29 = [(SMInitiatorService *)self getCacheManagerForSessionID:v26];

        if (!v29)
        {
          if (([v7 isEndSessionState] & 1) == 0)
          {
            v66 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              __int16 v71 = [v7 configuration];
              id v72 = [v71 sessionID];
              __int16 v73 = (objc_class *)objc_opt_class();
              id v74 = NSStringFromClass(v73);
              __int16 v75 = NSStringFromSelector(a2);
              BOOL v76 = [(SMInitiatorService *)self sessionsLoadedFromDisk];
              *(_DWORD *)buf = 138413058;
              id v95 = v72;
              __int16 v96 = 2112;
              id v97 = v74;
              __int16 v98 = 2112;
              id v99 = v75;
              __int16 v100 = 1024;
              LODWORD(v101) = v76;
              _os_log_error_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded,%d,could not find SMInitiatorCacheManager", buf, 0x26u);
            }
            uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              __int16 v67 = (objc_class *)objc_opt_class();
              NSStringFromClass(v67);
              v68 = (char *)objc_claimAutoreleasedReturnValue();
              __int16 v69 = NSStringFromSelector(a2);
              BOOL v70 = [(SMInitiatorService *)self sessionsLoadedFromDisk];
              *(_DWORD *)buf = 138412802;
              id v95 = v68;
              __int16 v96 = 2112;
              id v97 = v69;
              __int16 v98 = 1024;
              LODWORD(v99) = v70;
              _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,loaded,%d,SMInitiatorCacheManager does not exist", buf, 0x1Cu);
            }
            goto LABEL_24;
          }
          uint64_t v29 = 0;
        }
LABEL_23:
        [v29 onSessionStateChanged:v7 forActiveDevice:v4];
        [(SMInitiatorService *)self handleSessionStateForNonActiveSessions:v7];
LABEL_24:

        goto LABEL_25;
      }
      __int16 v27 = [v7 configuration];
      SEL v28 = [v27 conversation];
      uint64_t v29 = [(SMInitiatorService *)self _createInitiatorCacheManagerForSessionID:v26 conversation:v28];
    }
    else
    {
      __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        double v35 = [v7 configuration];
        __int16 v36 = [v35 sessionID];
        __int16 v37 = (objc_class *)objc_opt_class();
        uint64_t v38 = NSStringFromClass(v37);
        uint64_t v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        id v95 = v36;
        __int16 v96 = 2112;
        id v97 = v38;
        __int16 v98 = 2112;
        id v99 = v39;
        __int16 v100 = 2112;
        id v101 = v7;
        _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@", buf, 0x2Au);
      }
      id v40 = [v7 configuration];
      id v41 = [v40 sessionID];
      uint64_t v29 = [(SMInitiatorService *)self getCacheManagerForSessionID:v41];

      if (![v7 isActiveState] || v29) {
        goto LABEL_23;
      }
      aSelector = a2;
      id v42 = objc_alloc(MEMORY[0x1E4F99890]);
      id v43 = objc_opt_new();
      __int16 v44 = [v7 configuration];
      long long v45 = [v44 sessionID];
      uint64_t v46 = [v7 safetyCacheKey];
      long long v47 = [v7 allowReadToken];
      __int16 v48 = [v7 scheduledSendMessageGUID];
      id v49 = objc_opt_new();
      LOBYTE(v79) = 1;
      LOWORD(v78) = 0;
      uint64_t v90 = objc_msgSend(v42, "initWithIdentifier:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v43, 0, 0, 0, 0, 0, -1.0, -1.0, -1.0, 0,
              0,
              v45,
              v46,
              v47,
              v48,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              -1,
              -1,
              -1,
              -1,
              -1,
              -1,
              -1,
              v78,
              0,
              0,
              v79,
              0,
              v49,
              0,
              0,
              0,
              0);

      uint64_t v50 = [SMInitiatorCacheManager alloc];
      safetyCacheStore = self->_safetyCacheStore;
      id v89 = v50;
      defaultsManager = self->_defaultsManager;
      sessionStore = self->_sessionStore;
      locationManager = self->_locationManager;
      uint64_t v51 = [(RTNotifier *)self queue];
      batteryManager = self->_batteryManager;
      id v84 = (void *)v51;
      messagingService = self->_messagingService;
      xpcActivityManager = self->_xpcActivityManager;
      networkOfInterestManager = self->_networkOfInterestManager;
      authorizationManager = self->_authorizationManager;
      wristStateManager = self->_wristStateManager;
      vehicleLocationProvider = self->_vehicleLocationProvider;
      activeSessionDetailsZone = self->_activeSessionDetailsZone;
      v57 = [(SMInitiatorService *)self healthKitManager];
      id v58 = [(SMInitiatorService *)self platform];
      id v59 = [(SMInitiatorService *)self appDeletionManager];
      __int16 v77 = networkOfInterestManager;
      __int16 v25 = (void *)v90;
      uint64_t v29 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:](v89, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:", v90, 0, safetyCacheStore, sessionStore, defaultsManager, locationManager, v84, batteryManager, xpcActivityManager, messagingService, v77, authorizationManager, wristStateManager, vehicleLocationProvider, activeSessionDetailsZone,
              v57,
              v58,
              v59);

      [v29 setDelegate:self];
      [v29 _setupFetchOnZoneUpdates];
      v60 = [(SMInitiatorService *)self cacheManagerArray];
      [v60 addObject:v29];

      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v61 = [v7 configuration];
        id v62 = [v61 sessionID];
        id v63 = (objc_class *)objc_opt_class();
        int64x2_t v64 = NSStringFromClass(v63);
        v65 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        id v95 = v62;
        __int16 v96 = 2112;
        id v97 = v64;
        __int16 v98 = 2112;
        id v99 = v65;
        __int16 v100 = 2112;
        id v101 = v29;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,created non-active cache manager, %@", buf, 0x2Au);
      }
      BOOL v4 = 0;
    }

    goto LABEL_23;
  }
  id v30 = [(SMInitiatorService *)self dispatcher];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __61__SMInitiatorService__onSessionStateChanged_forActiveDevice___block_invoke;
  v91[3] = &unk_1E6B91328;
  v91[4] = self;
  id v92 = v7;
  BOOL v93 = v4;
  id v31 = (objc_class *)objc_opt_class();
  id v32 = NSStringFromClass(v31);
  uint64_t v33 = NSStringFromSelector(a2);
  [v30 enqueueBlock:v91, @"%@-%@", v32, v33 description];

LABEL_25:
}

uint64_t __61__SMInitiatorService__onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStateChanged:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SMInitiatorService_onSessionResumedWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E6B91328;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __64__SMInitiatorService_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionResumedWithState:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(SMInitiatorService *)self setSessionManagerBootstrapped:1];
  id v8 = [v7 configuration];
  id v9 = [v8 sessionID];
  id v10 = [(SMInitiatorService *)self getCacheManagerForSessionID:v9];

  if (v10 || ([v7 isEndSessionState] & 1) != 0)
  {
    [v10 onSessionResumedWithState:v7 forActiveDevice:v4];
    [(SMInitiatorService *)self handleSessionStateForNonActiveSessions:v7];
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v7 configuration];
      uint64_t v18 = [v17 sessionID];
      id v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      id v21 = NSStringFromSelector(a2);
      int v26 = 138413058;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      __int16 v32 = 1024;
      BOOL v33 = [(SMInitiatorService *)self sessionsLoadedFromDisk];
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,loaded,%d,could not find SMInitiatorCacheManager", (uint8_t *)&v26, 0x26u);
    }
    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      id v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = NSStringFromSelector(a2);
      BOOL v25 = [(SMInitiatorService *)self sessionsLoadedFromDisk];
      int v26 = 138412802;
      __int16 v27 = v23;
      __int16 v28 = 2112;
      uint64_t v29 = v24;
      __int16 v30 = 1024;
      LODWORD(v31) = v25;
      _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,loaded,%d,SMInitiatorCacheManager does not exist", (uint8_t *)&v26, 0x1Cu);
    }
  }
  BOOL v11 = [(SMInitiatorService *)self dispatcher];
  int v12 = [v11 invocationsPending];

  if (v12)
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315138;
      __int16 v27 = "-[SMInitiatorService _onSessionResumedWithState:forActiveDevice:]";
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, dispatching work on SMInitiatorService queue", (uint8_t *)&v26, 0xCu);
    }

    int v14 = [(SMInitiatorService *)self dispatcher];
    [v14 dispatchPendingInvocations];
  }
}

- (void)handleSessionStateForNonActiveSessions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(SMInitiatorService *)self cacheManagerArray];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v7 = 138412802;
    long long v21 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        int v12 = [v4 configuration:v21];
        __int16 v13 = [v12 sessionID];
        int v14 = [v11 sessionUUID];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v11 sessionUUID];
            uint64_t v18 = (objc_class *)objc_opt_class();
            id v19 = NSStringFromClass(v18);
            id v20 = NSStringFromSelector(a2);
            *(_DWORD *)buf = v21;
            __int16 v28 = v17;
            __int16 v29 = 2112;
            __int16 v30 = v19;
            __int16 v31 = 2112;
            __int16 v32 = v20;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup this non active session", buf, 0x20u);
          }
          [v11 cleanupNonActiveSession];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6 = a3;
  long long v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SMInitiatorService_onSecondarySOSTriggerWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E6B91328;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __69__SMInitiatorService_onSecondarySOSTriggerWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSecondarySOSTriggerWithState:*(void *)(a1 + 40) forActiveDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if ([v7 sessionState] == 4)
    {
      uint64_t v9 = [v8 configuration];
      id v10 = [v9 sessionID];
      BOOL v11 = [(SMInitiatorService *)self getCacheManagerForSessionID:v10];

      [v11 onSecondarySOSTriggerWithState:v8 forActiveDevice:1];
    }
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [v8 configuration];
      int v14 = [v13 sessionID];
      char v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(a2);
      int v18 = 138413058;
      id v19 = v14;
      __int16 v20 = 2112;
      long long v21 = v16;
      __int16 v22 = 2112;
      long long v23 = v17;
      __int16 v24 = 2112;
      long long v25 = v8;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@", (uint8_t *)&v18, 0x2Au);
    }
  }
}

- (void)onBecomingActiveDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SMInitiatorService_onBecomingActiveDevice___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__SMInitiatorService_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBecomingActiveDevice:*(void *)(a1 + 40)];
}

- (void)_onBecomingActiveDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 configuration];
  id v7 = [v6 sessionID];
  id v8 = [(SMInitiatorService *)self getCacheManagerForSessionID:v7];

  if (!v8)
  {
    uint64_t v9 = [v5 configuration];
    id v10 = [v9 sessionID];
    BOOL v11 = [v5 configuration];
    int v12 = [v11 conversation];
    id v8 = [(SMInitiatorService *)self _createInitiatorCacheManagerForSessionID:v10 conversation:v12];
  }
  [v8 onBecomingActiveDevice:v5];
  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = [v8 sessionUUID];
    char v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(a2);
    int v18 = 138412802;
    id v19 = v14;
    __int16 v20 = 2112;
    long long v21 = v16;
    __int16 v22 = 2112;
    long long v23 = v17;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,notify cache manager to become active", (uint8_t *)&v18, 0x20u);
  }
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SMInitiatorService_onBecomingNonActiveDevice___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__SMInitiatorService_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBecomingNonActiveDevice:*(void *)(a1 + 40)];
}

- (void)_onBecomingNonActiveDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 configuration];
  id v7 = [v6 sessionID];
  id v8 = [(SMInitiatorService *)self getCacheManagerForSessionID:v7];

  if (!v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v19 = [0 sessionUUID];
      __int16 v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      __int16 v22 = NSStringFromSelector(a2);
      int v23 = 138412802;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      __int16 v28 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,becoming non-active but there is no cache manager,creating one...", (uint8_t *)&v23, 0x20u);
    }
    id v10 = [v5 configuration];
    BOOL v11 = [v10 sessionID];
    int v12 = [v5 configuration];
    __int16 v13 = [v12 conversation];
    id v8 = [(SMInitiatorService *)self _createInitiatorCacheManagerForSessionID:v11 conversation:v13];
  }
  [v8 onBecomingNonActiveDevice:v5];
  int v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    char v15 = [v8 sessionUUID];
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    int v18 = NSStringFromSelector(a2);
    int v23 = 138412802;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,notify cache manager to become non-active", (uint8_t *)&v23, 0x20u);
  }
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SMInitiatorService_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B914E0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __101__SMInitiatorService_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _respondToNotificationWithIdentifier:*(void *)(a1 + 40) sessionIdentifier:*(void *)(a1 + 48) actionIdentifier:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(SMInitiatorService *)self _hasSetupObjectsDependentOnPersistenceStack])
  {
    id v15 = [(SMInitiatorService *)self sessionManager];
    [v15 respondToNotificationWithIdentifier:v11 sessionIdentifier:v12 actionIdentifier:v13 handler:v14];
  }
  else
  {
    id v16 = [(SMInitiatorService *)self dispatcher];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __102__SMInitiatorService__respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
    v20[3] = &unk_1E6B914E0;
    v20[4] = self;
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    id v19 = NSStringFromSelector(a2);
    [v16 enqueueBlock:v20, @"%@-%@", v18, v19 description];
  }
}

uint64_t __102__SMInitiatorService__respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _respondToNotificationWithIdentifier:*(void *)(a1 + 40) sessionIdentifier:*(void *)(a1 + 48) actionIdentifier:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (id)convertEligibilityToSMErrorWithInitiator:(int64_t)a3 receiver:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    if (a4 == 1)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    int64_t v5 = [(SMInitiatorService *)self convertReceiverEligibilityToSMError:a4];
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F99A48];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"Receiver eligibility failure"];
    id v15 = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = &v15;
    id v11 = &v14;
  }
  else
  {
    int64_t v5 = -[SMInitiatorService convertInitiatorEligibilityToSMError:](self, "convertInitiatorEligibilityToSMError:", a3, a4);
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F99A48];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"Initiator eligibility failure"];
    v17[0] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = (void **)v17;
    id v11 = &v16;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v4 = (void *)[v6 initWithDomain:v7 code:v5 userInfo:v12];

LABEL_7:

  return v4;
}

- (int64_t)convertInitiatorEligibilityToSMError:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0xB) {
    return 25;
  }
  else {
    return qword_1DA0FF960[a3 - 2];
  }
}

- (int64_t)convertReceiverEligibilityToSMError:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 6) {
    return 34;
  }
  else {
    return a3 + 33;
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Shutdown Initiator Service", v13, 2u);
  }

  id v6 = [(SMInitiatorService *)self sessionStore];
  [v6 removeObserver:self];

  uint64_t v7 = [(SMInitiatorService *)self safetyCacheStore];
  [v7 removeObserver:self];

  id v8 = [(SMInitiatorService *)self sessionManager];
  [v8 removeObserver:self];

  uint64_t v9 = [(SMInitiatorService *)self dispatcher];
  [v9 shutdown];

  id v10 = [(SMInitiatorService *)self messagingService];
  [v10 removeObserver:self];

  id v11 = [(SMInitiatorService *)self healthKitManager];
  [v11 removeObserver:self];

  sessionMetricManager = self->_sessionMetricManager;
  self->_sessionMetricManager = 0;

  v4[2](v4, 0);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (SMSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)fetchAllZonesRetried
{
  return self->_fetchAllZonesRetried;
}

- (void)setFetchAllZonesRetried:(BOOL)a3
{
  self->_fetchAllZonesRetried = a3;
}

- (BOOL)frequentSingleShotFetchAllZonesInProgress
{
  return self->_frequentSingleShotFetchAllZonesInProgress;
}

- (void)setFrequentSingleShotFetchAllZonesInProgress:(BOOL)a3
{
  self->_frequentSingleShotFetchAllZonesInProgress = a3;
}

- (BOOL)fetchAllZonesFromContainerInProgress
{
  return self->_fetchAllZonesFromContainerInProgress;
}

- (void)setFetchAllZonesFromContainerInProgress:(BOOL)a3
{
  self->_fetchAllZonesFromContainerInProgress = a3;
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

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMSessionMonitor)sessionMonitor
{
  return self->_sessionMonitor;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTNetworkOfInterestManager)networkOfInterestManager
{
  return self->_networkOfInterestManager;
}

- (NSMutableArray)cacheManagerArray
{
  return self->_cacheManagerArray;
}

- (void)setCacheManagerArray:(id)a3
{
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (unint64_t)safetyCacheStoreAvailability
{
  return self->_safetyCacheStoreAvailability;
}

- (void)setSafetyCacheStoreAvailability:(unint64_t)a3
{
  self->_safetyCacheStoreAvailability = a3;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (unint64_t)sessionStoreAvailability
{
  return self->_sessionStoreAvailability;
}

- (void)setSessionStoreAvailability:(unint64_t)a3
{
  self->_sessionStoreAvailability = a3;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (SMDeviceConfigurationChecker)deviceConfigurationChecker
{
  return self->_deviceConfigurationChecker;
}

- (BOOL)sessionsLoadedFromDisk
{
  return self->_sessionsLoadedFromDisk;
}

- (void)setSessionsLoadedFromDisk:(BOOL)a3
{
  self->_sessionsLoadedFromDisk = a3;
}

- (BOOL)sessionManagerBootstrapped
{
  return self->_sessionManagerBootstrapped;
}

- (void)setSessionManagerBootstrapped:(BOOL)a3
{
  self->_sessionManagerBootstrapped = a3;
}

- (SMSessionReceiptZone)sessionReceiptZone
{
  return self->_sessionReceiptZone;
}

- (void)setSessionReceiptZone:(id)a3
{
}

- (SMInitiatorSessionInitializationRequest)pendingInitializationRequest
{
  return self->_pendingInitializationRequest;
}

- (void)setPendingInitializationRequest:(id)a3
{
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (SMSuggestionsManager)suggestionsManager
{
  return self->_suggestionsManager;
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (SMWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (SMActiveSessionZone)activeSessionDetailsZone
{
  return self->_activeSessionDetailsZone;
}

- (void)setActiveSessionDetailsZone:(id)a3
{
}

- (NSTimer)workoutSessionEndBufferTimerAlarm
{
  return self->_workoutSessionEndBufferTimerAlarm;
}

- (void)setWorkoutSessionEndBufferTimerAlarm:(id)a3
{
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
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
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_storeStrong((id *)&self->_workoutSessionEndBufferTimerAlarm, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_suggestionsManager, 0);
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_pendingInitializationRequest, 0);
  objc_storeStrong((id *)&self->_sessionReceiptZone, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_cacheManagerArray, 0);
  objc_storeStrong((id *)&self->_networkOfInterestManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_sessionMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end