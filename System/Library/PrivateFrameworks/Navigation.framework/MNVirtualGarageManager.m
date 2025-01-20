@interface MNVirtualGarageManager
+ (MNVirtualGarageManager)sharedManager;
- (BOOL)_isStandardProvider:(id)a3;
- (BOOL)assumesFullCharge;
- (BOOL)isProviderStarted;
- (NSString)lastVehicleName;
- (VGVehicle)lastVehicle;
- (id)_standardVirtualGarageProvider;
- (id)initPrivate;
- (unint64_t)vehiclesCount;
- (void)_start;
- (void)_stop;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTraceRecorder:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updatedVehicleStateWithHandler:(id)a3;
- (void)virtualGarageProvider:(id)a3 didUpdateSelectedVehicle:(id)a4;
@end

@implementation MNVirtualGarageManager

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)MNVirtualGarageManager;
  v2 = [(MNVirtualGarageManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1F0E3AB08 queue:0];
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v3;

    v5 = [(MNVirtualGarageManager *)v2 _standardVirtualGarageProvider];
    [(MNVirtualGarageManager *)v2 setProvider:v5];
  }
  return v2;
}

- (void)dealloc
{
  [(MNVirtualGarageProvider *)self->_provider setVirtualGarageDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MNVirtualGarageManager;
  [(MNVirtualGarageManager *)&v3 dealloc];
}

+ (MNVirtualGarageManager)sharedManager
{
  if (qword_1EB59C2F0 != -1) {
    dispatch_once(&qword_1EB59C2F0, &__block_literal_global_50);
  }
  v2 = (void *)_MergedGlobals_49;
  return (MNVirtualGarageManager *)v2;
}

uint64_t __39__MNVirtualGarageManager_sharedManager__block_invoke()
{
  id v0 = [[MNVirtualGarageManager alloc] initPrivate];
  uint64_t v1 = _MergedGlobals_49;
  _MergedGlobals_49 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setProvider:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  provider = self->_provider;
  if (provider != (MNVirtualGarageProvider *)v4)
  {
    if (!provider
      || (id obj = (id)v4,
          BOOL v7 = -[MNVirtualGarageManager _isStandardProvider:](self, "_isStandardProvider:"),
          uint64_t v5 = (uint64_t)obj,
          !v7)
      || (uint64_t v4 = [(MNVirtualGarageManager *)self _isStandardProvider:self->_provider],
          uint64_t v5 = (uint64_t)obj,
          (v4 & 1) == 0))
    {
      if (!v5)
      {
        uint64_t v5 = [(MNVirtualGarageManager *)self _standardVirtualGarageProvider];
      }
      id obja = (id)v5;
      [(MNVirtualGarageProvider *)self->_provider setVirtualGarageDelegate:0];
      [(MNVirtualGarageProvider *)self->_provider stopVirtualGarageUpdates];
      objc_storeStrong((id *)&self->_provider, obja);
      [(MNVirtualGarageProvider *)self->_provider setVirtualGarageDelegate:self];
      lastVehicle = self->_lastVehicle;
      self->_lastVehicle = 0;

      if (self->_isStarted) {
        uint64_t v4 = [(MNVirtualGarageProvider *)self->_provider startVirtualGarageUpdates];
      }
    }
  }
  MEMORY[0x1F4181820](v4);
}

- (void)setTraceRecorder:(id)a3
{
}

- (unint64_t)vehiclesCount
{
  return [(MNVirtualGarageProvider *)self->_provider vehiclesCount];
}

- (BOOL)assumesFullCharge
{
  return [(MNVirtualGarageProvider *)self->_provider assumesFullCharge];
}

- (BOOL)isProviderStarted
{
  return [(MNVirtualGarageProvider *)self->_provider isStarted];
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4 = a3;
  provider = self->_provider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MNVirtualGarageManager_updatedVehicleStateWithHandler___block_invoke;
  v7[3] = &unk_1E60FAEA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MNVirtualGarageProvider *)provider updatedVehicleStateWithHandler:v7];
}

void __57__MNVirtualGarageManager_updatedVehicleStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v10 displayName];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v6;

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v5;
    if (self->_isStarted)
    {
      id v4 = (id)[(GEOObserverHashTable *)observers registerObserver:v5];
    }
    else
    {
      char v7 = [(GEOObserverHashTable *)observers hasObservers];
      id v4 = (id)[(GEOObserverHashTable *)self->_observers registerObserver:v8];
      id v5 = v8;
      if (v7) {
        goto LABEL_7;
      }
      id v4 = (id)[(MNVirtualGarageManager *)self _start];
    }
    id v5 = v8;
  }
LABEL_7:
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
    uint64_t v5 = v6;
    if (self->_isStarted)
    {
      uint64_t v4 = [(GEOObserverHashTable *)self->_observers hasObservers];
      uint64_t v5 = v6;
      if ((v4 & 1) == 0)
      {
        uint64_t v4 = [(MNVirtualGarageManager *)self _stop];
        uint64_t v5 = v6;
      }
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_start
{
  if (!self->_isStarted)
  {
    lastVehicle = self->_lastVehicle;
    self->_lastVehicle = 0;

    [(MNVirtualGarageProvider *)self->_provider startVirtualGarageUpdates];
    self->_isStarted = 1;
  }
}

- (void)_stop
{
  if (self->_isStarted)
  {
    [(MNVirtualGarageProvider *)self->_provider stopVirtualGarageUpdates];
    self->_isStarted = 0;
    lastVehicle = self->_lastVehicle;
    self->_lastVehicle = 0;
  }
}

- (id)_standardVirtualGarageProvider
{
  v2 = objc_alloc_init(MNVirtualGarageStandardProvider);
  return v2;
}

- (BOOL)_isStandardProvider:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

- (void)virtualGarageProvider:(id)a3 didUpdateSelectedVehicle:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MNGetMNVirtualGarageManagerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v5 displayedBatteryPercentage];
    v25 = [v5 currentVehicleState];
    v24 = [v25 currentEVRange];
    v23 = [MEMORY[0x1E4F291E0] meters];
    v22 = [v24 measurementByConvertingToUnit:v23];
    [v22 doubleValue];
    uint64_t v8 = v7;
    v21 = [v5 currentVehicleState];
    uint64_t v9 = [v21 currentBatteryCapacity];
    id v10 = [MEMORY[0x1E4F291B0] kilowattHours];
    [v9 measurementByConvertingToUnit:v10];
    v11 = v26 = self;
    [v11 doubleValue];
    uint64_t v13 = v12;
    v14 = [v5 currentVehicleState];
    int v15 = [v14 isCharging];
    v16 = [v5 identifier];
    v17 = [v5 currentVehicleState];
    v18 = [v17 identifier];
    *(_DWORD *)buf = 134219266;
    uint64_t v30 = v20;
    __int16 v31 = 2048;
    uint64_t v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = v13;
    __int16 v35 = 1024;
    int v36 = v15;
    __int16 v37 = 2112;
    v38 = v16;
    __int16 v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "Vehicle update | Battery: %lu%%, Range: %0.0f m, Charge: %0.0f kWH, isCharging: %d | %@ %@", buf, 0x3Au);

    self = v26;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MNVirtualGarageManager_virtualGarageProvider_didUpdateSelectedVehicle___block_invoke;
  block[3] = &unk_1E60F6668;
  block[4] = self;
  id v28 = v5;
  id v19 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__MNVirtualGarageManager_virtualGarageProvider_didUpdateSelectedVehicle___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) identifier];
  id v3 = [*(id *)(a1 + 40) identifier];
  unint64_t v4 = v2;
  unint64_t v5 = v3;
  if (v4 | v5 && (int v6 = [(id)v4 isEqual:v5], (id)v5, (id)v4, !v6))
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) currentVehicleState];
    uint64_t v8 = [v7 identifier];
    uint64_t v9 = [*(id *)(a1 + 40) currentVehicleState];
    uint64_t v10 = [v9 identifier];
    if (v8 | v10) {
      uint64_t v11 = [(id)v8 isEqual:v10] ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 40) recordVirtualGarageVehicleState:*(void *)(a1 + 40) isDifferentVehicle:v11];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v12 = [*(id *)(a1 + 40) displayName];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 56);
  *(void *)(v13 + 56) = v12;

  int v15 = *(void **)(*(void *)(a1 + 32) + 24);
  return objc_msgSend(v15, "virtualGarageManager:didUpdateSelectedVehicle:");
}

- (VGVehicle)lastVehicle
{
  return self->_lastVehicle;
}

- (NSString)lastVehicleName
{
  return self->_lastVehicleName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVehicleName, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_lastVehicle, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end