@interface MNVirtualGarageStandardProvider
- (BOOL)assumesFullCharge;
- (BOOL)isStarted;
- (MNVirtualGarageProviderDelegate)virtualGarageDelegate;
- (MNVirtualGarageStandardProvider)init;
- (id)_selectedVehicle;
- (unint64_t)vehiclesCount;
- (void)_forceVirtualGarageSyncWithHandler:(id)a3;
- (void)_sendVirtualGarageUpdateForSelectedVehicle:(id)a3;
- (void)_setVirtualGarage:(id)a3;
- (void)_updateCachedPropertiesForGarage:(id)a3;
- (void)dealloc;
- (void)setVirtualGarageDelegate:(id)a3;
- (void)startVirtualGarageUpdates;
- (void)stopVirtualGarageUpdates;
- (void)updatedVehicleStateWithHandler:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation MNVirtualGarageStandardProvider

- (MNVirtualGarageStandardProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNVirtualGarageStandardProvider;
  v2 = [(MNVirtualGarageStandardProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    garageIsolater = v2->_garageIsolater;
    v2->_garageIsolater = (geo_isolater *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSTimer *)self->_forceUpdateTimer invalidate];
  [(MNVirtualGarageStandardProvider *)self stopVirtualGarageUpdates];
  v3.receiver = self;
  v3.super_class = (Class)MNVirtualGarageStandardProvider;
  [(MNVirtualGarageStandardProvider *)&v3 dealloc];
}

- (void)startVirtualGarageUpdates
{
  if (!self->_isStarted)
  {
    GEOConfigGetDouble();
    self->_forcePeriodicUpdateInterval = v3;
    v4 = [MEMORY[0x1E4FB3E48] sharedService];
    [v4 openForClient:self];
    [v4 registerObserver:self];
    v5 = MNGetMNVirtualGarageManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "MNVirtualGarageStandardProvider starting VGVirtualGarage connection.", v6, 2u);
    }

    [v4 virtualGarageStartContinuousUpdatesIfNeeded];
    self->_isStarted = 1;
    [(MNVirtualGarageStandardProvider *)self _forceVirtualGarageSyncWithHandler:0];
  }
}

- (void)stopVirtualGarageUpdates
{
  if (self->_isStarted)
  {
    updateQueue = self->_updateQueue;
    self->_updateQueue = 0;

    [(NSTimer *)self->_forceUpdateTimer invalidate];
    forceUpdateTimer = self->_forceUpdateTimer;
    self->_forceUpdateTimer = 0;

    v5 = [MEMORY[0x1E4FB3E48] sharedService];
    [v5 unregisterObserver:self];
    objc_super v6 = MNGetMNVirtualGarageManagerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "MNVirtualGarageStandardProvider stopping VGVirtualGarage connection.", v7, 2u);
    }

    [v5 virtualGarageEndContinuousUpdates];
    [v5 closeForClient:self];
    [(MNVirtualGarageStandardProvider *)self _setVirtualGarage:0];
    self->_isStarted = 0;
  }
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    objc_super v6 = [MEMORY[0x1E4FB3E48] sharedService];
    [v6 openForClient:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__MNVirtualGarageStandardProvider_updatedVehicleStateWithHandler___block_invoke;
    v9[3] = &unk_1E60FC018;
    id v10 = v6;
    id v11 = v5;
    id v12 = v4;
    id v7 = v5;
    id v8 = v6;
    [(MNVirtualGarageStandardProvider *)self _forceVirtualGarageSyncWithHandler:v9];
  }
}

void __66__MNVirtualGarageStandardProvider_updatedVehicleStateWithHandler___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = a2;
  [v5 closeForClient:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

- (unint64_t)vehiclesCount
{
  v5 = self->_garageIsolater;
  _geo_isolate_lock_data();
  unint64_t vehiclesCount = self->_vehiclesCount;
  _geo_isolate_unlock();

  return vehiclesCount;
}

- (BOOL)assumesFullCharge
{
  v2 = self;
  id v4 = self->_garageIsolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_assumesFullCharge;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)_setVirtualGarage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = v4;
  id v5 = v4;
  geo_isolate_sync_data();
  -[MNVirtualGarageStandardProvider _updateCachedPropertiesForGarage:](self, "_updateCachedPropertiesForGarage:", v5, v6, 3221225472, __53__MNVirtualGarageStandardProvider__setVirtualGarage___block_invoke, &unk_1E60F6668, self);
}

void __53__MNVirtualGarageStandardProvider__setVirtualGarage___block_invoke(uint64_t a1)
{
}

- (void)_updateCachedPropertiesForGarage:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __68__MNVirtualGarageStandardProvider__updateCachedPropertiesForGarage___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) vehicles];
  *(void *)(*(void *)(a1 + 32) + 48) = [v2 count];

  uint64_t result = [*(id *)(a1 + 40) shouldAssumeFullCharge];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

- (id)_selectedVehicle
{
  id v5 = self->_garageIsolater;
  _geo_isolate_lock_data();
  id v3 = [(VGVirtualGarage *)self->_garage selectedVehicle];
  _geo_isolate_unlock();

  return v3;
}

- (void)_forceVirtualGarageSyncWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4FB3E48] sharedService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke;
  v8[3] = &unk_1E60FC068;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v9 = v7;
  [v7 virtualGarageGetGarageWithReply:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateCachedPropertiesForGarage:v5];

  if (v6
    || ([v5 selectedVehicle], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    id v10 = [v5 selectedVehicle];
    if ([v10 isPureElectricVehicle])
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v5 selectedVehicle];
      v13 = [v12 identifier];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke_2;
      v15[3] = &unk_1E60FC040;
      id v16 = *(id *)(a1 + 40);
      [v11 virtualGarageGetLatestStateOfVehicleWithIdentifier:v13 syncAcrossDevices:0 withReply:v15];
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v10, 0);
      }
    }
  }
}

uint64_t __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_sendVirtualGarageUpdateForSelectedVehicle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke;
  v6[3] = &unk_1E60F6668;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 virtualGarageProvider:*(void *)(a1 + 32) didUpdateSelectedVehicle:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  id v7 = *(double **)(a1 + 32);
  if (v7[4] > 0.0)
  {
    objc_initWeak(&location, v7);
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(double *)(v9 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke_2;
    v14[3] = &unk_1E60FBDE0;
    v14[4] = v9;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [v8 scheduledTimerWithTimeInterval:0 repeats:v14 block:v10];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MNGetMNVirtualGarageManagerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "MNVirtualGarageStandardProvider forcing VirtualGarage periodic update after %0.0f seconds.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _forceVirtualGarageSyncWithHandler:0];
}

- (void)virtualGarageDidUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 selectedVehicle];
  uint64_t v6 = [(MNVirtualGarageStandardProvider *)self _selectedVehicle];
  if (!(v6 | v5)) {
    goto LABEL_9;
  }
  uint64_t v7 = [(id)v5 identifier];
  uint64_t v8 = [(id)v6 identifier];
  if (([v7 isEqualToString:v8] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v9 = [(id)v5 currentVehicleState];
  double v10 = [(id)v6 currentVehicleState];
  char v11 = [v9 isSignificantlyDifferentFromVehicleState:v10];

  if (v11)
  {
LABEL_8:
    [(MNVirtualGarageStandardProvider *)self _setVirtualGarage:v4];
    id v15 = [v4 selectedVehicle];
    [(MNVirtualGarageStandardProvider *)self _sendVirtualGarageUpdateForSelectedVehicle:v15];

    goto LABEL_9;
  }
  uint64_t v12 = MNGetMNVirtualGarageManagerLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [(id)v5 currentVehicleState];
    uint64_t v14 = [(id)v6 currentVehicleState];
    int v16 = 138412546;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "MNVirtualGarageStandardProvider received an update to the selected vehicle that was not significantly different from the previous one. Will ignore this update. newSelectedVehicle.state: %@\n currentVehicle.state: %@", (uint8_t *)&v16, 0x16u);
  }
LABEL_9:
}

- (MNVirtualGarageProviderDelegate)virtualGarageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNVirtualGarageProviderDelegate *)WeakRetained;
}

- (void)setVirtualGarageDelegate:(id)a3
{
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garageIsolater, 0);
  objc_storeStrong((id *)&self->_garage, 0);
  objc_storeStrong((id *)&self->_forceUpdateTimer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end