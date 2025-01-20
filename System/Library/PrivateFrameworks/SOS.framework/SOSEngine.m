@interface SOSEngine
+ (BOOL)_isBasebandDevice;
+ (BOOL)authorizedToUseContactStore;
+ (id)GPSCoordinatesURLForLocation:(id)a3;
+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 medicalIDName:(id)a5 reason:(int64_t)a6 recipientReason:(unint64_t)a7;
+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 myFullName:(id)a5 myFirstName:(id)a6 reason:(int64_t)a7 recipientReason:(unint64_t)a8;
+ (id)additionalTextForCallbackNumber:(id)a3;
+ (id)additionalTextForCallbackNumber:(id)a3 fullName:(id)a4 firstName:(id)a5;
+ (id)contactStore;
+ (id)firstNameForContact:(id)a3;
+ (id)fullNameForContact:(id)a3;
+ (id)getUrlForTrigger:(int64_t)a3;
+ (id)locationShifter;
+ (id)mapTriggerToActivationReason:(int64_t)a3;
+ (id)meContact;
+ (id)sharedInstance;
+ (void)_sendCKMessage:(id)a3 failureBlock:(id)a4;
+ (void)_sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 recipientReasonMessages:(id)a6 useStandalone:(BOOL)a7 critical:(BOOL)a8 failureBlock:(id)a9;
+ (void)_sendMessageToRecipients:(id)a3 withLocation:(id)a4 isFirstMessage:(BOOL)a5 medicalIDName:(id)a6 Reason:(int64_t)a7;
+ (void)preloadContactStoreIfNecessary;
+ (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4;
- (BOOL)isSendingLocationUpdate;
- (BOOL)isTriggerEnabled:(int64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)locationIsValidToSend:(id)a3;
- (BOOL)notificationEnabledAndContactsExist;
- (CLLocation)lastLocationSent;
- (FKFriendsManager)friendsManager;
- (NSMutableArray)clientConnections;
- (NSXPCListenerDelegate)sosStatusManager;
- (SOSCoreAnalyticsReporting)coreAnalyticsReporter;
- (SOSEngine)init;
- (SOSEngine)initWithoutEntitlement;
- (SOSFlowManagerCoexProtocol)sosFlowManager;
- (SOSPersistentTimerLocationManager)sosPersistentTimerLocationManager;
- (_MKLocationShifter)locationShifter;
- (id)contactsManager;
- (int64_t)currentSOSFlowState;
- (void)SOSSendingLocationUpdateChanged:(id)a3;
- (void)_checkEmergencyCallStatus;
- (void)_checkSOSCallStatus;
- (void)_onEmergencyCallStatusChanged:(id)a3;
- (void)_tuCallCenterStatusChanged:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)broadcastUpdatedSOSStatus:(id)a3;
- (void)contactStoreDidChange;
- (void)databaseWasRebuilt;
- (void)dealloc;
- (void)didDismissSOSBeforeSOSCall:(int64_t)a3;
- (void)dismissSOSWithCompletion:(id)a3;
- (void)fetchMedicalIDName;
- (void)handoffFallbackWithUUID:(id)a3 trigger:(int64_t)a4;
- (void)mostRecentLocationSentWithCompletion:(id)a3;
- (void)notifyEmergencyReasonToSafetyBuddy;
- (void)notifyEmergencyReasonToSafetyBuddyForInternalDevices;
- (void)notifySafetyKitWithSOSStatus:(id)a3;
- (void)retriggerSOSWithUUID:(id)a3 trigger:(int64_t)a4;
- (void)setClientConnections:(id)a3;
- (void)setCoreAnalyticsReporter:(id)a3;
- (void)setFriendsManager:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setSosFlowManager:(id)a3;
- (void)setSosStatusManager:(id)a3;
- (void)sosPersistentTimerLocationManagerTimerFired:(id)a3 location:(id)a4;
- (void)start;
- (void)startSendingLocationUpdateForReason:(int64_t)a3 WithCompletion:(id)a4;
- (void)startSendingLocationUpdateWithCompletion:(id)a3;
- (void)stopSendingLocationUpdate;
- (void)syncState:(id)a3;
- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5;
- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 source:(int64_t)a5 completion:(id)a6;
- (void)updateCurrentSOSButtonPressState:(id)a3;
- (void)updateCurrentSOSInitiationState:(int64_t)a3;
- (void)updateCurrentSOSInteractiveState:(int64_t)a3;
- (void)willStartSendingLocationUpdate;
@end

@implementation SOSEngine

- (SOSEngine)init
{
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.trigger"])
  {
    self = [(SOSEngine *)self initWithoutEntitlement];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (SOSEngine)initWithoutEntitlement
{
  v27.receiver = self;
  v27.super_class = (Class)SOSEngine;
  v2 = [(SOSEngine *)&v27 init];
  if (v2)
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSEngine, init", (uint8_t *)buf, 2u);
    }

    uint64_t v4 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v4;

    id v6 = (id)[getSAServerClass() sharedInstance];
    uint64_t v7 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (SOSContactsManager *)v7;

    uint64_t v9 = +[SOSPersistentTimerLocationManager sharedInstance];
    sosPersistentTimerLocationManager = v2->_sosPersistentTimerLocationManager;
    v2->_sosPersistentTimerLocationManager = (SOSPersistentTimerLocationManager *)v9;

    [(SOSPersistentTimerLocationManager *)v2->_sosPersistentTimerLocationManager setDelegate:v2];
    uint64_t v11 = +[SOSStatusManager sharedInstance];
    sosStatusManager = v2->_sosStatusManager;
    v2->_sosStatusManager = (SOSStatusManager *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_SOSSendingLocationUpdateChanged_ name:@"SOSSendingLocationUpdateChangedNotification" object:0];

    uint64_t v14 = +[SOSCoordinator sharedInstance];
    sosCoordinator = v2->_sosCoordinator;
    v2->_sosCoordinator = (SOSCoordinator *)v14;

    [(SOSCoordinator *)v2->_sosCoordinator addObserver:v2->_sosStatusManager];
    v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v16 addObserver:v2];

    v17 = MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_4);
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__tuCallCenterStatusChanged_ name:*MEMORY[0x1E4FADD90] object:0];

    objc_initWeak(buf, v2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SOSEngine_initWithoutEntitlement__block_invoke_2;
    block[3] = &unk_1E6064830;
    objc_copyWeak(&v25, buf);
    dispatch_async(v17, block);

    uint64_t v19 = +[SOSCoreAnalyticsReporter sharedInstance];
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v19;

    v21 = sos_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "SOSEngine, finished init", v23, 2u);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __35__SOSEngine_initWithoutEntitlement__block_invoke()
{
  id v0 = +[SOSStatusManager sharedInstance];
  [v0 checkSOSStatusOnLaunch];
}

void __35__SOSEngine_initWithoutEntitlement__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__SOSEngine_initWithoutEntitlement__block_invoke_3;
  v3[3] = &unk_1E6064830;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 registerWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
}

void __35__SOSEngine_initWithoutEntitlement__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkEmergencyCallStatus];
  [WeakRetained _checkSOSCallStatus];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"SOSSendingLocationUpdateStopTimeKey"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v6 = [v5 compare:v4] == 1;

    uint64_t v7 = sos_default_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "Stopping location updates based on timeToStopSending: %@", buf, 0xCu);
      }

      [(SOSEngine *)self stopSendingLocationUpdate];
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "Starting location updates based on timeToStopSending: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __18__SOSEngine_start__block_invoke;
      v9[3] = &unk_1E6064858;
      objc_copyWeak(&v10, (id *)buf);
      [(SOSEngine *)self startSendingLocationUpdateWithCompletion:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __18__SOSEngine_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [MEMORY[0x1E4F1C9C8] distantPast];
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = v1;
  }
}

- (void)dealloc
{
  [(SOSCoordinator *)self->_sosCoordinator removeObserver:self->_sosStatusManager];
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SOSEngine;
  [(SOSEngine *)&v5 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SOSEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sSOSEngine;

  return v2;
}

uint64_t __27__SOSEngine_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSOSEngine = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)contactsManager
{
  return self->_contactsManager;
}

- (void)setSosStatusManager:(id)a3
{
}

- (NSXPCListenerDelegate)sosStatusManager
{
  return (NSXPCListenerDelegate *)self->_sosStatusManager;
}

- (void)_tuCallCenterStatusChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 name];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4FADD90]];

    BOOL v8 = sos_default_log();
    uint64_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine, received TUCallCenterCallStatusChangedNotification notification", v10, 2u);
      }

      [(SOSEngine *)self _checkEmergencyCallStatus];
      [(SOSEngine *)self _checkSOSCallStatus];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SOSEngine _tuCallCenterStatusChanged:](v5, v9);
      }
    }
  }
}

- (void)_checkEmergencyCallStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  objc_super v5 = [v4 currentCalls];
  BOOL v6 = (void *)[v3 initWithArray:v5];

  int v7 = [MEMORY[0x1E4FADA90] sharedInstance];
  BOOL v8 = [v7 callsOnDefaultPairedDevice];
  [v6 addObjectsFromArray:v8];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v6;
  id v10 = (id)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v13
          && objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isEmergency", (void)v14))
        {
          id v10 = v13;
          goto LABEL_12;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  [(SOSEngine *)self _onEmergencyCallStatusChanged:v10];
}

- (void)_onEmergencyCallStatusChanged:(id)a3
{
  self->_isEmergencyCallOngoing = a3 != 0;
}

- (void)_checkSOSCallStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v4 = [v3 currentCalls];
  objc_super v5 = (void *)[v2 initWithArray:v4];

  BOOL v6 = [MEMORY[0x1E4FADA90] sharedInstance];
  int v7 = [v6 callsOnDefaultPairedDevice];
  [v5 addObjectsFromArray:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isSOS", (void)v14))
        {
          id v9 = v12;
          goto LABEL_12;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  uint64_t v13 = +[SOSStatusManager sharedInstance];
  [v13 handleSOSCallStatusChange:v9];
}

- (void)SOSSendingLocationUpdateChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SOSEngine *)self isSendingLocationUpdate];
  BOOL v6 = self->_clientConnections;
  objc_sync_enter(v6);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v7 = [(SOSEngine *)self clientConnections];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) remoteObjectProxyWithErrorHandler:&__block_literal_global_330];
        [v11 setSendingLocationUpdate:v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

void __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke_cold_1();
  }
}

- (void)updateCurrentSOSInitiationState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(SOSEngine *)self clientConnections];
    *(_DWORD *)buf = 134218242;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to update current sos initiation state to %ld for connections: %@", buf, 0x16u);
  }
  self->_currentSOSInitiationState = a3;
  if (!a3) {
    [(SOSPersistentTimerLocationManager *)self->_sosPersistentTimerLocationManager stopRequestingLocationUpdates];
  }
  int v7 = self->_clientConnections;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SOSEngine *)self clientConnections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) remoteObjectProxyWithErrorHandler:&__block_literal_global_332];
        [v12 updateClientCurrentSOSInitiationState:a3];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke_cold_1();
  }
}

- (void)updateCurrentSOSInteractiveState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(SOSEngine *)self clientConnections];
    *(_DWORD *)buf = 134218242;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to update current sos interactive state to %ld for connections: %@", buf, 0x16u);
  }
  self->_currentSOSInteractiveState = a3;
  int v7 = self->_clientConnections;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SOSEngine *)self clientConnections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) remoteObjectProxyWithErrorHandler:&__block_literal_global_334];
        [v12 updateClientCurrentSOSInteractiveState:a3];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke_cold_1();
  }
}

- (void)updateCurrentSOSButtonPressState:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(SOSEngine *)self clientConnections];
    *(_DWORD *)buf = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSEngine,attempting to update current sos button press state to %@ for connections: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_currentSOSButtonPressState, a3);
  uint64_t v8 = self->_clientConnections;
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(SOSEngine *)self clientConnections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) remoteObjectProxyWithErrorHandler:&__block_literal_global_336];
        [v13 updateClientCurrentSOSButtonPressState:v5];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

void __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke_cold_1();
  }
}

- (void)dismissSOSWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  obj = self->_clientConnections;
  objc_sync_enter(obj);
  id v5 = [(SOSEngine *)self clientConnections];
  uint64_t v6 = [v5 count];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v7 = [(SOSEngine *)self clientConnections];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke;
        v20[3] = &unk_1E6064880;
        id v12 = v4;
        id v21 = v12;
        long long v13 = [v11 remoteObjectProxyWithErrorHandler:v20];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke_337;
        v15[3] = &unk_1E60648D0;
        long long v17 = v28;
        v18 = v26;
        uint64_t v19 = v6;
        id v16 = v12;
        [v13 dismissClientSOSWithCompletion:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  objc_sync_exit(obj);
}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__SOSEngine_dismissSOSWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke_337(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke_2;
  block[3] = &unk_1E60648A8;
  char v9 = a2;
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = v2;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__SOSEngine_dismissSOSWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 64)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) == *(void *)(result + 56)) {
    return (*(uint64_t (**)(void, void))(*(void *)(result + 32) + 16))(*(void *)(result + 32), *(unsigned __int8 *)(*(void *)(*(void *)(result + 48) + 8) + 24));
  }
  return result;
}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_clientConnections;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v6 = [(SOSEngine *)self clientConnections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) remoteObjectProxyWithErrorHandler:&__block_literal_global_340];
        [v10 didDismissClientSOSBeforeSOSCall:a3];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

void __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke_cold_1();
  }
}

- (void)broadcastUpdatedSOSStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = [v4 description];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine, broadcasting SOSStatus: %@", buf, 0xCu);
  }
  uint64_t v7 = self->_clientConnections;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SOSEngine *)self clientConnections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) remoteObjectProxyWithErrorHandler:&__block_literal_global_342];
        [v12 didUpdateSOSStatus:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke_cold_1();
  }
}

- (void)notifySafetyKitWithSOSStatus:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 resolution] == 4)
  {
    id v4 = [getSAServerClass() sharedInstance];
    [v4 startMonitoringLocation];
  }
  if ([v3 trigger] == 7)
  {
    uint64_t v5 = [v3 resolution];
    if (v5)
    {
      BOOL v6 = v5 == 4;
      uint64_t v7 = sos_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        long long v13 = "-[SOSEngine notifySafetyKitWithSOSStatus:]";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "%s - Notifying clients most recent kappa event, %@", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v8 = [getSAServerClass() sharedInstance];
      uint64_t v9 = [v3 timeOfDetection];
      uint64_t v10 = [v3 timeOfResolution];
      [v8 notifyCrashDetectedAt:v9 resolvedAt:v10 resolvedWithResponse:v6 completion:&__block_literal_global_345];

      uint64_t v11 = [getSAServerClass() sharedInstance];
      [v11 stopMonitoringLocation];
    }
  }
}

- (void)sosPersistentTimerLocationManagerTimerFired:(id)a3 location:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [(SOSEngine *)self locationIsValidToSend:v5];
  uint64_t v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136315650;
    v42 = "-[SOSEngine sosPersistentTimerLocationManagerTimerFired:location:]";
    __int16 v43 = 1024;
    int v44 = v6;
    __int16 v45 = 2112;
    *(void *)v46 = v5;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "%s - isLocationValid: %d location: %@", (uint8_t *)&v41, 0x1Cu);
  }

  if (!v6)
  {

    id v5 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = v8;
  if (!self->_timeLastMessageSent) {
    goto LABEL_32;
  }
  uint64_t v10 = [v8 objectForKey:@"locationUpdateTimerIntervalSeconds"];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 900.0;
  }
  __int16 v14 = [v9 objectForKey:@"locationUpdateMinimumDistanceMeters"];
  id v15 = v14;
  if (v14)
  {
    [v14 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 402.336;
  }
  if (v13 <= 60.0) {
    double v18 = 0.0;
  }
  else {
    double v18 = 10.0;
  }
  [(NSDate *)self->_timeLastMessageSent timeIntervalSinceNow];
  BOOL v19 = 0;
  double v21 = -v20;
  double v22 = v13 - v18;
  lastLocationSent = self->_lastLocationSent;
  if (v5 && lastLocationSent)
  {
    objc_msgSend(v5, "distanceFromLocation:");
    BOOL v19 = v24 > v17;
    if (v22 <= v21 && v24 > v17)
    {
      BOOL v19 = 1;
      int v27 = 1;
      goto LABEL_29;
    }
    lastLocationSent = self->_lastLocationSent;
  }
  if (v5) {
    BOOL v26 = lastLocationSent == 0;
  }
  else {
    BOOL v26 = 0;
  }
  int v27 = v26;
LABEL_29:
  v28 = sos_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_lastLocationSent;
    int v41 = 136316418;
    v42 = "-[SOSEngine sosPersistentTimerLocationManagerTimerFired:location:]";
    __int16 v43 = 1024;
    int v44 = v27;
    __int16 v45 = 1024;
    *(_DWORD *)v46 = v22 <= v21;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v19;
    __int16 v47 = 2112;
    v48 = v29;
    __int16 v49 = 2112;
    id v50 = v5;
    _os_log_impl(&dword_1B3A94000, v28, OS_LOG_TYPE_DEFAULT, "%s - okToSend: %d timeIntervalOk: %d distanceIntervalOk: %d _lastLocationSent: %@ location: %@", (uint8_t *)&v41, 0x32u);
  }

  if (v27)
  {
LABEL_32:
    uint64_t v30 = objc_opt_class();
    v31 = [(SOSContactsManager *)self->_contactsManager phoneNumbersToMessage];
    [v30 _sendMessageToRecipients:v31 withLocation:v5 isFirstMessage:self->_timeLastMessageSent == 0 medicalIDName:self->_medicalIDName Reason:self->_notifyContactsReason];

    objc_storeStrong((id *)&self->_lastLocationSent, v5);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSMostRecentLocationSentChangedNotification", 0, 0, 1u);
    v33 = [MEMORY[0x1E4F1C9C8] date];
    timeLastMessageSent = self->_timeLastMessageSent;
    self->_timeLastMessageSent = v33;
  }
  v35 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v36 = [v35 objectForKey:@"SOSSendingLocationUpdateStopTimeKey"];

  if (v36
    && ([MEMORY[0x1E4F1C9C8] date],
        v37 = objc_claimAutoreleasedReturnValue(),
        uint64_t v38 = [v37 compare:v36],
        v37,
        v38 == 1))
  {
    v39 = sos_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1B3A94000, v39, OS_LOG_TYPE_DEFAULT, "Stopping timer based on timeToStopSending: %@", (uint8_t *)&v41, 0xCu);
    }

    [(SOSEngine *)self stopSendingLocationUpdate];
  }
  else
  {
    v40 = sos_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1B3A94000, v40, OS_LOG_TYPE_DEFAULT, "Not yet reached timeToStopSending: %@", (uint8_t *)&v41, 0xCu);
    }
  }
}

+ (void)_sendMessageToRecipients:(id)a3 withLocation:(id)a4 isFirstMessage:(BOOL)a5 medicalIDName:(id)a6 Reason:(int64_t)a7
{
  BOOL v8 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = sos_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v26 = "+[SOSEngine _sendMessageToRecipients:withLocation:isFirstMessage:medicalIDName:Reason:]";
    _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  double v16 = sos_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "Try sending SMS...", buf, 2u);
  }

  double v17 = [a1 _sosMessageForLocation:v13 isFirstMessage:v8 medicalIDName:v12 reason:a7 recipientReason:1];
  double v18 = [a1 _sosMessageForLocation:v13 isFirstMessage:v8 medicalIDName:v12 reason:a7 recipientReason:2];

  long long v23 = &unk_1F0C4AAF8;
  double v24 = v18;
  BOOL v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_356;
  v20[3] = &unk_1E6064420;
  id v21 = &__block_literal_global_353;
  id v22 = a1;
  [a1 _sendMessage:v17 location:v13 recipients:v14 recipientReasonMessages:v19 useStandalone:0 critical:v8 failureBlock:v20];
}

void __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_356(uint64_t a1)
{
  if ([*(id *)(a1 + 40) _isBasebandDevice])
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_356_cold_1(v3);
    }
  }
}

+ (void)_sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 recipientReasonMessages:(id)a6 useStandalone:(BOOL)a7 critical:(BOOL)a8 failureBlock:(id)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a4;
  double v20 = sos_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "+[SOSEngine _sendMessage:location:recipients:recipientReasonMessages:useStandalone:critical:failureBlock:]";
    _os_log_impl(&dword_1B3A94000, v20, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__SOSEngine__sendMessage_location_recipients_recipientReasonMessages_useStandalone_critical_failureBlock___block_invoke;
  v25[3] = &unk_1E6064918;
  id v26 = v16;
  id v27 = v15;
  id v29 = v18;
  id v30 = a1;
  BOOL v31 = a7;
  BOOL v32 = a8;
  id v28 = v17;
  id v21 = v18;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  [a1 shiftedLocationWithLocation:v19 completion:v25];
}

void __106__SOSEngine__sendMessage_location_recipients_recipientReasonMessages_useStandalone_critical_failureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SOSRecipient handlesFromRecipients:*(void *)(a1 + 32)];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getCKSOSMessageClass_softClass;
  uint64_t v14 = getCKSOSMessageClass_softClass;
  if (!getCKSOSMessageClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getCKSOSMessageClass_block_invoke;
    v10[3] = &unk_1E60640A0;
    v10[4] = &v11;
    __getCKSOSMessageClass_block_invoke((uint64_t)v10);
    id v5 = (void *)v12[3];
  }
  BOOL v6 = v5;
  _Block_object_dispose(&v11, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithMessage:*(void *)(a1 + 40) recipients:v4];
  BOOL v8 = +[SOSRecipient reasonsDictionaryFromRecipients:*(void *)(a1 + 32)];
  [v7 setRecipientReasons:v8];

  if (objc_opt_respondsToSelector()) {
    [v7 setRecipientReasonMessages:*(void *)(a1 + 48)];
  }
  uint64_t v9 = [*(id *)(a1 + 64) GPSCoordinatesURLForLocation:v3];
  [v7 setLocationURL:v9];

  [v7 setUseStandalone:*(unsigned __int8 *)(a1 + 72)];
  [v7 setIsCritical:*(unsigned __int8 *)(a1 + 73)];
  [*(id *)(a1 + 64) _sendCKMessage:v7 failureBlock:*(void *)(a1 + 56)];
}

+ (void)_sendCKMessage:(id)a3 failureBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[v5 copy];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __41__SOSEngine__sendCKMessage_failureBlock___block_invoke;
  id v17 = &unk_1E6064470;
  id v8 = v7;
  id v18 = v8;
  id v9 = v6;
  id v19 = v9;
  [v5 setFailureBlock:&v14];
  uint64_t v10 = sos_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "Asking CKSOSUtilities to send message: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v11 = (void *)getCKSOSUtilitiesClass_softClass;
  uint64_t v23 = getCKSOSUtilitiesClass_softClass;
  if (!getCKSOSUtilitiesClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    long long v25 = __getCKSOSUtilitiesClass_block_invoke;
    id v26 = &unk_1E60640A0;
    id v27 = &v20;
    __getCKSOSUtilitiesClass_block_invoke((uint64_t)&buf);
    uint64_t v11 = (void *)v21[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v20, 8);
  uint64_t v13 = objc_msgSend(v12, "sharedUtilities", v14, v15, v16, v17);
  [v13 sendMessage:v5];
}

uint64_t __41__SOSEngine__sendCKMessage_failureBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to send %@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)locationShifter
{
  if (locationShifter_onceToken != -1) {
    dispatch_once(&locationShifter_onceToken, &__block_literal_global_362);
  }
  id v2 = (void *)locationShifter_sLocationShifter;

  return v2;
}

void __28__SOSEngine_locationShifter__block_invoke()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  id v0 = (void *)get_MKLocationShifterClass_softClass;
  uint64_t v8 = get_MKLocationShifterClass_softClass;
  if (!get_MKLocationShifterClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __get_MKLocationShifterClass_block_invoke;
    v4[3] = &unk_1E60640A0;
    v4[4] = &v5;
    __get_MKLocationShifterClass_block_invoke((uint64_t)v4);
    id v0 = (void *)v6[3];
  }
  uint64_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  uint64_t v3 = (void *)locationShifter_sLocationShifter;
  locationShifter_sLocationShifter = (uint64_t)v2;
}

+ (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v8 = [a1 locationShifter];
  if (!v8) {
    goto LABEL_5;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [a1 locationShifter];
  int v11 = [(id)objc_opt_class() isLocationShiftRequiredForLocation:v6];

  if (v11)
  {
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke;
    block[3] = &unk_1E60649B8;
    id v15 = v7;
    id v16 = a1;
    id v14 = v6;
    dispatch_async(v12, block);
  }
  else
  {
LABEL_5:
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke(uint64_t a1)
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_2;
  v18[3] = &unk_1E6064968;
  uint64_t v20 = v21;
  id v19 = *(id *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x1B3EC08A0](v18);
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift started", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 48) locationShifter];
  id v6 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_363;
  v13[3] = &unk_1E6064990;
  id v14 = v6;
  id v7 = v3;
  id v16 = v7;
  uint64_t v8 = v2;
  id v15 = v8;
  uint64_t v9 = MEMORY[0x1E4F14428];
  id v10 = MEMORY[0x1E4F14428];
  [v5 shiftLocation:v14 withCompletionHandler:v13 callbackQueue:v9];

  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v11))
  {
    id v12 = sos_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOS location shift timed out.", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, *(void *)(a1 + 32));
  }

  _Block_object_dispose(v21, 8);
}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_3;
  block[3] = &unk_1E6064940;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_3(void *result)
{
  uint64_t v1 = *(void *)(result[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    return (void *)(*(uint64_t (**)(void, void))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_363(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift completed. Shifted from %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_isBasebandDevice
{
  return 0;
}

- (BOOL)notificationEnabledAndContactsExist
{
  return [(SOSContactsManager *)self->_contactsManager hasValidContactsToMessage];
}

- (void)willStartSendingLocationUpdate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 136315138;
    *(void *)&void v9[4] = "-[SOSEngine willStartSendingLocationUpdate]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", v9, 0xCu);
  }

  if (![(SOSEngine *)self isSendingLocationUpdate])
  {
    timeLastMessageSent = self->_timeLastMessageSent;
    self->_timeLastMessageSent = 0;

    lastLocationSent = self->_lastLocationSent;
    self->_lastLocationSent = 0;

    [(SOSContactsManager *)self->_contactsManager refreshCurrentEmergencyContacts];
  }
  if (![(SOSEngine *)self notificationEnabledAndContactsExist])
  {
    int v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      uint64_t v7 = "no emergency contacts to notify";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_14;
  }
  if ([(SOSPersistentTimerLocationManager *)self->_sosPersistentTimerLocationManager isRequestingLocation])
  {
    int v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      uint64_t v7 = "Skipping request for warmUpLocationRequest since we are already requesting location";
LABEL_11:
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, v7, v9, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  [(SOSPersistentTimerLocationManager *)self->_sosPersistentTimerLocationManager warmUpLocationRequest];
LABEL_14:
  if (+[SOSUtilities mostRecentlyUsedSOSTriggerMechanism] == 7)
  {
    __int16 v8 = [getSAServerClass() sharedInstance];
    [v8 startMonitoringLocation];
  }
}

- (void)startSendingLocationUpdateForReason:(int64_t)a3 WithCompletion:(id)a4
{
  contactsManager = self->_contactsManager;
  id v7 = a4;
  if ([(SOSContactsManager *)contactsManager hasValidContactsToMessage])
  {
    self->_notifyContactsReason = a3;
    [(SOSEngine *)self notifyEmergencyReasonToSafetyBuddy];
    [(SOSEngine *)self startSendingLocationUpdateWithCompletion:v7];
  }
  else
  {
    __int16 v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "No valid contacts to message", v9, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)notifyEmergencyReasonToSafetyBuddy
{
  id v3 = +[SOSUtilities currentDeviceSOSStatus];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SOS"];
  uint64_t v5 = [v4 valueForKey:@"SimulateSOSNotifyEmergencyContacts"];
  if (+[SOSUtilities _isInternalDevice]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v3)
    {
      switch([v3 trigger])
      {
        case 0:
          id v7 = sos_default_log();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_WORD *)id v15 = 0;
          __int16 v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy for unknown reason";
          goto LABEL_30;
        case 5:
          dispatch_time_t v11 = sos_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Newton", v15, 2u);
          }

          uint64_t v10 = SOSEventNotificationNewton;
          break;
        case 6:
          id v12 = sos_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Cinnamon", v15, 2u);
          }

          uint64_t v10 = (const char *)SOSEventNotificationCinnamon;
          break;
        case 7:
          uint64_t v13 = sos_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Kappa", v15, 2u);
          }

          uint64_t v10 = SOSEventNotificationKappa;
          break;
        case 8:
          id v14 = sos_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Mandrake", v15, 2u);
          }

          uint64_t v10 = (const char *)SOSEventNotificationMandrake;
          break;
        case 9:
          id v7 = sos_default_log();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_WORD *)id v15 = 0;
          __int16 v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy for unknown reason";
          goto LABEL_30;
        default:
          id v9 = sos_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Trigger", v15, 2u);
          }

          uint64_t v10 = SOSEventNotificationTrigger;
          break;
      }
      notify_post(v10);
    }
    else
    {
      id v7 = sos_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        __int16 v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy invalid SOSStatus";
LABEL_30:
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, v8, v15, 2u);
      }
LABEL_31:
    }
  }
  else
  {
    [(SOSEngine *)self notifyEmergencyReasonToSafetyBuddyForInternalDevices];
  }
}

- (void)notifyEmergencyReasonToSafetyBuddyForInternalDevices
{
  if (+[SOSUtilities _isInternalDevice])
  {
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "#notifySB Allowing notify contact reason to notify Safety Monitor since internal device", buf, 2u);
    }

    int64_t notifyContactsReason = self->_notifyContactsReason;
    if (notifyContactsReason == 2)
    {
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Kappa", v7, 2u);
      }
      BOOL v6 = &SOSEventNotificationKappa;
    }
    else if (notifyContactsReason == 1)
    {
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v8 = 0;
        _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Newton", v8, 2u);
      }
      BOOL v6 = &SOSEventNotificationNewton;
    }
    else
    {
      if (notifyContactsReason) {
        return;
      }
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Trigger", v9, 2u);
      }
      BOOL v6 = &SOSEventNotificationTrigger;
    }

    notify_post(*v6);
  }
}

- (void)startSendingLocationUpdateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v10 = "-[SOSEngine startSendingLocationUpdateWithCompletion:]";
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SOSEngine_startSendingLocationUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E6064470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __54__SOSEngine_startSendingLocationUpdateWithCompletion___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = 0;

  if ([*(id *)(a1 + 32) notificationEnabledAndContactsExist])
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v7 = [v6 objectForKey:@"locationUpdateTimerIntervalSeconds"];
    id v8 = v7;
    if (v7) {
      [v7 doubleValue];
    }
    else {
      double v9 = 900.0;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) fireAndStartTimertWithTimeInterval:v9 / 3.0];
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v11 = [v10 objectForKey:@"SOSSendingLocationUpdateStopTimeKey"];

    if (!v11)
    {
      id v12 = [v6 objectForKey:@"stopSendingTimerIntervalSeconds"];
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 doubleValue];
        double v15 = v14;
      }
      else
      {
        double v15 = 86400.0;
      }
      id v16 = [MEMORY[0x1E4F1C9C8] date];
      id v17 = [v16 dateByAddingTimeInterval:v15];

      id v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v18 setObject:v17 forKey:@"SOSSendingLocationUpdateStopTimeKey"];
    }
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v22 = @"SOSSendingLocationUpdateValueKey";
    v23[0] = MEMORY[0x1E4F1CC38];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [v19 postNotificationName:@"SOSSendingLocationUpdateChangedNotification" object:0 userInfo:v20];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)stopSendingLocationUpdate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v10 = "-[SOSEngine stopSendingLocationUpdate]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(SOSPersistentTimerLocationManager *)self->_sosPersistentTimerLocationManager invalidateTimer];
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 removeObjectForKey:@"SOSSendingLocationUpdateStopTimeKey"];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = @"SOSSendingLocationUpdateValueKey";
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"SOSSendingLocationUpdateChangedNotification" object:0 userInfo:v6];
}

- (BOOL)isSendingLocationUpdate
{
  return [(SOSPersistentTimerLocationManager *)self->_sosPersistentTimerLocationManager isValid];
}

- (void)mostRecentLocationSentWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  lastLocationSent = self->_lastLocationSent;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SOSEngine_mostRecentLocationSentWithCompletion___block_invoke;
  v8[3] = &unk_1E60649E0;
  id v9 = v4;
  id v7 = v4;
  [v5 shiftedLocationWithLocation:lastLocationSent completion:v8];
}

uint64_t __50__SOSEngine_mostRecentLocationSentWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncState:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, int64_t, int64_t, SOSButtonPressState *))a3 + 2))(v5, [(SOSEngine *)self isSendingLocationUpdate], self->_currentSOSInitiationState, self->_currentSOSInteractiveState, self->_currentSOSButtonPressState);
}

+ (id)meContact
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v12[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  uint64_t v4 = *MEMORY[0x1E4F1AF00];
  v11[0] = *MEMORY[0x1E4F1AEF8];
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AF08];
  v11[2] = *MEMORY[0x1E4F1AEF0];
  v11[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  id v7 = [v3 arrayByAddingObjectsFromArray:v6];

  uint64_t v8 = +[SOSEngine contactStore];
  id v9 = objc_msgSend(v8, "_ios_meContactWithKeysToFetch:error:", v7, 0);

  return v9;
}

+ (id)fullNameForContact:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1B910] stringFromContact:a3 style:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)firstNameForContact:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1B910] stringFromContact:a3 style:1000];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 medicalIDName:(id)a5 reason:(int64_t)a6 recipientReason:(unint64_t)a7
{
  BOOL v10 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  double v14 = [a1 meContact];
  id v15 = [a1 fullNameForContact:v14];
  id v16 = [a1 firstNameForContact:v14];
  if (![v15 length] || !objc_msgSend(v16, "length"))
  {
    id v17 = sos_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v13;
      _os_log_impl(&dword_1B3A94000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get meContact's name, using medicalID's name: %@", (uint8_t *)&v21, 0xCu);
    }

    id v18 = v13;
    id v15 = v18;

    id v16 = v15;
  }
  id v19 = [a1 _sosMessageForLocation:v12 isFirstMessage:v10 myFullName:v15 myFirstName:v16 reason:a6 recipientReason:a7];

  return v19;
}

+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 myFullName:(id)a5 myFirstName:(id)a6 reason:(int64_t)a7 recipientReason:(unint64_t)a8
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v12 = (__CFString *)a5;
  id v13 = (__CFString *)a6;
  if ([(__CFString *)v12 length] && ![(__CFString *)v13 length])
  {
    double v14 = v12;

    id v13 = v14;
  }
  id v15 = @"_NO_NAME";
  if ([(__CFString *)v12 length] && [(__CFString *)v13 length]) {
    id v15 = @"_HAS_NAME";
  }
  id v16 = v15;
  id v17 = @"_HAS_LOCATION";
  if (a7 == 2)
  {
    if (!a3) {
      id v17 = @"_NO_LOCATION";
    }
    int v21 = v17;
    uint64_t v51 = @"EMERGENCY_TYPE_KAPPA_TRIGGER";
    if (a4)
    {
      uint64_t v20 = @"KAPPA";
      id v22 = @"_PHONE";
      goto LABEL_24;
    }
  }
  else
  {
    id v18 = @"EMERGENCY_TYPE_SOS_TRIGGER";
    id v19 = @"EMERGENCY";
    if (a7) {
      id v19 = 0;
    }
    else {
      id v18 = @"EMERGENCY_TYPE_SOS_TRIGGER";
    }
    if (a7 == 1) {
      id v18 = @"EMERGENCY_TYPE_NEWTON_TRIGGER";
    }
    uint64_t v51 = v18;
    if (a7 == 1) {
      uint64_t v20 = @"NEWTON";
    }
    else {
      uint64_t v20 = v19;
    }
    if (!a3) {
      id v17 = @"_NO_LOCATION";
    }
    int v21 = v17;
    if (a4)
    {
      id v22 = &stru_1F0C40F10;
LABEL_24:
      v52 = v21;
      [NSString stringWithFormat:@"%@_TEXT_MESSAGE%@%@%@", v20, v16, v21, v22];
      goto LABEL_26;
    }
  }
  v52 = v21;
  [NSString stringWithFormat:@"EMERGENCY_TEXT_MESSAGE_SUBSEQUENT%@%@", v16, v21, v47, v48];
  uint64_t v23 = LABEL_26:;
  id v24 = @"_EMERGENCYCONTACT";
  if (a8 == 2) {
    id v24 = @"_CHECKIN";
  }
  v54 = v16;
  uint64_t v25 = [NSString stringWithFormat:@"EMERGENCY_TEXT_MESSAGE_RECIPIENT%@%@", v24, v16];
  if (v12) {
    id v26 = v12;
  }
  else {
    id v26 = &stru_1F0C40F10;
  }
  id v27 = v26;

  if (v13) {
    uint64_t v28 = v13;
  }
  else {
    uint64_t v28 = &stru_1F0C40F10;
  }
  id v29 = v28;

  id v30 = NSString;
  BOOL v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v32 = [v31 localizedStringForKey:v23 value:&stru_1F0C40F10 table:0];
  v60[0] = v27;
  v60[1] = v29;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v34 = [v30 stringWithPositionalSpecifiersFormat:v32 arguments:v33];

  uint64_t v35 = NSString;
  v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v49 = (void *)v25;
  [v36 localizedStringForKey:v25 value:&stru_1F0C40F10 table:0];
  uint64_t v38 = v37 = (void *)v23;
  id v50 = v27;
  v59[0] = v27;
  v59[1] = v29;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v40 = [v35 stringWithPositionalSpecifiersFormat:v38 arguments:v39];

  int v41 = NSString;
  v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v43 = [v42 localizedStringForKey:v51 value:&stru_1F0C40F10 table:0];
  int v44 = [v41 stringWithFormat:@"%@%@ %@", v43, v34, v40];

  __int16 v45 = sos_default_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    v56 = v37;
    __int16 v57 = 2112;
    v58 = v44;
    _os_log_impl(&dword_1B3A94000, v45, OS_LOG_TYPE_DEFAULT, "textMessageKey: %@ sosMessage: %@", buf, 0x16u);
  }

  return v44;
}

+ (id)GPSCoordinatesURLForLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = NSString;
    [v3 coordinate];
    uint64_t v7 = v6;
    [v4 coordinate];
    id v9 = objc_msgSend(v5, "stringWithFormat:", @"https://maps.apple.com/?ll=%.5f,%.5f", v7, v8);
    if (v9)
    {
      BOOL v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"EMERGENCY_PIN_LABEL" value:&stru_1F0C40F10 table:0];
      id v12 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      id v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

      if ([v13 length])
      {
        double v14 = [NSString stringWithFormat:@"&q=%@", v13];
        uint64_t v15 = [v9 stringByAppendingString:v14];

        id v9 = (void *)v15;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)additionalTextForCallbackNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 meContact];
  uint64_t v6 = [a1 fullNameForContact:v5];
  uint64_t v7 = [a1 firstNameForContact:v5];
  uint64_t v8 = [a1 additionalTextForCallbackNumber:v4 fullName:v6 firstName:v7];

  return v8;
}

+ (id)additionalTextForCallbackNumber:(id)a3 fullName:(id)a4 firstName:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = [v7 length];
  if ([v6 length])
  {
    id v9 = NSString;
    BOOL v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    if (!v8)
    {
      id v12 = [v10 localizedStringForKey:@"EMERGENCY_TEXT_CALLBACK_NUMBER_ADDITION_NO_NAME" value:&stru_1F0C40F10 table:0];
      objc_msgSend(v9, "stringWithFormat:", v12, v6, v15);
      goto LABEL_8;
    }
    id v12 = [v10 localizedStringForKey:@"EMERGENCY_TEXT_CALLBACK_NUMBER_ADDITION_HAS_NAME" value:&stru_1F0C40F10 table:0];
    id v15 = v6;
LABEL_6:
    objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);
    id v13 = LABEL_8:;

    goto LABEL_9;
  }
  if (v8)
  {
    id v9 = NSString;
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"EMERGENCY_TEXT_CALLBACK_NO_NUMBER_ADDITION_HAS_NAME" value:&stru_1F0C40F10 table:0];
    goto LABEL_6;
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)locationIsValidToSend:(id)a3
{
  *(void *)&v26[13] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    id v24 = "-[SOSEngine locationIsValidToSend:]";
    __int16 v25 = 2112;
    *(void *)id v26 = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "%s - location: %@", (uint8_t *)&v23, 0x16u);
  }

  if (v3)
  {
    [v3 horizontalAccuracy];
    if (v5 >= 0.0)
    {
      [v3 horizontalAccuracy];
      if (v10 <= 165.0)
      {
        int v15 = [v3 integrity];
        int v16 = v15;
        if (v15 == *MEMORY[0x1E4F1E760] || v15 == *MEMORY[0x1E4F1E758])
        {
          id v18 = [v3 timestamp];
          id v6 = v18;
          if (v18 && ([v18 timeIntervalSinceNow], v19 < -180.0))
          {
            uint64_t v20 = sos_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v23 = 138412290;
              id v24 = (const char *)v6;
              _os_log_impl(&dword_1B3A94000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting location - timestamp too old: %@", (uint8_t *)&v23, 0xCu);
            }
            BOOL v9 = 0;
          }
          else
          {
            uint64_t v20 = sos_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              [v3 horizontalAccuracy];
              int v23 = 134218498;
              id v24 = v22;
              __int16 v25 = 1024;
              *(_DWORD *)id v26 = v16;
              v26[2] = 2112;
              *(void *)&void v26[3] = v6;
              _os_log_impl(&dword_1B3A94000, v20, OS_LOG_TYPE_DEFAULT, "Keeping location - horizontalAccuracy:%f locationIntegrity:%d timestamp:%@", (uint8_t *)&v23, 0x1Cu);
            }
            BOOL v9 = 1;
          }

          goto LABEL_14;
        }
        id v6 = sos_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          LODWORD(v++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v16;
          uint64_t v8 = "Rejecting location - locationIntegrity: %d";
          id v12 = v6;
          uint32_t v13 = 8;
          goto LABEL_12;
        }
      }
      else
      {
        id v6 = sos_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          [v3 horizontalAccuracy];
          int v23 = 134217984;
          id v24 = v11;
          uint64_t v8 = "Rejecting location - horizontalAccuracy > 165.0: %f";
          goto LABEL_11;
        }
      }
    }
    else
    {
      id v6 = sos_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [v3 horizontalAccuracy];
        int v23 = 134217984;
        id v24 = v7;
        uint64_t v8 = "Rejecting location - horizontalAccuracy < 0.0: %f";
LABEL_11:
        id v12 = v6;
        uint32_t v13 = 12;
LABEL_12:
        _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, v13);
      }
    }
    BOOL v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (void)retriggerSOSWithUUID:(id)a3 trigger:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isEmergencyCallOngoing)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSEngine,retrigger blocked by ongoing emergency call", (uint8_t *)&v10, 2u);
    }

    double v5 = +[SOSStatusManager sharedInstance];
    [v5 updateSOSFlowState:10];
  }
  else
  {
    double v5 = +[SOSEngine getUrlForTrigger:a4];
    if (v5)
    {
      id v6 = +[SOSStatusManager sharedInstance];
      [v6 updateSOSFlowState:14];

      id v7 = sos_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening retrigger URL,%@", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v8 openURL:v5 configuration:0 completionHandler:&__block_literal_global_454];
    }
    else
    {
      BOOL v9 = sos_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch for retrigger", (uint8_t *)&v10, 2u);
      }

      uint64_t v8 = +[SOSStatusManager sharedInstance];
      [v8 updateSOSFlowState:0];
    }
  }
}

void __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = sos_default_log();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();
    }

    double v5 = +[SOSStatusManager sharedInstance];
    [v5 updateSOSFlowState:0];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v6, 2u);
  }
}

- (void)handoffFallbackWithUUID:(id)a3 trigger:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[SOSUtilities currentDeviceSOSStatus];
  uint64_t v8 = v7;
  if (v7 && [v7 shouldRejectNewSOSTriggers])
  {
    BOOL v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      int v10 = "SOSEngine,handoff fallback blocked by existing SOS flow: %@";
      uint64_t v11 = v9;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    }
  }
  else if (self->_isEmergencyCallOngoing)
  {
    BOOL v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      int v10 = "SOSEngine,handoff fallback blocked by ongoing emergency call";
      uint64_t v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v9 = +[SOSEngine getUrlForTrigger:a4];
    if (v9)
    {
      uint32_t v13 = +[SOSStatusManager sharedInstance];
      [v13 sosTriggeredWithUUID:v6 trigger:a4 source:0];

      double v14 = sos_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening handoff fallback URL,%@", (uint8_t *)&v16, 0xCu);
      }

      int v15 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v15 openURL:v9 configuration:0 completionHandler:&__block_literal_global_456];
    }
    else
    {
      int v15 = sos_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch for handoff fallback", (uint8_t *)&v16, 2u);
      }
    }
  }
}

void __45__SOSEngine_handoffFallbackWithUUID_trigger___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = sos_default_log();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();
    }

    double v5 = +[SOSStatusManager sharedInstance];
    [v5 updateSOSFlowState:0];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v6, 2u);
  }
}

- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
}

- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 source:(int64_t)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, uint64_t))a6;
  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
  }
  uint32_t v12 = sos_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v33 = v10;
    __int16 v34 = 1024;
    int v35 = a4;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered,uuid,%@,mechanism,%d", buf, 0x12u);
  }

  uint32_t v13 = +[SOSUtilities currentDeviceSOSStatus];
  double v14 = +[SOSUtilities pairedDeviceSOSStatus];
  if (v13 && ([v13 shouldRejectNewSOSTriggers] & 1) != 0
    || v14 && [v14 shouldRejectNewSOSTriggers])
  {
    if (v11) {
      v11[2](v11, 2);
    }
    int v15 = [(SOSEngine *)self coreAnalyticsReporter];
    objc_msgSend(v15, "reportSOSRejectedWithTrigger:currentTriggerMechanism:", a4, objc_msgSend(v13, "trigger"));
LABEL_12:

    goto LABEL_41;
  }
  if (self->_isEmergencyCallOngoing)
  {
    if (v11) {
      v11[2](v11, 6);
    }
    goto LABEL_41;
  }
  if (![(SOSEngine *)self isTriggerEnabled:a4])
  {
    id v22 = sos_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v33) = a4;
      _os_log_impl(&dword_1B3A94000, v22, OS_LOG_TYPE_DEFAULT, "SOSEngine,trigger (%d) not enabled", buf, 8u);
    }

    if (v11) {
      v11[2](v11, 4);
    }
    int v15 = +[SOSStatusManager sharedInstance];
    [v15 sosTriggerDisabledWithUUID:v10 trigger:a4];
    goto LABEL_12;
  }
  int v16 = +[SOSCoordinator sharedInstance];
  int v17 = [v16 shouldHandoffToPairedDevice:a4];

  if (v17)
  {
    uint64_t v18 = +[SOSCoordinator sharedInstance];
    int v19 = [v18 tryPushToPairedDeviceWithUUID:v10 triggerMechanism:a4];

    if (v19)
    {
      uint64_t v20 = sos_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B3A94000, v20, OS_LOG_TYPE_DEFAULT, "SOSEngine,successfully completed SOS handoff to paired device", buf, 2u);
      }

      int v21 = +[SOSStatusManager sharedInstance];
      [v21 sosTriggerPushedToPairedDeviceWithUUID:v10 trigger:a4];

      if (v11) {
        v11[2](v11, 5);
      }
      goto LABEL_41;
    }
  }
  else
  {
    int v23 = sos_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v23, OS_LOG_TYPE_DEFAULT, "SOSEngine,handoff SOS trigger to paired device unsupported", buf, 2u);
    }
  }
  id v24 = +[SOSEngine getUrlForTrigger:a4];
  if (v24)
  {
    __int16 v25 = +[SOSStatusManager sharedInstance];
    [v25 sosTriggeredWithUUID:v10 trigger:a4 source:a5];

    id v26 = sos_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v24;
      _os_log_impl(&dword_1B3A94000, v26, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening URL,%@", buf, 0xCu);
    }

    id v27 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__SOSEngine_triggerSOSWithUUID_triggerMechanism_source_completion___block_invoke;
    v30[3] = &unk_1E6064A28;
    BOOL v31 = v11;
    [v27 openURL:v24 configuration:0 completionHandler:v30];

    uint64_t v28 = [(SOSEngine *)self coreAnalyticsReporter];
    [v28 reportSOSTriggered:a4];
  }
  else
  {
    id v29 = sos_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v29, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch", buf, 2u);
    }

    if (v11) {
      v11[2](v11, 1);
    }
  }

LABEL_41:
}

void __67__SOSEngine_triggerSOSWithUUID_triggerMechanism_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sos_default_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();
    }

    BOOL v9 = +[SOSStatusManager sharedInstance];
    [v9 updateSOSFlowState:0];

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      uint64_t v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v13 = 0;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v13, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      uint64_t v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

- (BOOL)isTriggerEnabled:(int64_t)a3
{
  int v3 = a3;
  if ((unint64_t)a3 > 9)
  {
    id v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SOSEngine isTriggerEnabled:](v3, v5);
    }

    return 0;
  }
  else if (((1 << a3) & 0x35F) != 0)
  {
    return 1;
  }
  else if (a3 == 5)
  {
    return +[SOSUtilities newtonTriggersEmergencySOS];
  }
  else
  {
    return +[SOSUtilities kappaTriggersEmergencySOS];
  }
}

+ (id)getUrlForTrigger:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"telSOS"];
  id v5 = +[SOSEngine mapTriggerToActivationReason:a3];
  id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"reason" value:v5];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v4 setQueryItems:v7];

  uint64_t v8 = [v4 URL];

  return v8;
}

+ (id)mapTriggerToActivationReason:(int64_t)a3
{
  int v3 = a3;
  if (unint64_t)a3 < 8 && ((0x8Fu >> a3)) {
    return off_1E6064B08[a3];
  }
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[SOSEngine mapTriggerToActivationReason:](v3, v4);
  }

  return @"SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold";
}

- (void)contactStoreDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SOSFriendsChangedNotification" object:0];
}

+ (void)preloadContactStoreIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (preloadContactStoreIfNecessary_once_1 != -1) {
    dispatch_once(&preloadContactStoreIfNecessary_once_1, block);
  }
}

void __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  int v3 = (void *)__contactStoreQueue_1;
  __contactStoreQueue_1 = (uint64_t)v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue_1, block);
}

uint64_t __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizedToUseContactStore];
  if (result)
  {
    __contactStore_1 = [MEMORY[0x1E4F1B980] storeWithOptions:1];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)contactStore
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  BOOL v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  [a1 preloadContactStoreIfNecessary];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SOSEngine_contactStore__block_invoke;
  block[3] = &unk_1E60640A0;
  void block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue_1, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __25__SOSEngine_contactStore__block_invoke(uint64_t a1)
{
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken_1 != -1) {
    dispatch_once(&authorizedToUseContactStore_onceToken_1, &__block_literal_global_478);
  }
  return authorizedToUseContactStore_contactStoreAuthorized_1;
}

void __40__SOSEngine_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  authorizedToUseContactStore_contactStoreAuthorized_1 = v0 == 3;
  if (v0 != 3) {
    NSLog(&cfstr_NotAuthorizedT.isa, v0);
  }
}

- (void)fetchMedicalIDName
{
  objc_initWeak(&location, self);
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F2B0B8]) initWithIdentifier:@"com.apple.sos"];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__SOSEngine_fetchMedicalIDName__block_invoke;
  v3[3] = &unk_1E6064A50;
  objc_copyWeak(&v4, &location);
  [v2 fetchMedicalIDDataWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __31__SOSEngine_fetchMedicalIDName__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = (void *)CUTWeakLinkClass();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v9 hasAnyData]
      && ([v3 sharedInstance],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 lostModeIsActive],
          v5,
          (v6 & 1) == 0))
    {
      uint64_t v8 = [v9 name];
      uint64_t v7 = (void *)WeakRetained[5];
      WeakRetained[5] = v8;
    }
    else
    {
      uint64_t v7 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;
    }
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        int v10 = [v9 isEqualToString:@"com.apple.MobileSMS"];

        if (v10)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __38__SOSEngine_applicationsDidUninstall___block_invoke;
          block[3] = &unk_1E6064200;
          void block[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __38__SOSEngine_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSendingLocationUpdate];
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 stopSendingLocationUpdate];
  }
  return result;
}

- (void)databaseWasRebuilt
{
  if (!+[SOSUtilities isMessagesAppInstalled])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__SOSEngine_databaseWasRebuilt__block_invoke;
    block[3] = &unk_1E6064200;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __31__SOSEngine_databaseWasRebuilt__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSendingLocationUpdate];
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 stopSendingLocationUpdate];
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.sos.trigger"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke;
    v11[3] = &unk_1E6064AA0;
    void v11[4] = self;
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    uint64_t v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)long long v14 = v5;
      *(_WORD *)&v14[8] = 2112;
      *(void *)&v14[10] = @"com.apple.sos.trigger";
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] SOSEngine,New connection %@ missing entitlement: %@", buf, 0x16u);
    }
  }
  id v9 = sos_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)long long v14 = v7;
    *(_WORD *)&v14[4] = 2112;
    *(void *)&v14[6] = v5;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine,shouldAcceptNewConnection: %d for connection: %@", buf, 0x12u);
  }

  return v7;
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientConnections];
  objc_sync_enter(v2);
  int v3 = [*(id *)(a1 + 32) clientConnections];
  [v3 addObject:*(void *)(a1 + 40)];

  objc_sync_exit(v2);
  id v4 = SOSClientInterface();
  [*(id *)(a1 + 40) setRemoteObjectInterface:v4];

  id v5 = SOSServerInterface();
  [*(id *)(a1 + 40) setExportedInterface:v5];

  [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_initWeak(&from, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_2;
  v9[3] = &unk_1E6064830;
  objc_copyWeak(&v10, &location);
  [*(id *)(a1 + 40) setInterruptionHandler:v9];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_493;
  v6[3] = &unk_1E6064A78;
  objc_copyWeak(&v7, &from);
  objc_copyWeak(&v8, &location);
  [*(id *)(a1 + 40) setInvalidationHandler:v6];
  [*(id *)(a1 + 40) resume];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS client connection interrupted", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  id v3 = objc_loadWeakRetained(&to);
  [v3 invalidate];

  objc_destroyWeak(&to);
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_493(uint64_t a1)
{
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS client connection invalidated", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_copyWeak(&to, (id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(&to);

    if (v4)
    {
      id v5 = [WeakRetained clientConnections];
      objc_sync_enter(v5);
      uint64_t v6 = [WeakRetained clientConnections];
      id v7 = objc_loadWeakRetained(&to);
      [v6 removeObject:v7];

      objc_sync_exit(v5);
      [WeakRetained updateCurrentSOSInteractiveState:0];
    }
  }
  id v8 = sos_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "SOSEngine,completed invalidationHandler cleanup", v9, 2u);
  }

  objc_destroyWeak(&to);
}

- (SOSFlowManagerCoexProtocol)sosFlowManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sosFlowManager);

  return (SOSFlowManagerCoexProtocol *)WeakRetained;
}

- (void)setSosFlowManager:(id)a3
{
}

- (FKFriendsManager)friendsManager
{
  return self->_friendsManager;
}

- (void)setFriendsManager:(id)a3
{
}

- (_MKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
}

- (CLLocation)lastLocationSent
{
  return self->_lastLocationSent;
}

- (SOSPersistentTimerLocationManager)sosPersistentTimerLocationManager
{
  return self->_sosPersistentTimerLocationManager;
}

- (int64_t)currentSOSFlowState
{
  return self->_currentSOSFlowState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationSent, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_friendsManager, 0);
  objc_destroyWeak((id *)&self->_sosFlowManager);
  objc_storeStrong((id *)&self->_sosCoordinator, 0);
  objc_storeStrong((id *)&self->_currentSOSButtonPressState, 0);
  objc_storeStrong((id *)&self->_sosStatusManager, 0);
  objc_storeStrong((id *)&self->_medicalIDName, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_timeLastMessageSent, 0);
  objc_storeStrong((id *)&self->_timeToStopSendingMessages, 0);

  objc_storeStrong((id *)&self->_sosPersistentTimerLocationManager, 0);
}

- (void)_tuCallCenterStatusChanged:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 name];
  [v3 UTF8String];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSEngine, unexpected call event notification %s", v4, 0xCu);
}

void __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not send client a location update change due to connection error %@", v2, v3, v4, v5, v6);
}

void __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not send client a current initiation state due to connection error %@", v2, v3, v4, v5, v6);
}

void __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not send client a current interactive state due to connection error %@", v2, v3, v4, v5, v6);
}

void __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "SOSEngine,could not send client a current button press state due to connection error %@", v2, v3, v4, v5, v6);
}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not dismiss client due to connection error %@", v2, v3, v4, v5, v6);
}

void __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not dismiss client before SOS call due to connection error %@", v2, v3, v4, v5, v6);
}

void __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Could not send client a status update due to connection error %@", v2, v3, v4, v5, v6);
}

void __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_356_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "Failed to send SOS message over relay and this is not a baseband device.", v1, 2u);
}

void __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "SOSEngine,failed to launch SOS with error: %@", v2, v3, v4, v5, v6);
}

- (void)isTriggerEnabled:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSEngine,isTriggerEnabled,unrecognized SOSTriggerMechanism %d", (uint8_t *)v2, 8u);
}

+ (void)mapTriggerToActivationReason:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSEngine,trying to get activation reason for unhandled SOSTriggerMechanism,%d", (uint8_t *)v2, 8u);
}

@end