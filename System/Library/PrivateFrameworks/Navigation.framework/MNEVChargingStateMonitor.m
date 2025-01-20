@interface MNEVChargingStateMonitor
- (MNEVChargingStateMonitor)initWithTargetBatteryCharge:(id)a3;
- (MNEVChargingStateMonitorDelegate)delegate;
- (NSMeasurement)targetBatteryCharge;
- (void)_notifyShouldShowChargingInfo;
- (void)_startTimer;
- (void)_updateForVehicle:(id)a3 forceDelegateCallback:(BOOL)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateForLocation:(id)a3;
- (void)virtualGarageManager:(id)a3 didUpdateSelectedVehicle:(id)a4;
@end

@implementation MNEVChargingStateMonitor

- (MNEVChargingStateMonitor)initWithTargetBatteryCharge:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MNEVChargingStateMonitor;
  v6 = [(MNEVChargingStateMonitor *)&v18 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_targetBatteryCharge, a3);
  v7->_shouldShowChargingInfo = 0;
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [MEMORY[0x1E4F291B0] kilowattHours];
    v10 = [v5 measurementByConvertingToUnit:v9];
    [v10 doubleValue];
    *(_DWORD *)buf = 67109120;
    int v20 = (int)(v11 * 1000.0);
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Monitoring battery charge updates. Target battery charge: %d Wh", buf, 8u);
  }
  v12 = +[MNVirtualGarageManager sharedManager];
  [v12 registerObserver:v7];
  v13 = [v12 lastVehicle];

  if (v13)
  {
    v14 = [v12 lastVehicle];
    [(MNEVChargingStateMonitor *)v7 _updateForVehicle:v14 forceDelegateCallback:1];

LABEL_6:
    v15 = v7;
    goto LABEL_10;
  }
  v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "Failed to get selected vehicle.", buf, 2u);
  }

  v15 = 0;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  v3 = +[MNVirtualGarageManager sharedManager];
  [v3 unregisterObserver:self];

  [(NSTimer *)self->_timer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MNEVChargingStateMonitor;
  [(MNEVChargingStateMonitor *)&v4 dealloc];
}

- (void)updateForLocation:(id)a3
{
  id v4 = a3;
  if (!self->_shouldShowChargingInfo)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    [v5 timeIntervalSinceDate:self->_arrivalDate];
    double v7 = v6;
    GEOConfigGetDouble();
    double v9 = v8;

    if (v7 > v9)
    {
      [v4 speed];
      double v11 = v10;
      GEOConfigGetDouble();
      if (v11 <= v12)
      {
        v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Notifying should show charging info because user stopped near charging station waypoint.", v14, 2u);
        }

        [(MNEVChargingStateMonitor *)self _notifyShouldShowChargingInfo];
      }
    }
  }
}

- (void)_startTimer
{
  if (!self->_timer)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    arrivalDate = self->_arrivalDate;
    self->_arrivalDate = v3;

    GEOConfigGetDouble();
    double v6 = v5;
    objc_initWeak(&location, self);
    double v7 = (void *)MEMORY[0x1E4F1CB00];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__MNEVChargingStateMonitor__startTimer__block_invoke;
    v10[3] = &unk_1E60F6558;
    v11[1] = v6;
    objc_copyWeak(v11, &location);
    double v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:*(double *)&v6];
    timer = self->_timer;
    self->_timer = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __39__MNEVChargingStateMonitor__startTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Notifying should show charging info because max timer fired after %g seconds.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyShouldShowChargingInfo];
}

- (void)_notifyShouldShowChargingInfo
{
  if (!self->_shouldShowChargingInfo)
  {
    self->_shouldShowChargingInfo = 1;
    [(NSTimer *)self->_timer invalidate];
    id v3 = [(MNEVChargingStateMonitor *)self delegate];
    [v3 evChargingStateMonitorShouldShowChargingInfo:self];
  }
}

- (void)virtualGarageManager:(id)a3 didUpdateSelectedVehicle:(id)a4
{
}

- (void)_updateForVehicle:(id)a3 forceDelegateCallback:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MNEVChargingStateMonitor__updateForVehicle_forceDelegateCallback___block_invoke;
  v8[3] = &unk_1E60F6580;
  id v9 = v6;
  double v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  MNRunAsynchronouslyOnMainThread(v8);
}

void __68__MNEVChargingStateMonitor__updateForVehicle_forceDelegateCallback___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentVehicleState];
  if (v2)
  {
    id v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) isPureElectricVehicle];

    if (v4)
    {
      int v5 = [*(id *)(a1 + 32) currentVehicleState];
      uint64_t v6 = [v5 isCharging];

      if (*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) != v6)
      {
        id v7 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 67109120;
          int v21 = v6;
          _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "VirtualGarage did change charging state: %d", (uint8_t *)&v20, 8u);
        }

        *(unsigned char *)(*(void *)(a1 + 40) + 16) = v6;
        double v8 = [*(id *)(a1 + 40) delegate];
        [v8 evChargingStateMonitor:*(void *)(a1 + 40) didChangeChargingState:v6];
      }
      id v9 = [*(id *)(a1 + 32) currentVehicleState];
      double v10 = [v9 currentBatteryCapacity];
      int v11 = [v10 isGreaterThanOrEqualToMeasurement:*(void *)(*(void *)(a1 + 40) + 40)];

      if (v11)
      {
        double v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [*(id *)(a1 + 32) currentVehicleState];
          v14 = [v13 currentBatteryCapacity];
          v15 = [MEMORY[0x1E4F291B0] kilowattHours];
          v16 = [v14 measurementByConvertingToUnit:v15];
          [v16 doubleValue];
          int v20 = 67109120;
          int v21 = (int)(v17 * 1000.0);
          _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "Target battery charge reached. Current battery: %d Wh", (uint8_t *)&v20, 8u);
        }
        objc_super v18 = [*(id *)(a1 + 40) delegate];
        [v18 evChargingStateMonitor:*(void *)(a1 + 40) didReachTargetBatteryCharge:*(void *)(*(void *)(a1 + 40) + 40)];
      }
      if (v6 && (*(unsigned char *)(a1 + 48) || !*(unsigned char *)(*(void *)(a1 + 40) + 17)))
      {
        v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEFAULT, "Notify should show charging info because charging state set to true", (uint8_t *)&v20, 2u);
        }

        [*(id *)(a1 + 40) _notifyShouldShowChargingInfo];
      }
    }
  }
}

- (NSMeasurement)targetBatteryCharge
{
  return self->_targetBatteryCharge;
}

- (MNEVChargingStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNEVChargingStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBatteryCharge, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end