@interface SBSystemStatusStatusItemsDataProvider
- (BOOL)_isDisplayWarningItemEnabled;
- (BOOL)_isVPNItemEnabled;
- (BOOL)_wantsAttributionForStatusItemWithIdentifier:(id)a3;
- (BOOL)isAlarmEnabled;
- (NSMapTable)dataProvidersByIdentifier;
- (SBDisplayReferenceModeMonitor)displayReferenceModeMonitor;
- (SBSystemStatusStatusItemsDataProvider)initWithMainDisplayWindowScene:(id)a3;
- (SBTelephonyManager)telephonyManager;
- (SBWindowScene)mainDisplayWindowScene;
- (STTelephonyStatusDomain)telephonyStatusDomain;
- (STWifiStatusDomain)wifiStatusDomain;
- (id)_identifiersForSupportedStatusItems;
- (void)_registerForNotifications;
- (void)_updateAllData;
- (void)_updateDataForAirPlay;
- (void)_updateDataForAirplaneMode;
- (void)_updateDataForAlarm;
- (void)_updateDataForCarPlay;
- (void)_updateDataForDisplayWarning;
- (void)_updateDataForRotationLock;
- (void)_updateDataForStatusItemsWithIdentifiers:(id)a3;
- (void)_updateDataForTTY;
- (void)_updateDataForVPN;
- (void)dealloc;
- (void)invalidate;
- (void)setAlarmEnabled:(BOOL)a3;
- (void)setMainDisplayWindowScene:(id)a3;
@end

@implementation SBSystemStatusStatusItemsDataProvider

- (SBSystemStatusStatusItemsDataProvider)initWithMainDisplayWindowScene:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemStatusStatusItemsDataProvider;
  v6 = [(SBSystemStatusStatusItemsDataProvider *)&v17 init];
  if (v6)
  {
    v7 = [(id)SBApp systemStatusServer];
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v6, @"SBSystemStatusStatusItemsDataProvider.m", 48, @"don't initialize %@ before the server handle exists!", objc_opt_class() object file lineNumber description];
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FA9558]) initWithServerHandle:v7];
    telephonyStatusDomain = v6->_telephonyStatusDomain;
    v6->_telephonyStatusDomain = (STTelephonyStatusDomain *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FA9570]) initWithServerHandle:v7];
    wifiStatusDomain = v6->_wifiStatusDomain;
    v6->_wifiStatusDomain = (STWifiStatusDomain *)v10;

    objc_storeWeak((id *)&v6->_mainDisplayWindowScene, v5);
    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dataProvidersByIdentifier = v6->_dataProvidersByIdentifier;
    v6->_dataProvidersByIdentifier = (NSMapTable *)v12;

    [(SBSystemStatusStatusItemsDataProvider *)v6 _registerForNotifications];
    v16 = v6;
    BSDispatchMain();
  }
  return v6;
}

uint64_t __72__SBSystemStatusStatusItemsDataProvider_initWithMainDisplayWindowScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllData];
}

- (void)dealloc
{
  [(SBSystemStatusStatusItemsDataProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusStatusItemsDataProvider;
  [(SBSystemStatusStatusItemsDataProvider *)&v3 dealloc];
}

- (void)setAlarmEnabled:(BOOL)a3
{
  if (self->_alarmEnabled != a3)
  {
    self->_alarmEnabled = a3;
    [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForAlarm];
  }
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(NSMapTable *)self->_dataProvidersByIdentifier dictionaryRepresentation];
  v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(STTelephonyStatusDomain *)self->_telephonyStatusDomain invalidate];
  [(STWifiStatusDomain *)self->_wifiStatusDomain invalidate];
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self];
}

- (void)_registerForNotifications
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v3 = [(SBSystemStatusStatusItemsDataProvider *)self _identifiersForSupportedStatusItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        v9 = [[SBSystemStatusStatusItemDataPublisher alloc] initWithStatusItemIdentifier:v8];
        dataProvidersByIdentifier = self->_dataProvidersByIdentifier;
        long long v11 = (void *)[v8 copy];
        [(NSMapTable *)dataProvidersByIdentifier setObject:v9 forKey:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel__updateDataForRotationLock name:*MEMORY[0x1E4FA7A88] object:0];
  [v12 addObserver:self selector:sel__updateDataForAirplaneMode name:*MEMORY[0x1E4FA79E0] object:0];
  [v12 addObserver:self selector:sel__updateDataForTTY name:@"SBTTYChangedNotification" object:0];
  [v12 addObserver:self selector:sel__updateDataForVPN name:@"SBVPNConnectionChangedNotification" object:0];
  [v12 addObserver:self selector:sel__updateDataForAirPlay name:@"SBAirPlayScreenSharingStatusChangedNotificationName" object:0];
  [v12 addObserver:self selector:sel__updateDataForCarPlay name:@"SBNotificationCarPlayDestinationAvailabilityDidChange" object:0];
  [v12 addObserver:self selector:sel__updateDataForAlarm name:@"SBTTYChangedNotification" object:0];
  long long v13 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
  telephonyManager = self->_telephonyManager;
  self->_telephonyManager = v13;

  uint64_t v15 = objc_alloc_init(SBDisplayReferenceModeMonitor);
  v16 = [(SBSystemStatusStatusItemsDataProvider *)self mainDisplayWindowScene];
  objc_super v17 = [v16 screen];
  v18 = [v17 displayConfiguration];
  [(SBDisplayReferenceModeMonitor *)v15 addReferenceModeStatusObserver:self forDisplayWithConfiguration:v18];
  displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  self->_displayReferenceModeMonitor = v15;
  v20 = v15;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke;
  v22[3] = &unk_1E6AFB398;
  v22[4] = self;
  v21 = (void *)MEMORY[0x1D948C7A0](v22);
  [(STTelephonyStatusDomain *)self->_telephonyStatusDomain observeDataWithBlock:v21];
  [(STWifiStatusDomain *)self->_wifiStatusDomain observeDataWithBlock:v21];
}

uint64_t __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke()
{
  return BSDispatchMain();
}

uint64_t __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDataForVPN];
}

- (BOOL)_isDisplayWarningItemEnabled
{
  v2 = self;
  objc_super v3 = [(SBSystemStatusStatusItemsDataProvider *)self mainDisplayWindowScene];
  uint64_t v4 = [v3 screen];
  uint64_t v5 = [v4 displayConfiguration];
  LOBYTE(v2) = [(SBDisplayReferenceModeMonitor *)v2->_displayReferenceModeMonitor referenceModeStatusForDisplayWithConfiguration:v5] == 2;

  return (char)v2;
}

- (BOOL)_isVPNItemEnabled
{
  BSDispatchQueueAssertMain();
  if (!self->_telephonyManager) {
    return 0;
  }
  objc_super v3 = [(SBSystemStatusStatusItemsDataProvider *)self telephonyStatusDomain];
  uint64_t v4 = [v3 data];
  uint64_t v5 = [v4 primarySIMInfo];
  char v6 = [v5 isProvidingDataConnection];

  BOOL v7 = [(SBTelephonyManager *)self->_telephonyManager hasNonCellularNetworkConnection];
  if ((v6 & 1) == 0 && !v7) {
    return 0;
  }
  telephonyManager = self->_telephonyManager;
  return [(SBTelephonyManager *)telephonyManager isUsingVPNConnection];
}

- (BOOL)_wantsAttributionForStatusItemWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(id)*MEMORY[0x1E4FA98F0] isEqualToString:v4])
  {
    uint64_t v5 = +[SBOrientationLockManager sharedInstance];
    char v6 = [v5 isUserLocked];
LABEL_7:
    BOOL alarmEnabled = v6;

    goto LABEL_8;
  }
  if ([(id)*MEMORY[0x1E4FA98C8] isEqualToString:v4])
  {
    uint64_t v5 = +[SBAirplaneModeController sharedInstance];
    char v6 = [v5 isInAirplaneMode];
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4FA9900] isEqualToString:v4])
  {
    uint64_t v5 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
    char v6 = [v5 isTTYEnabled];
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4FA9908] isEqualToString:v4])
  {
    BOOL v9 = [(SBSystemStatusStatusItemsDataProvider *)self _isVPNItemEnabled];
LABEL_13:
    BOOL alarmEnabled = v9;
    goto LABEL_8;
  }
  if ([(id)*MEMORY[0x1E4FA98E0] isEqualToString:v4])
  {
    BOOL v9 = [(SBSystemStatusStatusItemsDataProvider *)self _isDisplayWarningItemEnabled];
    goto LABEL_13;
  }
  if ([(id)*MEMORY[0x1E4FA98C0] isEqualToString:v4])
  {
    uint64_t v5 = +[SBVideoOutController sharedInstanceIfExists];
    char v6 = [v5 isScreenSharing];
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4FA98D8] isEqualToString:v4])
  {
    uint64_t v5 = [(id)SBApp notificationDispatcher];
    char v6 = [v5 isCarDestinationActive];
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4FA98D0] isEqualToString:v4]) {
    BOOL alarmEnabled = self->_alarmEnabled;
  }
  else {
    BOOL alarmEnabled = 0;
  }
LABEL_8:

  return alarmEnabled;
}

- (id)_identifiersForSupportedStatusItems
{
  v10[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4FA98C8];
  v10[0] = *MEMORY[0x1E4FA98F0];
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4FA9908];
  v10[2] = *MEMORY[0x1E4FA9900];
  v10[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4FA98C0];
  v10[4] = *MEMORY[0x1E4FA98E0];
  v10[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4FA98D0];
  v10[6] = *MEMORY[0x1E4FA98D8];
  v10[7] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:8];
  uint64_t v8 = [v2 setWithArray:v7];

  return v8;
}

- (void)_updateDataForStatusItemsWithIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        BOOL v10 = [(SBSystemStatusStatusItemsDataProvider *)self _wantsAttributionForStatusItemWithIdentifier:v9];
        long long v11 = [(NSMapTable *)self->_dataProvidersByIdentifier objectForKey:v9];
        [v11 setStatusItemEnabled:v10 withCompletion:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_updateAllData
{
  id v3 = [(SBSystemStatusStatusItemsDataProvider *)self _identifiersForSupportedStatusItems];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForRotationLock
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98F0]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForAirplaneMode
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98C8]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForTTY
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9900]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForVPN
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9908]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForAirPlay
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98C0]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForDisplayWarning
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98E0]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForCarPlay
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98D8]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (void)_updateDataForAlarm
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA98D0]];
  [(SBSystemStatusStatusItemsDataProvider *)self _updateDataForStatusItemsWithIdentifiers:v3];
}

- (BOOL)isAlarmEnabled
{
  return self->_alarmEnabled;
}

- (NSMapTable)dataProvidersByIdentifier
{
  return self->_dataProvidersByIdentifier;
}

- (SBDisplayReferenceModeMonitor)displayReferenceModeMonitor
{
  return self->_displayReferenceModeMonitor;
}

- (SBTelephonyManager)telephonyManager
{
  return self->_telephonyManager;
}

- (STTelephonyStatusDomain)telephonyStatusDomain
{
  return self->_telephonyStatusDomain;
}

- (STWifiStatusDomain)wifiStatusDomain
{
  return self->_wifiStatusDomain;
}

- (SBWindowScene)mainDisplayWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setMainDisplayWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_wifiStatusDomain, 0);
  objc_storeStrong((id *)&self->_telephonyStatusDomain, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_displayReferenceModeMonitor, 0);
  objc_storeStrong((id *)&self->_dataProvidersByIdentifier, 0);
}

@end