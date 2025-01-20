@interface MNParkedVehicleDetector
- (MNParkedVehicleDetectorDelegate)delegate;
- (void)_checkParkingConditions;
- (void)_expireVehicleDisconnectSignal;
- (void)_locationStoppedTimer:(id)a3;
- (void)_updateForParkedCar;
- (void)_updateForResumeDriving;
- (void)_updateVehicleMonitorShouldStart:(BOOL)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)updateForLocation:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)vehicleMonitorDidConnectToVehicle:(id)a3;
- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3;
@end

@implementation MNParkedVehicleDetector

- (void)dealloc
{
  [(MNParkedVehicleDetector *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)MNParkedVehicleDetector;
  [(MNParkedVehicleDetector *)&v3 dealloc];
}

- (void)startMonitoring
{
  if (!self->_isMonitoring)
  {
    self->_isMonitoring = 1;
    self->_state = 0;
    objc_initWeak(&location, self);
    objc_super v3 = [getRTRoutineManagerClass() defaultManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke;
    v9[3] = &unk_1E60FC0D8;
    objc_copyWeak(&v10, &location);
    [v3 startMonitoringVehicleEventsWithHandler:v9];

    v4 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Started monitoring vehicle events from RTRoutineManager", buf, 2u);
    }

    id v5 = MEMORY[0x1E4F14428];
    _GEOConfigAddDelegateListenerForKey();

    [(MNParkedVehicleDetector *)self _updateVehicleMonitorShouldStart:1];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke_13;
    handler[3] = &unk_1E60F7738;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("com.apple.navd.SimulateParkedVehicleEvent", &self->_simulateParkedVehicleEventToken, MEMORY[0x1E4F14428], handler);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke_2;
  block[3] = &unk_1E60FC0B0;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v12);
}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v13 = 138412290;
      *(void *)v14 = v3;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "Error monitoring vehicle events: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (![*(id *)(a1 + 40) count]) {
      return;
    }
    v2 = [*(id *)(a1 + 40) firstObject];
    v4 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 40) count];
      id v6 = [v2 identifier];
      id v7 = [v2 location];
      [v7 latitude];
      uint64_t v9 = v8;
      id v10 = [v2 location];
      [v10 longitude];
      int v13 = 67109890;
      *(_DWORD *)v14 = v5;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Vehicle event (%d) received from RTRoutineManager: %@, %f, %f", (uint8_t *)&v13, 0x26u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _updateForParkedCar];
  }
}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke_13(uint64_t a1)
{
  v2 = MNGetMNParkedVehicleDetectorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Simulating parked vehicle event.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForParkedCar];
}

- (void)stopMonitoring
{
  if (self->_isMonitoring)
  {
    [(NSTimer *)self->_locationStoppedTimer invalidate];
    locationStoppedTimer = self->_locationStoppedTimer;
    self->_locationStoppedTimer = 0;

    [(NSTimer *)self->_vehicleDisconnectExpirationTimer invalidate];
    vehicleDisconnectExpirationTimer = self->_vehicleDisconnectExpirationTimer;
    self->_vehicleDisconnectExpirationTimer = 0;

    notify_cancel(self->_simulateParkedVehicleEventToken);
    self->_simulateParkedVehicleEventToken = 0;
    GEOConfigRemoveDelegateListenerForAllKeys();
    [(MNParkedVehicleDetector *)self _updateVehicleMonitorShouldStart:0];
    int v5 = [getRTRoutineManagerClass() defaultManager];
    [v5 stopMonitoringVehicleEvents];

    id v6 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Stopped monitoring vehicle events from RTRoutineManager", v7, 2u);
    }

    self->_isMonitoring = 0;
  }
}

- (void)updateForLocation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 speed];
  double v6 = v5;
  GEOConfigGetDouble();
  if (v6 >= v7)
  {
    self->_locationStoppedCondition = 0;
    if (self->_locationStoppedTimer)
    {
      uint64_t v11 = MNGetMNParkedVehicleDetectorLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "Resetting stopped location timer.", (uint8_t *)&v20, 2u);
      }

      locationStoppedTimer = self->_locationStoppedTimer;
    }
    else
    {
      locationStoppedTimer = 0;
    }
    [(NSTimer *)locationStoppedTimer invalidate];
    id v10 = self->_locationStoppedTimer;
    self->_locationStoppedTimer = 0;
  }
  else
  {
    if (self->_locationStoppedTimer) {
      goto LABEL_13;
    }
    uint64_t v8 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "Starting stopped location timer.", (uint8_t *)&v20, 2u);
    }

    GEOConfigGetDouble();
    objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__locationStoppedTimer_, 0, 0);
    uint64_t v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_locationStoppedTimer;
    self->_locationStoppedTimer = v9;
  }

LABEL_13:
  GEOConfigGetDouble();
  double v14 = v13;
  [v4 speed];
  if (v15 >= v14)
  {
    if (self->_state == 1)
    {
      uint64_t v16 = MNGetMNParkedVehicleDetectorLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [v4 speed];
        int v20 = 134218240;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        double v23 = v14;
        _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Location exceeds speed threshold while in parked state: %0.2f >= %0.2f", (uint8_t *)&v20, 0x16u);
      }

      [(MNParkedVehicleDetector *)self _updateForResumeDriving];
    }
    else if (self->_vehicleDisconnectedCondition)
    {
      uint64_t v18 = MNGetMNParkedVehicleDetectorLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        [v4 speed];
        int v20 = 134218240;
        uint64_t v21 = v19;
        __int16 v22 = 2048;
        double v23 = v14;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "Vehicle disconnect signal was detected but speed is too fast (%0.2f >= %0.2f) so ignoring signal.", (uint8_t *)&v20, 0x16u);
      }

      [(MNParkedVehicleDetector *)self _expireVehicleDisconnectSignal];
    }
  }
}

- (void)_locationStoppedTimer:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MNParkedVehicleDetector__locationStoppedTimer___block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__MNParkedVehicleDetector__locationStoppedTimer___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MNGetMNParkedVehicleDetectorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    GEOConfigGetDouble();
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "Detected stopped location for consecutive %g seconds.", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  return [*(id *)(a1 + 32) _checkParkingConditions];
}

- (void)_updateForParkedCar
{
  if (self->_state != 1)
  {
    self->_state = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained parkedVehicleDetectorDidDetectParkedVehicle:self];
  }
}

- (void)_updateForResumeDriving
{
  if (self->_state)
  {
    self->_state = 0;
    self->_vehicleDisconnectedCondition = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained parkedVehicleDetectorDidDetectResumeDriving:self];
  }
}

- (void)_updateVehicleMonitorShouldStart:(BOOL)a3
{
  BOOL v3 = a3;
  int BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    uint64_t v6 = objc_alloc_init(MNVehicleMonitor);
    vehicleMonitor = self->_vehicleMonitor;
    self->_vehicleMonitor = v6;

    [(MNVehicleMonitor *)self->_vehicleMonitor setDelegate:self];
    [(MNVehicleMonitor *)self->_vehicleMonitor startMonitoring];
    uint64_t v8 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      uint64_t v9 = "Started monitoring vehicle events from MNVehicleMonitor";
      id v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    [(MNVehicleMonitor *)self->_vehicleMonitor setDelegate:0];
    [(MNVehicleMonitor *)self->_vehicleMonitor stopMonitoring];
    uint64_t v11 = self->_vehicleMonitor;
    self->_vehicleMonitor = 0;

    uint64_t v8 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v9 = "Stopped monitoring vehicle events from MNVehicleMonitor";
      id v10 = (uint8_t *)&v12;
      goto LABEL_7;
    }
  }
}

- (void)_checkParkingConditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_isMonitoring)
  {
    BOOL v3 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL vehicleDisconnectedCondition = self->_vehicleDisconnectedCondition;
      BOOL locationStoppedCondition = self->_locationStoppedCondition;
      v7[0] = 67109376;
      v7[1] = vehicleDisconnectedCondition;
      __int16 v8 = 1024;
      BOOL v9 = locationStoppedCondition;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "vehicleDisconnected: %d, locationStopped: %d", (uint8_t *)v7, 0xEu);
    }

    if (self->_vehicleDisconnectedCondition && self->_locationStoppedCondition)
    {
      uint64_t v6 = MNGetMNParkedVehicleDetectorLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Triggering parked car event.", (uint8_t *)v7, 2u);
      }

      [(MNParkedVehicleDetector *)self _updateForParkedCar];
    }
  }
}

- (void)_expireVehicleDisconnectSignal
{
  self->_BOOL vehicleDisconnectedCondition = 0;
  self->_vehicleDisconnectExpirationTimer = 0;
  MEMORY[0x1F41817F8]();
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (NavigationConfig_Parking_EasyParkingDetection == a3.var0 && off_1E9D565F0 == a3.var1)
  {
    unsigned int BOOL = GEOConfigGetBOOL();
    if (self->_isMonitoring) {
      uint64_t v6 = BOOL;
    }
    else {
      uint64_t v6 = 0;
    }
    [(MNParkedVehicleDetector *)self _updateVehicleMonitorShouldStart:v6];
  }
}

- (void)vehicleMonitorDidConnectToVehicle:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MNParkedVehicleDetector_vehicleMonitorDidConnectToVehicle___block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__MNParkedVehicleDetector_vehicleMonitorDidConnectToVehicle___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  return [*(id *)(a1 + 32) _updateForResumeDriving];
}

- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3
{
  if (GEOConfigGetBOOL())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke;
    block[3] = &unk_1E60F6B98;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke(uint64_t a1)
{
  v2 = MNGetMNParkedVehicleDetectorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Vehicle disconnect received from MNVehicleMonitor.", (uint8_t *)buf, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  [*(id *)(a1 + 32) _checkParkingConditions];
  GEOConfigGetDouble();
  id v4 = v3;
  objc_initWeak(buf, *(id *)(a1 + 32));
  int v5 = (void *)MEMORY[0x1E4F1CB00];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke_18;
  v9[3] = &unk_1E60F6558;
  objc_copyWeak(v10, buf);
  v10[1] = v4;
  uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v9 block:*(double *)&v4];
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v6;

  objc_destroyWeak(v10);
  objc_destroyWeak(buf);
}

void __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke_18(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 72))
  {
    id v4 = MNGetMNParkedVehicleDetectorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Expiring _vehicleDisconnectedCondition because %g seconds has elapsed since the vehicle disconnect.", (uint8_t *)&v6, 0xCu);
    }

    [v3 _expireVehicleDisconnectSignal];
  }
}

- (MNParkedVehicleDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNParkedVehicleDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleDisconnectExpirationTimer, 0);
  objc_storeStrong((id *)&self->_locationStoppedTimer, 0);
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end