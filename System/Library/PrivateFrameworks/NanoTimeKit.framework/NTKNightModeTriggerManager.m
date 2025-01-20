@interface NTKNightModeTriggerManager
- (BOOL)_isReady;
- (BOOL)isNightModeDetectionEnabled;
- (BOOL)isNightModeTriggered;
- (NSString)faceAnalyticsIdentifier;
- (NTKNightModeTriggerManager)initWithFaceAnalyticsIdentifier:(id)a3;
- (double)_alsLatency;
- (double)_smoothedLux;
- (double)_smoothedNits;
- (double)currentFaceAPL;
- (double)thresholdLuxHigh;
- (double)thresholdLuxLow;
- (double)thresholdOffset;
- (void)_notifyObservers;
- (void)_setNightModeTriggered:(BOOL)a3;
- (void)_startClockTimer;
- (void)_stopClockTimer;
- (void)_updateAverageWithCurrentLux;
- (void)_updateAverageWithCurrentNits;
- (void)_updateAverageWithLux:(double)a3;
- (void)_updateAverageWithNits:(double)a3;
- (void)_updateTriggerState;
- (void)addObserver:(id)a3;
- (void)ambientIlluminationMonitor:(id)a3 receivedAmbientLux:(double)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)sampleSizeChanged:(id)a3;
- (void)setCurrentFaceAPL:(double)a3;
- (void)setNightModeDetectionEnabled:(BOOL)a3;
- (void)setThresholdLuxHigh:(double)a3;
- (void)setThresholdLuxLow:(double)a3;
- (void)setThresholdOffset:(double)a3;
- (void)thresholdsChanged:(id)a3;
@end

@implementation NTKNightModeTriggerManager

- (NTKNightModeTriggerManager)initWithFaceAnalyticsIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKNightModeTriggerManager;
  v6 = [(NTKNightModeTriggerManager *)&v22 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v6;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager init", buf, 0xCu);
    }

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel_thresholdsChanged_ name:@"com.apple.NanoTimeKit.NightModeThresholdsChanged" object:0];
    [v10 addObserver:v6 selector:sel_sampleSizeChanged_ name:@"com.apple.NanoTimeKit.NightModeSampleSize" object:0];
    uint64_t v11 = objc_opt_new();
    settings = v6->_settings;
    v6->_settings = (NTKNightModeTriggerSettings *)v11;

    [(NTKNightModeTriggerSettings *)v6->_settings thresholdLuxLow];
    v6->_thresholdLuxLow = v13;
    [(NTKNightModeTriggerSettings *)v6->_settings thresholdLuxHigh];
    v6->_thresholdLuxHigh = v14;
    v15 = [MEMORY[0x1E4F19A30] currentDevice];
    v6->_isN199 = [v15 productType] == 41;

    objc_storeStrong((id *)&v6->_faceAnalyticsIdentifier, a3);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v6->_activeTime = _Q0;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager teardown", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)NTKNightModeTriggerManager;
  [(NTKNightModeTriggerManager *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(id)objc_opt_class() description];
    int v7 = 134218242;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode observer attaching %@", (uint8_t *)&v7, 0x16u);
  }
  [(NSHashTable *)self->_observers addObject:v4];
  [v4 nightModeTriggerManager:self didUpdateNightModeTriggeredState:self->_nightModeTriggered];
}

- (void)removeObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(id)objc_opt_class() description];
    int v7 = 134218242;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode observer detaching %@", (uint8_t *)&v7, 0x16u);
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)setNightModeDetectionEnabled:(BOOL)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_nightModeDetectionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_nightModeDetectionEnabled = a3;
    objc_super v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134218240;
      uint64_t v25 = self;
      __int16 v26 = 1024;
      LODWORD(v27) = v3;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode detection-enabled changing to %d", (uint8_t *)&v24, 0x12u);
    }

    if (self->_nightModeDetectionEnabled)
    {
      v6 = (NTKAmbientIlluminationMonitor *)objc_opt_new();
      ambientIlluminationMonitor = self->_ambientIlluminationMonitor;
      self->_ambientIlluminationMonitor = v6;

      [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor setDelegate:self];
      uint64_t v8 = [[NTKMovingMedian alloc] initWithSampleSize:[(NTKNightModeTriggerSettings *)self->_settings sampleSize]];
      luxStatistic = self->_luxStatistic;
      self->_luxStatistic = (NTKMovingStatistic *)v8;

      v10 = [[NTKMovingMedian alloc] initWithSampleSize:[(NTKNightModeTriggerSettings *)self->_settings sampleSize]];
      nitsStatistic = self->_nitsStatistic;
      self->_nitsStatistic = (NTKMovingStatistic *)v10;

      [(NTKNightModeTriggerManager *)self _updateAverageWithCurrentLux];
      [(NTKNightModeTriggerManager *)self _updateAverageWithCurrentNits];
      [(NTKNightModeTriggerManager *)self _startClockTimer];
      [(NTKNightModeTriggerManager *)self _notifyObservers];
      self->_activeTime = CFAbsoluteTimeGetCurrent();
      self->_sensorReadingsTime = -1.0;
      v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = self->_ambientIlluminationMonitor;
        int v24 = 134218240;
        uint64_t v25 = self;
        __int16 v26 = 2048;
        v27 = v13;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode created illumination monitor %p", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      double v14 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_ambientIlluminationMonitor;
        int v24 = 134218240;
        uint64_t v25 = self;
        __int16 v26 = 2048;
        v27 = v15;
        _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode deleting illumination monitor %p", (uint8_t *)&v24, 0x16u);
      }

      [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor setDelegate:0];
      v16 = self->_ambientIlluminationMonitor;
      self->_ambientIlluminationMonitor = 0;

      v17 = self->_luxStatistic;
      self->_luxStatistic = 0;

      v18 = self->_nitsStatistic;
      self->_nitsStatistic = 0;

      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)&self->_activeTime = _Q0;
      [(NTKNightModeTriggerManager *)self _stopClockTimer];
    }
  }
}

- (void)_setNightModeTriggered:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_nightModeTriggered != a3)
  {
    BOOL v3 = a3;
    self->_nightModeTriggered = a3;
    objc_super v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode night-mode-triggered changing to %d", (uint8_t *)&v6, 0x12u);
    }

    [(NTKNightModeTriggerManager *)self _notifyObservers];
  }
}

- (void)_notifyObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "nightModeTriggerManager:didUpdateNightModeTriggeredState:", self, self->_nightModeTriggered, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setThresholdLuxLow:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_thresholdLuxLow = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold low set to %f", (uint8_t *)&v6, 0x16u);
  }

  [(NTKNightModeTriggerManager *)self _updateTriggerState];
}

- (void)setThresholdLuxHigh:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_thresholdLuxHigh = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold high set to %f", (uint8_t *)&v6, 0x16u);
  }

  [(NTKNightModeTriggerManager *)self _updateTriggerState];
}

- (void)setThresholdOffset:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_thresholdOffset = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold offset set to %f", (uint8_t *)&v6, 0x16u);
  }

  [(NTKNightModeTriggerManager *)self _updateTriggerState];
}

- (void)ambientIlluminationMonitor:(id)a3 receivedAmbientLux:(double)a4
{
  if (![(NTKMovingStatistic *)self->_luxStatistic sampleCount]) {
    self->_sensorReadingsTime = CFAbsoluteTimeGetCurrent();
  }
  [(NTKNightModeTriggerManager *)self _updateAverageWithLux:a4];
}

- (void)_startClockTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    BOOL v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v11 = self;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager start clock timer", buf, 0xCu);
    }

    uint64_t v4 = [MEMORY[0x1E4F196B0] sharedInstance];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__NTKNightModeTriggerManager__startClockTimer__block_invoke;
    v7[3] = &unk_1E62C1288;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [v4 startUpdatesWithUpdateFrequency:2 withHandler:v7 identificationLog:&__block_literal_global_70];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __46__NTKNightModeTriggerManager__startClockTimer__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    ++_startClockTimer__cycle;
    if (0xAAAAAAAAAAAAAAABLL * _startClockTimer__cycle <= 0x5555555555555555) {
      [WeakRetained _updateAverageWithCurrentLux];
    }
    [v6 _updateAverageWithCurrentNits];
  }
}

__CFString *__46__NTKNightModeTriggerManager__startClockTimer__block_invoke_14()
{
  return @"night mode trigger manager";
}

- (void)_stopClockTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_clockTimerToken)
  {
    BOOL v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      id v7 = self;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager stop clock timer", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v4 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v4 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_updateAverageWithLux:(double)a3
{
  [(NTKMovingStatistic *)self->_luxStatistic addNewValue:a3];
  [(NTKNightModeTriggerManager *)self _updateTriggerState];
}

- (void)_updateAverageWithCurrentLux
{
  [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor ambientLux];
  if (v3 >= 0.0)
  {
    [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor ambientLux];
    -[NTKNightModeTriggerManager _updateAverageWithLux:](self, "_updateAverageWithLux:");
  }
}

- (void)_updateAverageWithNits:(double)a3
{
  [(NTKMovingStatistic *)self->_nitsStatistic addNewValue:a3];
  [(NTKNightModeTriggerManager *)self _updateTriggerState];
}

- (void)_updateAverageWithCurrentNits
{
  [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor displayNits];
  if (v3 >= 0.0)
  {
    -[NTKNightModeTriggerManager _updateAverageWithNits:](self, "_updateAverageWithNits:");
  }
}

- (double)_smoothedLux
{
  [(NTKMovingStatistic *)self->_luxStatistic currentValue];
  return result;
}

- (double)_smoothedNits
{
  [(NTKMovingStatistic *)self->_nitsStatistic currentValue];
  return result;
}

- (double)_alsLatency
{
  double activeTime = self->_activeTime;
  double result = -1.0;
  if (activeTime != -1.0)
  {
    double sensorReadingsTime = self->_sensorReadingsTime;
    if (sensorReadingsTime != -1.0) {
      return sensorReadingsTime - activeTime;
    }
  }
  return result;
}

- (BOOL)_isReady
{
  unint64_t v3 = [(NTKMovingStatistic *)self->_luxStatistic sampleCount];
  return v3 >= [(NTKNightModeTriggerSettings *)self->_settings activateSampleCount];
}

- (void)_updateTriggerState
{
  v116[6] = *MEMORY[0x1E4F143B8];
  if ([(NTKNightModeTriggerManager *)self isNightModeDetectionEnabled])
  {
    uint64_t v3 = [(NTKNightModeTriggerManager *)self isNightModeTriggered];
    unsigned int v4 = [(NTKNightModeTriggerManager *)self _isReady];
    [(NTKNightModeTriggerManager *)self _smoothedLux];
    double v6 = v5;
    [(NTKNightModeTriggerManager *)self thresholdOffset];
    double v8 = v7;
    [(NTKNightModeTriggerManager *)self thresholdLuxLow];
    double v10 = v8 + v9;
    [(NTKNightModeTriggerManager *)self thresholdLuxHigh];
    double v12 = v8 + v11;
    [(NTKNightModeTriggerManager *)self _smoothedNits];
    double v14 = v13;
    [(NTKNightModeTriggerManager *)self currentFaceAPL];
    if (v15 >= 0.1)
    {
      [(NTKNightModeTriggerManager *)self currentFaceAPL];
      if (v18 >= 0.25)
      {
        double v17 = 5.0;
        if (!self->_isN199) {
          double v17 = 1.0;
        }
        double v16 = 8.0;
        if (!self->_isN199) {
          double v16 = 17.0;
        }
      }
      else
      {
        double v17 = 5.0;
        if (!self->_isN199) {
          double v17 = 0.0;
        }
        double v16 = 80.0;
        if (self->_isN199) {
          double v16 = 7.0;
        }
      }
    }
    else
    {
      double v16 = 100.0;
      double v17 = 0.0;
    }
    double v80 = v14;
    double v19 = fmax(v17 + v14 / v16, 0.0);
    double v20 = v10 + v19;
    double v21 = v12 - v10 + v10 + v19;
    if (v21 < v12 + v19 / 3.0) {
      double v21 = v12 + v19 / 3.0;
    }
    double v78 = v21;
    double v79 = v19;
    if (v3) {
      uint64_t v22 = v6 <= v21;
    }
    else {
      uint64_t v22 = v6 < v20;
    }
    [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor ambientLux];
    double v24 = v23;
    [(NTKAmbientIlluminationMonitor *)self->_ambientIlluminationMonitor displayNits];
    double v26 = v25;
    unint64_t v27 = [(NTKMovingStatistic *)self->_luxStatistic sampleSize];
    uint64_t v28 = [(NTKMovingStatistic *)self->_luxStatistic sampleCount];
    double lastSensorLux = self->_lastSensorLux;
    double v30 = fabs(lastSensorLux);
    double v31 = fabs(v24);
    BOOL v32 = v31 < 0.00000011920929;
    if (v30 >= 0.00000011920929) {
      BOOL v32 = 0;
    }
    if (v31 >= 0.00000011920929 && v30 >= 0.00000011920929)
    {
      BOOL v32 = v24 == -1.0;
      if (lastSensorLux != -1.0) {
        BOOL v32 = 0;
      }
      if (v24 != -1.0 && lastSensorLux != -1.0)
      {
        double v33 = lastSensorLux / v24 + -1.0;
        if (v33 < 0.0) {
          double v33 = -v33;
        }
        BOOL v32 = v33 < 0.05;
      }
    }
    int lastIsTriggered = self->_lastIsTriggered;
    double lastCurrentNits = self->_lastCurrentNits;
    double v36 = fabs(lastCurrentNits);
    double v37 = fabs(v26);
    BOOL v38 = v37 < 0.00000011920929;
    if (v36 >= 0.00000011920929) {
      BOOL v38 = 0;
    }
    if (v37 >= 0.00000011920929 && v36 >= 0.00000011920929)
    {
      BOOL v38 = v26 == -1.0;
      if (lastCurrentNits != -1.0) {
        BOOL v38 = 0;
      }
      if (v26 != -1.0 && lastCurrentNits != -1.0)
      {
        double v39 = lastCurrentNits / v26 + -1.0;
        if (v39 < 0.0) {
          double v39 = -v39;
        }
        BOOL v38 = v39 < 0.1;
      }
    }
    double lastThresholdOffset = self->_lastThresholdOffset;
    double lastThresholdLow = self->_lastThresholdLow;
    double lastThresholdHigh = self->_lastThresholdHigh;
    int lastTargetTrigger = self->_lastTargetTrigger;
    unint64_t lastSampleSize = self->_lastSampleSize;
    unint64_t lastIsReady = self->_lastIsReady;
    if (lastIsTriggered == v3
      && lastIsReady == v4
      && lastThresholdOffset == v8
      && lastThresholdLow == v10
      && lastThresholdHigh == v12
      && lastTargetTrigger == v22
      && v32
      && v38
      && lastSampleSize == v27)
    {
      ++self->_skippedLogs;
    }
    else
    {
      uint64_t v74 = v28;
      unint64_t v76 = v4;
      if (lastIsTriggered == v3) {
        v46 = &stru_1F1635E90;
      }
      else {
        v46 = @"IsTr";
      }
      if (lastIsReady == v4) {
        v47 = &stru_1F1635E90;
      }
      else {
        v47 = @"Redy";
      }
      v48 = @"Offs";
      if (lastThresholdOffset == v8) {
        v48 = &stru_1F1635E90;
      }
      v49 = @"TLow";
      if (lastThresholdLow == v10) {
        v49 = &stru_1F1635E90;
      }
      v50 = @"THgh";
      if (lastThresholdHigh == v12) {
        v50 = &stru_1F1635E90;
      }
      if (lastTargetTrigger == v22) {
        v51 = &stru_1F1635E90;
      }
      else {
        v51 = @"Trig";
      }
      if (v32) {
        v52 = &stru_1F1635E90;
      }
      else {
        v52 = @"SLux";
      }
      if (v38) {
        v53 = &stru_1F1635E90;
      }
      else {
        v53 = @"Nits";
      }
      if (lastSampleSize == v27) {
        v54 = &stru_1F1635E90;
      }
      else {
        v54 = @"SSiz";
      }
      v77 = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", v46, v47, v48, v49, v50, v51, v52, v53, v54];
      v116[0] = self->_faceAnalyticsIdentifier;
      v115[0] = @"faceIdentifier";
      v115[1] = @"faceAPL";
      v55 = NSNumber;
      [(NTKNightModeTriggerManager *)self currentFaceAPL];
      v56 = objc_msgSend(v55, "numberWithDouble:");
      v116[1] = v56;
      v115[2] = @"ALSLatency";
      v57 = NSNumber;
      [(NTKNightModeTriggerManager *)self _alsLatency];
      v58 = objc_msgSend(v57, "numberWithDouble:");
      v116[2] = v58;
      v115[3] = @"triggerThreshold";
      v59 = [NSNumber numberWithDouble:v20];
      v116[3] = v59;
      v115[4] = @"smoothedALS";
      v60 = [NSNumber numberWithDouble:v6];
      v116[4] = v60;
      v115[5] = @"triggered";
      v61 = [NSNumber numberWithBool:v3];
      v116[5] = v61;
      v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:6];
      AnalyticsSendEvent();

      v63 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v72 = [NSNumber numberWithBool:v3];
        v64 = [NSNumber numberWithBool:v22];
        [NSNumber numberWithUnsignedInteger:v74];
        v65 = unsigned int v75 = v22;
        v66 = [NSNumber numberWithUnsignedInteger:v27];
        v67 = [NSNumber numberWithDouble:v24];
        [NSNumber numberWithDouble:v6];
        uint64_t v3 = v73 = v3;
        v68 = [NSNumber numberWithDouble:v10];
        v69 = [NSNumber numberWithDouble:v12];
        [(NTKNightModeTriggerManager *)self currentFaceAPL];
        unint64_t skippedLogs = self->_skippedLogs;
        *(_DWORD *)buf = 134222082;
        v82 = self;
        __int16 v83 = 2112;
        v84 = v72;
        __int16 v85 = 2112;
        v86 = v64;
        __int16 v87 = 2112;
        v88 = v65;
        __int16 v89 = 2112;
        v90 = v66;
        __int16 v91 = 2112;
        v92 = v67;
        __int16 v93 = 2112;
        uint64_t v94 = v3;
        __int16 v95 = 2112;
        v96 = v68;
        __int16 v97 = 2048;
        double v98 = v20;
        __int16 v99 = 2112;
        v100 = v69;
        __int16 v101 = 2048;
        double v102 = v78;
        __int16 v103 = 2048;
        double v104 = v79;
        __int16 v105 = 2048;
        uint64_t v106 = v71;
        __int16 v107 = 2048;
        double v108 = v26;
        __int16 v109 = 2048;
        double v110 = v80;
        __int16 v111 = 2048;
        unint64_t v112 = skippedLogs;
        __int16 v113 = 2112;
        v114 = v77;
        _os_log_impl(&dword_1BC5A9000, v63, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode updateTriggerState currentlyTriggered:%@ shouldTrigger:%@ samples:%@ of %@ (lux--sensorLux:%@ smoothedLux:%@ threshLow:%@ calib:%0.0f threshHigh:%@ calib:%0.0f calibration:%0.0f apl:%0.2f) (nits--currentNits:%0.3f smoothedNits:%0.3f) [skipped %lu]  %@", buf, 0xACu);

        LOBYTE(v3) = v73;
        uint64_t v22 = v75;
      }
      if ([(NTKNightModeTriggerManager *)self _isReady]) {
        [(NTKNightModeTriggerManager *)self _setNightModeTriggered:v22];
      }
      self->_int lastIsTriggered = v3;
      self->_lastSmoothedLux = v6;
      self->_double lastThresholdOffset = v8;
      self->_double lastThresholdLow = v10;
      self->_double lastThresholdHigh = v12;
      self->_lastSmoothedNits = v80;
      self->_int lastTargetTrigger = v22;
      self->_double lastSensorLux = v24;
      self->_double lastCurrentNits = v26;
      self->_unint64_t lastSampleSize = v27;
      self->_unint64_t lastIsReady = v76;
      self->_unint64_t skippedLogs = 0;
    }
  }
}

- (void)thresholdsChanged:(id)a3
{
  [(NTKNightModeTriggerSettings *)self->_settings thresholdLuxLow];
  -[NTKNightModeTriggerManager setThresholdLuxLow:](self, "setThresholdLuxLow:");
  [(NTKNightModeTriggerSettings *)self->_settings thresholdLuxHigh];
  -[NTKNightModeTriggerManager setThresholdLuxHigh:](self, "setThresholdLuxHigh:");
}

- (void)sampleSizeChanged:(id)a3
{
  luxStatistic = self->_luxStatistic;
  unint64_t v4 = [(NTKNightModeTriggerSettings *)self->_settings sampleSize];
  [(NTKMovingStatistic *)luxStatistic setSampleSize:v4];
}

- (BOOL)isNightModeDetectionEnabled
{
  return self->_nightModeDetectionEnabled;
}

- (BOOL)isNightModeTriggered
{
  return self->_nightModeTriggered;
}

- (double)currentFaceAPL
{
  return self->_currentFaceAPL;
}

- (void)setCurrentFaceAPL:(double)a3
{
  self->_currentFaceAPL = a3;
}

- (double)thresholdOffset
{
  return self->_thresholdOffset;
}

- (NSString)faceAnalyticsIdentifier
{
  return self->_faceAnalyticsIdentifier;
}

- (double)thresholdLuxLow
{
  return self->_thresholdLuxLow;
}

- (double)thresholdLuxHigh
{
  return self->_thresholdLuxHigh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_nitsStatistic, 0);
  objc_storeStrong((id *)&self->_luxStatistic, 0);
  objc_storeStrong((id *)&self->_ambientIlluminationMonitor, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end