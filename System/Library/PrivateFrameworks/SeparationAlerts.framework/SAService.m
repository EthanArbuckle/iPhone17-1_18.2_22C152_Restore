@interface SAService
- (NSHashTable)clients;
- (SADeviceRecord)deviceRecord;
- (SAFenceManager)fenceManager;
- (SAMonitoringSessionManager)monitoringSessionManager;
- (SAPersistenceManager)persistenceManager;
- (SAPowerLog)powerLogger;
- (SAService)initWithAnalytics:(id)a3 isReplay:(BOOL)a4 audioAccessoryManager:(id)a5;
- (SATime)clock;
- (SATravelTypeClassifier)travelTypeClassifier;
- (SAWithYouDetector)withYouDetector;
- (void)addClient:(id)a3;
- (void)addGeofence:(id)a3;
- (void)cancelSATimeEventForAlarm:(id)a3;
- (void)enableMonitoringForSeparations:(BOOL)a3;
- (void)fetchLastVisit;
- (void)ingestTAEvent:(id)a3;
- (void)notifySeparationsForDevices:(id)a3 withLocation:(id)a4 withContext:(id)a5;
- (void)removeClient:(id)a3;
- (void)removeGeofence:(id)a3;
- (void)requestBluetoothScanForTypes:(unint64_t)a3;
- (void)requestLocationForType:(unint64_t)a3;
- (void)requestStateForRegion:(id)a3;
- (void)scheduleSATimeEvent:(double)a3 forAlarm:(id)a4;
- (void)setClients:(id)a3;
- (void)setClock:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setFenceManager:(id)a3;
- (void)setMonitoringSessionManager:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPowerLogger:(id)a3;
- (void)setTravelTypeClassifier:(id)a3;
- (void)setWithYouDetector:(id)a3;
- (void)startBackgroundScanning;
- (void)stopBackgroundScanning;
- (void)stopLongAggressiveScan;
- (void)updatedMonitoringState:(unint64_t)a3 forDeviceUUID:(id)a4;
@end

@implementation SAService

- (void)ingestTAEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 description];
    v15[0] = 68289283;
    v15[1] = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2113;
    v19 = v7;
    _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Ingesting event\", \"Event\":\"%{private}@\"}", (uint8_t *)v15, 0x1Cu);
  }
  +[SALoggingUtilities logTAEvent:v4];
  v8 = [(SAService *)self clock];
  [v8 ingestTAEvent:v4];

  v9 = [(SAService *)self deviceRecord];
  [v9 ingestTAEvent:v4];

  v10 = [(SAService *)self withYouDetector];
  [v10 ingestTAEvent:v4];

  v11 = [(SAService *)self monitoringSessionManager];
  [v11 ingestTAEvent:v4];

  v12 = [(SAService *)self fenceManager];
  [v12 ingestTAEvent:v4];

  v13 = [(SAService *)self travelTypeClassifier];
  [v13 ingestTAEvent:v4];

  v14 = [(SAService *)self powerLogger];
  [v14 ingestTAEvent:v4];
}

- (SAWithYouDetector)withYouDetector
{
  return self->_withYouDetector;
}

- (SATravelTypeClassifier)travelTypeClassifier
{
  return self->_travelTypeClassifier;
}

- (SAPowerLog)powerLogger
{
  return self->_powerLogger;
}

- (SAMonitoringSessionManager)monitoringSessionManager
{
  return self->_monitoringSessionManager;
}

- (SAFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (SATime)clock
{
  return self->_clock;
}

- (SAService)initWithAnalytics:(id)a3 isReplay:(BOOL)a4 audioAccessoryManager:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SAService;
  v10 = [(SAService *)&v32 init];
  if (v10)
  {
    TARegisterLogs();
    uint64_t v11 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    v13 = [[SATime alloc] initWithExternalTimer:v10 isReplay:v6];
    clock = v10->_clock;
    v10->_clock = v13;

    v15 = [[SADeviceRecord alloc] initWithClock:v10->_clock analytics:v8];
    deviceRecord = v10->_deviceRecord;
    v10->_deviceRecord = v15;

    v17 = [[SATravelTypeClassifier alloc] initWithClock:v10->_clock];
    travelTypeClassifier = v10->_travelTypeClassifier;
    v10->_travelTypeClassifier = v17;

    v19 = [[SAWithYouDetector alloc] initWithBluetoothScanner:v10 locationRequester:v10 deviceRecord:v10->_deviceRecord clock:v10->_clock analytics:v8];
    withYouDetector = v10->_withYouDetector;
    v10->_withYouDetector = v19;

    v21 = objc_alloc_init(SAFenceManager);
    fenceManager = v10->_fenceManager;
    v10->_fenceManager = v21;

    v23 = [SAPersistenceManager alloc];
    v24 = objc_alloc_init(SAPersistenceManagerSettings);
    uint64_t v25 = [(SAPersistenceManager *)v23 initWithSettings:v24];
    persistenceManager = v10->_persistenceManager;
    v10->_persistenceManager = (SAPersistenceManager *)v25;

    v27 = [[SAMonitoringSessionManager alloc] initWithWithYouDetector:v10->_withYouDetector fenceRequestServicer:v10 fenceManager:v10->_fenceManager travelTypeClassifier:v10->_travelTypeClassifier clock:v10->_clock deviceRecord:v10->_deviceRecord analytics:v8 persistenceManager:v10->_persistenceManager audioAccessoryManager:v9];
    monitoringSessionManager = v10->_monitoringSessionManager;
    v10->_monitoringSessionManager = v27;

    v29 = [[SAPowerLog alloc] initWithClock:v10->_clock isReplay:v6];
    powerLogger = v10->_powerLogger;
    v10->_powerLogger = v29;

    [(SAPowerLog *)v10->_powerLogger addClient:v10];
    [(SAMonitoringSessionManager *)v10->_monitoringSessionManager addClient:v10];
    [(SAFenceManager *)v10->_fenceManager addClient:v10];
    [(SATravelTypeClassifier *)v10->_travelTypeClassifier addClient:v10->_withYouDetector];
  }

  return v10;
}

- (void)addClient:(id)a3
{
}

- (void)removeClient:(id)a3
{
}

- (void)enableMonitoringForSeparations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v18 = v3;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service enableMonitoringForSeparations: %{public}d", buf, 8u);
  }
  BOOL v6 = [(NSHashTable *)self->_clients allObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 separationAlertsService:self enableMonitoringForSeparations:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)notifySeparationsForDevices:(id)a3 withLocation:(id)a4 withContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    uint64_t v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v11;
      *(_DWORD *)buf = 134283521;
      uint64_t v26 = [v8 count];
      _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEFAULT, "#sa Service notifyAboutDevices:%{private}lu", buf, 0xCu);
    }
    long long v13 = [(SAService *)self powerLogger];
    objc_msgSend(v13, "increaseSeparationAlertsCount:", objc_msgSend(v8, "count"));

    long long v14 = [(NSHashTable *)self->_clients allObjects];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
          if (objc_opt_respondsToSelector()) {
            [v19 separationAlertsService:self notifySeparationsForDevices:v8 withLocation:v9 withContext:v10];
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

- (void)requestBluetoothScanForTypes:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestBluetoothScan:%{private}#lx", buf, 0xCu);
  }
  BOOL v6 = [(SAService *)self powerLogger];
  [v6 increaseBTScanCount];

  uint64_t v7 = [(NSHashTable *)self->_clients allObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 separationAlertsService:self requestBluetoothScanForTypes:a3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)requestLocationForType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestLocationForType:%{private}#lx", buf, 0xCu);
  }
  if (a3 == 1)
  {
    BOOL v6 = [(SAService *)self powerLogger];
    [v6 increaseWifiLocationRequestCount];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    BOOL v6 = [(SAService *)self powerLogger];
    [v6 increaseGpsLocationRequestCount];
  }

LABEL_8:
  uint64_t v7 = [(NSHashTable *)self->_clients allObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 separationAlertsService:self requestLocationForType:a3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)addGeofence:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service addGeofence", buf, 2u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 isLowPower] & 1) == 0)
      {
        uint64_t v7 = [(SAService *)self powerLogger];
        [v7 increaseGeofenceCount];
      }
    }
    uint64_t v8 = [(NSHashTable *)self->_clients allObjects];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 separationAlertsService:self addGeofence:v4];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)removeGeofence:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service removeGeofence", buf, 2u);
    }
    id v6 = [(NSHashTable *)self->_clients allObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 separationAlertsService:self removeGeofence:v4];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)requestStateForRegion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "#sa Service requestStateForRegion", buf, 2u);
    }
    id v6 = [(NSHashTable *)self->_clients allObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 separationAlertsService:self requestStateForRegion:v4];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)scheduleSATimeEvent:(double)a3 forAlarm:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v20 = a3;
    _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEFAULT, "#sa Service scheduleSATimeEvent:%{public}#lf", buf, 0xCu);
  }
  uint64_t v8 = [(NSHashTable *)self->_clients allObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 separationAlertsService:self scheduleSATimeEvent:v6 forAlarm:a3];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)cancelSATimeEventForAlarm:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289282;
    __int16 v18 = 2082;
    unint64_t v19 = "";
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service cancelSATimeEventForAlarm\", \"uuid\":\"%{public}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  id v6 = [(NSHashTable *)self->_clients allObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 separationAlertsService:self cancelSATimeEventForAlarm:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)startBackgroundScanning
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    long long v17 = "";
    _os_log_impl(&dword_1D15FC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service startBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
  }
  id v4 = [(NSHashTable *)self->_clients allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 separationAlertsServiceStartBackgroundScanning:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)stopBackgroundScanning
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    long long v17 = "";
    _os_log_impl(&dword_1D15FC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service stopBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
  }
  id v4 = [(NSHashTable *)self->_clients allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 separationAlertsServiceStopBackgroundScanning:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)stopLongAggressiveScan
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    long long v17 = "";
    _os_log_impl(&dword_1D15FC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service stopLongAggressiveScan\"}", (uint8_t *)&buf, 0x12u);
  }
  id v4 = [(NSHashTable *)self->_clients allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 separationAlertsServiceStopLongAggressiveScan:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)fetchLastVisit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    long long v17 = "";
    _os_log_impl(&dword_1D15FC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa Service fetchLastVisit\"}", (uint8_t *)&buf, 0x12u);
  }
  id v4 = [(NSHashTable *)self->_clients allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 separationAlertsServiceFetchLastVisit:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)updatedMonitoringState:(unint64_t)a3 forDeviceUUID:(id)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v6 = a4;
    id v7 = [(SAService *)self powerLogger];
    [v7 addMonitoredDevice:v6];
  }
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void)setClock:(id)a3
{
}

- (void)setDeviceRecord:(id)a3
{
}

- (void)setWithYouDetector:(id)a3
{
}

- (void)setMonitoringSessionManager:(id)a3
{
}

- (void)setFenceManager:(id)a3
{
}

- (void)setTravelTypeClassifier:(id)a3
{
}

- (void)setPowerLogger:(id)a3
{
}

- (SAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_travelTypeClassifier, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_monitoringSessionManager, 0);
  objc_storeStrong((id *)&self->_withYouDetector, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end