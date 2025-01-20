@interface SOSStatusManager
+ (SOSStatusManager)sharedInstance;
- (BOOL)hasActiveSOSCall;
- (BOOL)inSOSFlow;
- (BOOL)inSOSFlowOnCurrentDevice;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSTimer)currentDeviceStatusClearTimer;
- (NSTimer)handoffFallbackTimer;
- (NSTimer)pairedDeviceStatusClearTimer;
- (NSUUID)handoffTriggerUUID;
- (NSXPCConnection)clientConnection;
- (SOSCoreAnalyticsReporting)coreAnalyticsReporter;
- (SOSStatusManager)init;
- (TUCall)activeSOSCall;
- (int64_t)handoffTrigger;
- (int64_t)mostRecentTriggerSource;
- (void)_reportSOSEvent:(id)a3 callDuration:(int64_t)a4;
- (void)cancelCurrentDeviceClearStatusTimer;
- (void)cancelHandoffFallbackTimer;
- (void)cancelPairedDeviceClearStatusTimer;
- (void)checkHandoffFallback;
- (void)checkSOSStatusOnLaunch;
- (void)clearHandoffFallbackState;
- (void)endAudioSession;
- (void)flowEnded;
- (void)flowEndedOnBothDevices;
- (void)flowEndedOnCurrentDevice;
- (void)flowStarted;
- (void)flowStartedOnCurrentDevice;
- (void)flowStartedOnEitherDevice;
- (void)handleLostStatusReporterConnection;
- (void)handleSOSCallStatusChange:(id)a3;
- (void)pairedDeviceSOSStatusDidUpdate:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5;
- (void)setActiveSOSCall:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setCoreAnalyticsReporter:(id)a3;
- (void)setCurrentDeviceStatusClearTimer:(id)a3;
- (void)setHandoffFallbackTimer:(id)a3;
- (void)setHandoffTrigger:(int64_t)a3;
- (void)setHandoffTriggerUUID:(id)a3;
- (void)setHasActiveSOSCall:(BOOL)a3;
- (void)setInSOSFlow:(BOOL)a3;
- (void)setInSOSFlowOnCurrentDevice:(BOOL)a3;
- (void)setMostRecentTriggerSource:(int64_t)a3;
- (void)setPairedDeviceStatusClearTimer:(id)a3;
- (void)sosTriggerDisabledWithUUID:(id)a3 trigger:(int64_t)a4;
- (void)sosTriggerPushedToPairedDeviceWithUUID:(id)a3 trigger:(int64_t)a4;
- (void)sosTriggeredOnPairedDevice:(id)a3;
- (void)sosTriggeredWithUUID:(id)a3 trigger:(int64_t)a4 source:(int64_t)a5;
- (void)startAudioSession;
- (void)startCurrentDeviceClearStatusTimer;
- (void)startHandoffFallbackTimer;
- (void)startPairedDeviceClearStatusTimer;
- (void)triggerHandoffFallback;
- (void)updatePairedDeviceSOSStatus:(id)a3;
- (void)updateSOSFlowState:(int64_t)a3;
@end

@implementation SOSStatusManager

+ (SOSStatusManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SOSStatusManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  v2 = (void *)sharedInstance_inst_1;

  return (SOSStatusManager *)v2;
}

uint64_t __34__SOSStatusManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_inst_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SOSStatusManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOSStatusManager;
  v2 = [(SOSStatusManager *)&v8 init];
  if (v2)
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, init", v7, 2u);
    }

    uint64_t v4 = +[SOSCoreAnalyticsReporter sharedInstance];
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v4;
  }
  return v2;
}

- (void)sosTriggeredWithUUID:(id)a3 trigger:(int64_t)a4 source:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [SOSStatus alloc];
  v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [(SOSStatus *)v9 initWithUUID:v8 trigger:a4 timeOfDetection:v10];

  [(SOSStatus *)v11 setFlowState:14];
  +[SOSUtilities setCurrentDeviceSOSStatus:v11];
  [(SOSStatusManager *)self setMostRecentTriggerSource:a5];
  v12 = sos_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, sosTriggeredWithUUID: %@", (uint8_t *)&v16, 0xCu);
  }

  [(SOSStatusManager *)self flowStarted];
  v13 = +[SOSCoordinator sharedInstance];
  v14 = +[SOSUtilities currentDeviceSOSStatus];
  [v13 syncProgressionWithPairedDevice:1 sosStatus:v14];

  v15 = +[SOSEngine sharedInstance];
  [v15 broadcastUpdatedSOSStatus:v11];

  [(SOSStatusManager *)self startCurrentDeviceClearStatusTimer];
}

- (void)sosTriggerDisabledWithUUID:(id)a3 trigger:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [SOSStatus alloc];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [(SOSStatus *)v7 initWithUUID:v6 trigger:a4 timeOfDetection:v8 timeOfResolution:v9 resolution:4];

  +[SOSUtilities setCurrentDeviceSOSStatus:v10];
  v11 = sos_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, sosTriggerDisabledWithUUID: %@", (uint8_t *)&v13, 0xCu);
  }

  if (a4 == 7)
  {
    v12 = +[SOSEngine sharedInstance];
    [v12 handleNotifyThirdPartyClientsWithSOSStatus:v10];
  }
  [(SOSStatusManager *)self _reportSOSEvent:v10 callDuration:0];
}

- (void)updateSOSFlowState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = +[SOSUtilities currentDeviceSOSStatus];
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    LODWORD(v20) = [v5 flowState];
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, previousState: %d", (uint8_t *)&v19, 8u);
  }

  v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    LODWORD(v20) = a3;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, updateSOSFlowState: %d", (uint8_t *)&v19, 8u);
  }

  id v8 = (void *)[v5 copy];
  [v8 setFlowState:a3];
  if ([v8 isFlowActive] && !-[SOSStatusManager hasActiveSOSCall](self, "hasActiveSOSCall")) {
    [(SOSStatusManager *)self startCurrentDeviceClearStatusTimer];
  }
  else {
    [(SOSStatusManager *)self cancelCurrentDeviceClearStatusTimer];
  }
  if (![v8 resolution])
  {
    if (a3 != 6)
    {
      if (a3 != 4)
      {
        if (a3 == 3 || (char v9 = [v5 isFlowActive], a3 == 10) && (v9 & 1) != 0)
        {
          uint64_t v10 = 2;
LABEL_19:
          [v8 setResolution:v10];
          v11 = [MEMORY[0x1E4F1C9C8] date];
          [v8 setTimeOfResolution:v11];

LABEL_20:
          if ([v8 resolution] == 3) {
            [(SOSStatusManager *)self _reportSOSEvent:v8 callDuration:0];
          }
          goto LABEL_22;
        }
        if (a3) {
          goto LABEL_20;
        }
      }
      uint64_t v10 = 1;
      goto LABEL_19;
    }
    uint64_t v10 = 3;
    goto LABEL_19;
  }
LABEL_22:
  v12 = sos_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, updating currentDeviceSOSStatus to %@", (uint8_t *)&v19, 0xCu);
  }

  +[SOSUtilities setCurrentDeviceSOSStatus:v8];
  if ([v8 isFlowActive]
    && ![(SOSStatusManager *)self inSOSFlowOnCurrentDevice])
  {
    [(SOSStatusManager *)self flowStarted];
  }
  else if (([v8 isFlowActive] & 1) == 0 {
         && [(SOSStatusManager *)self inSOSFlowOnCurrentDevice])
  }
  {
    [(SOSStatusManager *)self flowEnded];
  }
  int v13 = +[SOSCoordinator sharedInstance];
  v14 = +[SOSUtilities currentDeviceSOSStatus];
  [v13 syncProgressionWithPairedDevice:3 sosStatus:v14];

  uint64_t v15 = +[SOSEngine sharedInstance];
  int v16 = +[SOSUtilities currentDeviceSOSStatus];
  [v15 broadcastUpdatedSOSStatus:v16];

  if ([v8 trigger] == 7
    && [v5 isFlowActiveAndNotResting]
    && ([v8 isFlowActiveAndNotResting] & 1) == 0)
  {
    v17 = +[SOSEngine sharedInstance];
    uint64_t v18 = +[SOSUtilities currentDeviceSOSStatus];
    [v17 handleNotifyThirdPartyClientsWithSOSStatus:v18];
  }
}

- (void)handleSOSCallStatusChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SOSStatusManager *)self hasActiveSOSCall];
  if (!v4 || v5)
  {
    BOOL v7 = [(SOSStatusManager *)self hasActiveSOSCall];
    if (!v4 && v7)
    {
      id v8 = +[SOSUtilities currentDeviceSOSStatus];
      char v9 = [(SOSStatusManager *)self activeSOSCall];
      [v9 callDuration];
      [(SOSStatusManager *)self _reportSOSEvent:v8 callDuration:(uint64_t)v10];

      v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS call ended", v12, 2u);
      }

      [(SOSStatusManager *)self setHasActiveSOSCall:0];
      [(SOSStatusManager *)self startCurrentDeviceClearStatusTimer];
      [(SOSStatusManager *)self startPairedDeviceClearStatusTimer];
    }
  }
  else
  {
    id v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS call started", buf, 2u);
    }

    [(SOSStatusManager *)self setHasActiveSOSCall:1];
    [(SOSStatusManager *)self cancelCurrentDeviceClearStatusTimer];
    [(SOSStatusManager *)self cancelPairedDeviceClearStatusTimer];
  }
  [(SOSStatusManager *)self setActiveSOSCall:v4];
}

- (void)checkSOSStatusOnLaunch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[SOSUtilities pairedDeviceSOSStatus];
  id v4 = v3;
  if (v3 && [v3 isFlowActive])
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      int v16 = v4;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,found active paired device flow on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    [(SOSStatusManager *)self updatePairedDeviceSOSStatus:v4];
  }
  else
  {
    id v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,paired device status not active on launch", (uint8_t *)&v15, 2u);
    }
  }
  BOOL v7 = +[SOSUtilities currentDeviceSOSStatus];
  id v8 = v7;
  if (!v7)
  {
    double v10 = sos_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,current device status was nil on launch", (uint8_t *)&v15, 2u);
    }
    goto LABEL_16;
  }
  if ([v7 shouldRetriggerSOS])
  {
    char v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      int v16 = v8;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,retriggering unresolved SOS event on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    double v10 = +[SOSEngine sharedInstance];
    v11 = [v8 uuid];
    -[NSObject retriggerSOSWithUUID:trigger:](v10, "retriggerSOSWithUUID:trigger:", v11, [v8 trigger]);

LABEL_16:
    goto LABEL_17;
  }
  int v12 = [v8 isFlowActive];
  int v13 = sos_default_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v15 = 138412290;
      int v16 = v8;
      _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,found active current device flow on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    -[SOSStatusManager updateSOSFlowState:](self, "updateSOSFlowState:", [v8 flowState]);
  }
  else
  {
    if (v14)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,current device status not active on launch", (uint8_t *)&v15, 2u);
    }
  }
LABEL_17:
}

- (void)handleLostStatusReporterConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = +[SOSUtilities currentDeviceSOSStatus];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 shouldRetriggerSOS];
    id v6 = sos_default_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        int v13 = v4;
        _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,retriggering unresolved SOS event due to lost status reporter connection: %@", buf, 0xCu);
      }

      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SOSStatusManager_handleLostStatusReporterConnection__block_invoke;
      block[3] = &unk_1E6064200;
      id v11 = v4;
      dispatch_after(v8, MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        int v13 = v4;
        _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,no need to retrigger SOS event due to lost status reporter connection: %@", buf, 0xCu);
      }

      [(SOSStatusManager *)self updateSOSFlowState:0];
    }
  }
  else
  {
    char v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,nil status on lost status reporter connection", buf, 2u);
    }
  }
}

void __54__SOSStatusManager_handleLostStatusReporterConnection__block_invoke(uint64_t a1)
{
  id v3 = +[SOSEngine sharedInstance];
  v2 = [*(id *)(a1 + 32) uuid];
  objc_msgSend(v3, "retriggerSOSWithUUID:trigger:", v2, objc_msgSend(*(id *)(a1 + 32), "trigger"));
}

- (void)startCurrentDeviceClearStatusTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke;
  block[3] = &unk_1E6064200;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancelCurrentDeviceClearStatusTimer];
  v2 = +[SOSUtilities currentDeviceSOSStatus];
  id v3 = v2;
  if (v2
    && [v2 isFlowActive]
    && ![*(id *)(a1 + 32) hasActiveSOSCall])
  {
    int v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 0x4044000000000000;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting current device clear status timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_290;
    v8[3] = &unk_1E6064698;
    objc_copyWeak(&v9, (id *)buf);
    BOOL v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v8 block:40.0];
    [*(id *)(a1 + 32) setCurrentDeviceStatusClearTimer:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting current device clear status timer", buf, 2u);
    }
  }
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_290(uint64_t a1)
{
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_290_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSOSFlowState:0];
}

- (void)cancelCurrentDeviceClearStatusTimer
{
  id v3 = [(SOSStatusManager *)self currentDeviceStatusClearTimer];

  if (v3)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling current device clear status timer", v6, 2u);
    }

    int v5 = [(SOSStatusManager *)self currentDeviceStatusClearTimer];
    [v5 invalidate];

    [(SOSStatusManager *)self setCurrentDeviceStatusClearTimer:0];
  }
}

- (void)flowStarted
{
  id v4 = +[SOSUtilities currentDeviceSOSStatus];
  id v3 = +[SOSUtilities pairedDeviceSOSStatus];
  if (([v4 isFlowActive] & 1) != 0 || objc_msgSend(v3, "isFlowActive")) {
    [(SOSStatusManager *)self flowStartedOnEitherDevice];
  }
  if ([v4 isFlowActive]) {
    [(SOSStatusManager *)self flowStartedOnCurrentDevice];
  }
}

- (void)flowStartedOnEitherDevice
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (![(SOSStatusManager *)self inSOSFlow])
  {
    [(SOSStatusManager *)self setInSOSFlow:1];
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowStartedOnEitherDevice", v6, 2u);
    }

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v7 = @"SOSHasActiveTriggerValueKey";
    v8[0] = MEMORY[0x1E4F1CC38];
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postNotificationName:@"SOSHasActiveTriggerChangedNotification" object:0 userInfo:v5];

    [MEMORY[0x1E4FB4FF0] requestPhraseSpotterBypassing:1 timeout:20.0];
    [(SOSStatusManager *)self startAudioSession];
  }
}

- (void)flowStartedOnCurrentDevice
{
  if (![(SOSStatusManager *)self inSOSFlowOnCurrentDevice])
  {
    [(SOSStatusManager *)self setInSOSFlowOnCurrentDevice:1];
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowStartedOnCurrentDevice", v4, 2u);
    }
  }
}

- (void)flowEnded
{
  id v4 = +[SOSUtilities currentDeviceSOSStatus];
  id v3 = +[SOSUtilities pairedDeviceSOSStatus];
  if (([v4 isFlowActive] & 1) == 0) {
    [(SOSStatusManager *)self flowEndedOnCurrentDevice];
  }
  if (([v4 isFlowActive] & 1) == 0 && (objc_msgSend(v3, "isFlowActive") & 1) == 0) {
    [(SOSStatusManager *)self flowEndedOnBothDevices];
  }
}

- (void)flowEndedOnBothDevices
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(SOSStatusManager *)self inSOSFlow])
  {
    [(SOSStatusManager *)self setInSOSFlow:0];
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowEndedOnBothDevices", v6, 2u);
    }

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v7 = @"SOSHasActiveTriggerValueKey";
    v8[0] = MEMORY[0x1E4F1CC28];
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postNotificationName:@"SOSHasActiveTriggerChangedNotification" object:0 userInfo:v5];

    [MEMORY[0x1E4FB4FF0] requestPhraseSpotterBypassing:0 timeout:0.0];
    [(SOSStatusManager *)self endAudioSession];
  }
}

- (void)flowEndedOnCurrentDevice
{
  if ([(SOSStatusManager *)self inSOSFlowOnCurrentDevice])
  {
    [(SOSStatusManager *)self setInSOSFlowOnCurrentDevice:0];
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowEndedOnCurrentDevice", v4, 2u);
    }
  }
}

- (void)startAudioSession
{
}

- (void)endAudioSession
{
}

- (void)_reportSOSEvent:(id)a3 callDuration:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SOSStatusManager *)self mostRecentTriggerSource] == 1;
  id v8 = [(SOSStatusManager *)self coreAnalyticsReporter];
  [v8 reportSOSEvent:v6 callDuration:a4 isHandoffTrigger:v7 onWristState:0];
}

- (void)pairedDeviceSOSStatusDidUpdate:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = sos_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, pairedDeviceSOSStatusDidUpdate", (uint8_t *)v13, 2u);
  }

  if (!v8)
  {
    uint64_t v12 = sos_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SOSStatusManager pairedDeviceSOSStatusDidUpdate:progression:shouldHandleThirdParty:]();
    }
LABEL_12:

    goto LABEL_14;
  }
  [v8 setIsPairedDeviceStatus:1];
  switch(a4)
  {
    case 3:
      [(SOSStatusManager *)self updatePairedDeviceSOSStatus:v8];
      break;
    case 2:
      if (v5)
      {
        if ([v8 trigger] != 7) {
          break;
        }
        uint64_t v12 = +[SOSEngine sharedInstance];
        [v12 handleNotifyThirdPartyClientsWithSOSStatus:v8];
      }
      else
      {
        uint64_t v12 = sos_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, third party handoff message missing info, notify failed", (uint8_t *)v13, 2u);
        }
      }
      goto LABEL_12;
    case 1:
      double v10 = sos_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [v8 trigger];
        v13[0] = 67109120;
        v13[1] = v11;
        _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, received message with SOSProgressionSOSTriggered, trigger: %d", (uint8_t *)v13, 8u);
      }

      [(SOSStatusManager *)self sosTriggeredOnPairedDevice:v8];
      break;
  }
LABEL_14:
}

- (void)sosTriggeredOnPairedDevice:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,sosTriggeredOnPairedDevice: %@", (uint8_t *)&v7, 0xCu);
    }

    +[SOSUtilities setPairedDeviceSOSStatus:v4];
    [(SOSStatusManager *)self checkHandoffFallback];
    [(SOSStatusManager *)self flowStarted];
    id v6 = +[SOSEngine sharedInstance];
    [v6 broadcastUpdatedSOSStatus:v4];

    [(SOSStatusManager *)self startPairedDeviceClearStatusTimer];
  }
}

- (void)updatePairedDeviceSOSStatus:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,updatePairedDeviceSOSStatus: %@", (uint8_t *)&v7, 0xCu);
    }

    +[SOSUtilities setPairedDeviceSOSStatus:v4];
    [(SOSStatusManager *)self checkHandoffFallback];
    if ([v4 isFlowActive]
      && ![(SOSStatusManager *)self hasActiveSOSCall])
    {
      [(SOSStatusManager *)self startPairedDeviceClearStatusTimer];
    }
    else
    {
      [(SOSStatusManager *)self cancelPairedDeviceClearStatusTimer];
    }
    if ([v4 isFlowActive] && !-[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
    {
      [(SOSStatusManager *)self flowStarted];
    }
    else if (([v4 isFlowActive] & 1) == 0 && -[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
    {
      [(SOSStatusManager *)self flowEnded];
    }
    id v6 = +[SOSEngine sharedInstance];
    [v6 broadcastUpdatedSOSStatus:v4];
  }
}

- (void)startPairedDeviceClearStatusTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke;
  block[3] = &unk_1E6064200;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancelPairedDeviceClearStatusTimer];
  v2 = +[SOSUtilities pairedDeviceSOSStatus];
  id v3 = v2;
  if (v2
    && [v2 isFlowActive]
    && ![*(id *)(a1 + 32) hasActiveSOSCall])
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 0x4044000000000000;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting paired device clear status timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_296;
    v8[3] = &unk_1E6064698;
    objc_copyWeak(&v9, (id *)buf);
    int v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v8 block:40.0];
    [*(id *)(a1 + 32) setPairedDeviceStatusClearTimer:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting paired device clear status timer", buf, 2u);
    }
  }
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_296(uint64_t a1)
{
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_296_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = +[SOSUtilities pairedDeviceSOSStatus];
  [v4 setFlowState:0];
  [WeakRetained updatePairedDeviceSOSStatus:v4];
}

- (void)cancelPairedDeviceClearStatusTimer
{
  id v3 = [(SOSStatusManager *)self pairedDeviceStatusClearTimer];

  if (v3)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling paired device clear status timer", v6, 2u);
    }

    BOOL v5 = [(SOSStatusManager *)self pairedDeviceStatusClearTimer];
    [v5 invalidate];

    [(SOSStatusManager *)self setPairedDeviceStatusClearTimer:0];
  }
}

- (void)sosTriggerPushedToPairedDeviceWithUUID:(id)a3 trigger:(int64_t)a4
{
  if (a3)
  {
    -[SOSStatusManager setHandoffTriggerUUID:](self, "setHandoffTriggerUUID:");
    [(SOSStatusManager *)self setHandoffTrigger:a4];
    [(SOSStatusManager *)self startHandoffFallbackTimer];
    [(SOSStatusManager *)self checkHandoffFallback];
  }
  else
  {
    id v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SOSStatusManager sosTriggerPushedToPairedDeviceWithUUID:trigger:]();
    }
  }
}

- (void)startHandoffFallbackTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke;
  block[3] = &unk_1E6064200;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancelHandoffFallbackTimer];
  v2 = [*(id *)(a1 + 32) handoffTriggerUUID];
  BOOL v3 = v2 == 0;

  id v4 = sos_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting handoff fallback timer", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 0x4024000000000000;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting handoff fallback timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_297;
    v8[3] = &unk_1E6064698;
    objc_copyWeak(&v9, (id *)buf);
    int v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v8 block:10.0];
    [*(id *)(a1 + 32) setHandoffFallbackTimer:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_297(uint64_t a1)
{
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_297_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained triggerHandoffFallback];
}

- (void)cancelHandoffFallbackTimer
{
  BOOL v3 = [(SOSStatusManager *)self handoffFallbackTimer];

  if (v3)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling handoff fallback timer", v6, 2u);
    }

    BOOL v5 = [(SOSStatusManager *)self handoffFallbackTimer];
    [v5 invalidate];

    [(SOSStatusManager *)self setHandoffFallbackTimer:0];
  }
}

- (void)triggerHandoffFallback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 handoffTriggerUUID];
  BOOL v5 = SOSStringForSOSTriggerMechanism([a1 handoffTrigger]);
  int v6 = 138412546;
  int v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSStatusManager,triggering handoff fallback,UUID,%@,trigger,%@", (uint8_t *)&v6, 0x16u);
}

- (void)checkHandoffFallback
{
  BOOL v3 = [(SOSStatusManager *)self handoffTriggerUUID];

  if (v3)
  {
    id v4 = +[SOSUtilities pairedDeviceSOSStatus];
    BOOL v5 = v4;
    if (!v4) {
      goto LABEL_17;
    }
    int v6 = [v4 uuid];
    int v7 = [v6 UUIDString];
    __int16 v8 = [(SOSStatusManager *)self handoffTriggerUUID];
    id v9 = [v8 UUIDString];
    int v10 = [v7 isEqualToString:v9];

    if (!v10) {
      goto LABEL_17;
    }
    if ([v5 isFlowActive])
    {
      [(SOSStatusManager *)self cancelHandoffFallbackTimer];
      if ([v5 isPreCall])
      {
LABEL_17:

        return;
      }
      uint64_t v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow progressed to call", buf, 2u);
      }
    }
    else
    {
      uint64_t v12 = [v5 flowState];
      int v13 = sos_default_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (v14)
        {
          *(_WORD *)int v16 = 0;
          _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow not running", v16, 2u);
        }

        int v15 = [(SOSStatusManager *)self handoffFallbackTimer];

        if (!v15) {
          [(SOSStatusManager *)self startHandoffFallbackTimer];
        }
        goto LABEL_17;
      }
      if (v14)
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow ended", v17, 2u);
      }

      [(SOSStatusManager *)self cancelHandoffFallbackTimer];
    }
    [(SOSStatusManager *)self clearHandoffFallbackState];
    goto LABEL_17;
  }

  [(SOSStatusManager *)self cancelHandoffFallbackTimer];
}

- (void)clearHandoffFallbackState
{
  [(SOSStatusManager *)self setHandoffTriggerUUID:0];

  [(SOSStatusManager *)self setHandoffTrigger:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, shouldAcceptNewConnection", buf, 2u);
  }

  int v7 = [v5 valueForEntitlement:@"com.apple.sos.trigger"];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    int v10 = sos_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v21 = v5;
      *(_WORD *)&v21[8] = 2112;
      *(void *)&v21[10] = @"com.apple.sos.trigger";
      uint64_t v11 = "[WARN] SOSStatusManager,New connection %@ missing entitlement: %@";
      uint64_t v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_9;
    }
LABEL_10:

    BOOL v14 = 0;
    goto LABEL_11;
  }
  id v9 = [(SOSStatusManager *)self clientConnection];

  if (v9)
  {
    int v10 = sos_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v21 = v5;
      uint64_t v11 = "[WARN] SOSStatusManager,Cannot accept new connection %@ because of existing client connection";
      uint64_t v12 = v10;
      uint32_t v13 = 12;
LABEL_9:
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_1E6064AA0;
  v18[4] = self;
  id v16 = v5;
  id v19 = v16;
  dispatch_async(MEMORY[0x1E4F14428], v18);
  uint64_t v17 = sos_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)uint64_t v21 = 1;
    *(_WORD *)&v21[4] = 2112;
    *(void *)&v21[6] = v16;
    _os_log_impl(&dword_1B3A94000, v17, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,shouldAcceptNewConnection: %d for connection: %@", buf, 0x12u);
  }

  BOOL v14 = 1;
LABEL_11:

  return v14;
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setClientConnection:*(void *)(a1 + 40)];
  v2 = SOSStatusManagerClientInterface();
  [*(id *)(a1 + 40) setRemoteObjectInterface:v2];

  BOOL v3 = SOSStatusManagerServerInterface();
  [*(id *)(a1 + 40) setExportedInterface:v3];

  [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v8[3] = &unk_1E6064830;
  objc_copyWeak(&v9, &location);
  [*(id *)(a1 + 40) setInterruptionHandler:v8];
  objc_initWeak(&from, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_298;
  v4[3] = &unk_1E6064A78;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  [*(id *)(a1 + 40) setInvalidationHandler:v4];
  [*(id *)(a1 + 40) resume];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS client connection interrupted", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  id v3 = objc_loadWeakRetained(&to);
  [v3 invalidate];

  objc_destroyWeak(&to);
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_298(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained(&to);

  if (v3) {
    [WeakRetained setClientConnection:0];
  }
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS client connection invalidated", v6, 2u);
  }

  id v5 = +[SOSEngine sharedInstance];
  [v5 updateCurrentSOSInitiationState:0];

  [WeakRetained handleLostStatusReporterConnection];
  objc_destroyWeak(&to);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (BOOL)inSOSFlow
{
  return self->_inSOSFlow;
}

- (void)setInSOSFlow:(BOOL)a3
{
  self->_inSOSFlow = a3;
}

- (BOOL)inSOSFlowOnCurrentDevice
{
  return self->_inSOSFlowOnCurrentDevice;
}

- (void)setInSOSFlowOnCurrentDevice:(BOOL)a3
{
  self->_inSOSFlowOnCurrentDevice = a3;
}

- (TUCall)activeSOSCall
{
  return self->_activeSOSCall;
}

- (void)setActiveSOSCall:(id)a3
{
}

- (BOOL)hasActiveSOSCall
{
  return self->_hasActiveSOSCall;
}

- (void)setHasActiveSOSCall:(BOOL)a3
{
  self->_hasActiveSOSCall = a3;
}

- (NSTimer)currentDeviceStatusClearTimer
{
  return self->_currentDeviceStatusClearTimer;
}

- (void)setCurrentDeviceStatusClearTimer:(id)a3
{
}

- (NSTimer)pairedDeviceStatusClearTimer
{
  return self->_pairedDeviceStatusClearTimer;
}

- (void)setPairedDeviceStatusClearTimer:(id)a3
{
}

- (int64_t)mostRecentTriggerSource
{
  return self->_mostRecentTriggerSource;
}

- (void)setMostRecentTriggerSource:(int64_t)a3
{
  self->_mostRecentTriggerSource = a3;
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
}

- (NSUUID)handoffTriggerUUID
{
  return self->_handoffTriggerUUID;
}

- (void)setHandoffTriggerUUID:(id)a3
{
}

- (int64_t)handoffTrigger
{
  return self->_handoffTrigger;
}

- (void)setHandoffTrigger:(int64_t)a3
{
  self->_handoffTrigger = a3;
}

- (NSTimer)handoffFallbackTimer
{
  return self->_handoffFallbackTimer;
}

- (void)setHandoffFallbackTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffFallbackTimer, 0);
  objc_storeStrong((id *)&self->_handoffTriggerUUID, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_pairedDeviceStatusClearTimer, 0);
  objc_storeStrong((id *)&self->_currentDeviceStatusClearTimer, 0);
  objc_storeStrong((id *)&self->_activeSOSCall, 0);

  objc_storeStrong((id *)&self->_clientConnection, 0);
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_290_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSStatusManager,current device clear status timer fired", v2, v3, v4, v5, v6);
}

- (void)pairedDeviceSOSStatusDidUpdate:progression:shouldHandleThirdParty:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSStatusManager,paired device update received without SOSStatus", v2, v3, v4, v5, v6);
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_296_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSStatusManager,paired device clear status timer fired", v2, v3, v4, v5, v6);
}

- (void)sosTriggerPushedToPairedDeviceWithUUID:trigger:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSStatusManager,no UUID for trigger pushed to paired device", v2, v3, v4, v5, v6);
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_297_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSStatusManager,handoff fallback timer fired", v2, v3, v4, v5, v6);
}

@end