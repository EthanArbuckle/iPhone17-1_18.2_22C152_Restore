@interface PXDisplayScreenDynamicRangeMonitor
- (BOOL)_currentlySupportsHDRForScreen:(id)a3;
- (BOOL)_isHDRCurrentlySupportedForScreen:(id)a3;
- (BOOL)_isHDRPotentiallySupportedForScreen:(id)a3;
- (BOOL)isMonitoring;
- (BOOL)screenSupportsHDR;
- (PXDisplayScreenDynamicRangeMonitor)init;
- (PXDisplayScreenDynamicRangeMonitor)initWithAutomaticApplicationStateTracking:(BOOL)a3;
- (id)screenProvider;
- (void)_resumeTimer;
- (void)_teardownTimer;
- (void)_updateScreenSupportHDR;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setScreenSupportsHDR:(BOOL)a3;
- (void)startMonitoringWithScreenProvider:(id)a3;
- (void)stopMonitoring;
@end

@implementation PXDisplayScreenDynamicRangeMonitor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_screenProvider, 0);
  objc_storeStrong((id *)&self->_displayEDRMonitorTimer, 0);
}

- (id)screenProvider
{
  return self->_screenProvider;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (BOOL)screenSupportsHDR
{
  return self->_screenSupportsHDR;
}

- (BOOL)_currentlySupportsHDRForScreen:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXDisplayScreenDynamicRangeMonitor *)self _isHDRPotentiallySupportedForScreen:v4]|| [(PXDisplayScreenDynamicRangeMonitor *)self _isHDRCurrentlySupportedForScreen:v4];

  return v5;
}

- (void)_updateScreenSupportHDR
{
  v3 = [(PXDisplayScreenDynamicRangeMonitor *)self screenProvider];
  id v4 = v3[2]();

  BOOL v5 = [(PXDisplayScreenDynamicRangeMonitor *)self _currentlySupportsHDRForScreen:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PXDisplayScreenDynamicRangeMonitor__updateScreenSupportHDR__block_invoke;
  v6[3] = &unk_1E5DCEB78;
  v6[4] = self;
  BOOL v7 = v5;
  [(PXDisplayScreenDynamicRangeMonitor *)self performChanges:v6];
}

uint64_t __61__PXDisplayScreenDynamicRangeMonitor__updateScreenSupportHDR__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setScreenSupportsHDR:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_isHDRCurrentlySupportedForScreen:(id)a3
{
  [a3 currentEDRHeadroom];
  double v4 = v3;
  [MEMORY[0x1E4F7A4A0] overrideDisplayHeadroom];
  if (v5 >= 1.0) {
    double v4 = v5;
  }
  [MEMORY[0x1E4F7A4A0] thresholdDisplayHeadroom];
  return v4 > v6;
}

- (BOOL)_isHDRPotentiallySupportedForScreen:(id)a3
{
  [a3 potentialEDRHeadroom];
  double v4 = v3;
  [MEMORY[0x1E4F7A4A0] overrideDisplayHeadroom];
  if (v5 >= 1.0) {
    double v4 = v5;
  }
  [MEMORY[0x1E4F7A4A0] thresholdDisplayHeadroom];
  if (v4 <= v6)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28F80] processInfo];
    int v8 = [v7 isLowPowerModeEnabled] ^ 1;
  }
  return v8;
}

- (void)_teardownTimer
{
  [(NSTimer *)self->_displayEDRMonitorTimer invalidate];
  displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
  self->_displayEDRMonitorTimer = 0;
}

- (void)_resumeTimer
{
  if (!self->_displayEDRMonitorTimer)
  {
    objc_msgSend(MEMORY[0x1E4F1CB00], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__monitorDisplayEDRHeadroom_, 0, 1, 0.1);
    double v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
    self->_displayEDRMonitorTimer = v3;

    [(NSTimer *)self->_displayEDRMonitorTimer setTolerance:0.1];
    id v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addTimer:self->_displayEDRMonitorTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)setScreenSupportsHDR:(BOOL)a3
{
  if (self->_screenSupportsHDR != a3)
  {
    self->_screenSupportsHDR = a3;
    [(PXDisplayScreenDynamicRangeMonitor *)self signalChange:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)ApplicationStateContext_139527 == a5)
  {
    double v6 = +[PXApplicationState sharedState];
    uint64_t v7 = [v6 visibilityState];

    if (v7 == 3)
    {
      if ([(PXDisplayScreenDynamicRangeMonitor *)self isMonitoring])
      {
        [(PXDisplayScreenDynamicRangeMonitor *)self _teardownTimer];
      }
    }
    else if (v7 == 1 && [(PXDisplayScreenDynamicRangeMonitor *)self isMonitoring])
    {
      [(PXDisplayScreenDynamicRangeMonitor *)self _resumeTimer];
    }
  }
}

- (void)stopMonitoring
{
  [(PXDisplayScreenDynamicRangeMonitor *)self _teardownTimer];
  id screenProvider = self->_screenProvider;
  self->_id screenProvider = 0;

  self->_isMonitoring = 0;
}

- (void)startMonitoringWithScreenProvider:(id)a3
{
  id v6 = a3;
  if (![(PXDisplayScreenDynamicRangeMonitor *)self isMonitoring])
  {
    self->_isMonitoring = 1;
    double v4 = (void *)[v6 copy];
    id screenProvider = self->_screenProvider;
    self->_id screenProvider = v4;

    [(PXDisplayScreenDynamicRangeMonitor *)self _updateScreenSupportHDR];
    [(PXDisplayScreenDynamicRangeMonitor *)self _resumeTimer];
  }
}

- (PXDisplayScreenDynamicRangeMonitor)initWithAutomaticApplicationStateTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayScreenDynamicRangeMonitor;
  double v4 = [(PXDisplayScreenDynamicRangeMonitor *)&v8 init];
  if (v4) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = +[PXApplicationState sharedState];
    [v6 registerChangeObserver:v4 context:ApplicationStateContext_139527];
  }
  return v4;
}

- (PXDisplayScreenDynamicRangeMonitor)init
{
  return [(PXDisplayScreenDynamicRangeMonitor *)self initWithAutomaticApplicationStateTracking:0];
}

@end