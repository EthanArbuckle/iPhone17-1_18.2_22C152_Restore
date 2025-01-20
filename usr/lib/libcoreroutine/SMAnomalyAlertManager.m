@interface SMAnomalyAlertManager
+ (unint64_t)carPlayNotificationTypeForAnomalyManagerAlertOrdinal:(int64_t)a3;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTXPCTimerAlarm)secondAlertAlarm;
- (RTXPCTimerAlarm)thirdAlertAlarm;
- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6;
- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6 toneDelay:(double)a7;
- (SMCarPlayAlertManager)carPlayAlertManager;
- (SMSessionManagerState)anomalyState;
- (TLAlert)tlAlert;
- (double)toneDelay;
- (id)_alarmForAlertOrdinal:(int64_t)a3;
- (id)_alarmIdentifierForAlertOrdinal:(int64_t)a3;
- (id)_scheduleAlertForAlertOrdinal:(int64_t)a3;
- (id)_targetAlertDateForAlertOrdinal:(int64_t)a3;
- (id)_tlAlertConfigurationForAlertOrdinal:(int64_t)a3;
- (void)_executeAlertForAlertOrdinal:(int64_t)a3;
- (void)_invalidateTimer:(id)a3;
- (void)_playTLAlertForAlertOrdinal:(int64_t)a3;
- (void)_resume;
- (void)_scheduleSecondAlert;
- (void)_scheduleThirdAlert;
- (void)_start;
- (void)_stop;
- (void)_stopTLAlert;
- (void)_updateActivityWithState:(id)a3;
- (void)resume;
- (void)setSecondAlertAlarm:(id)a3;
- (void)setThirdAlertAlarm:(id)a3;
- (void)setTlAlert:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SMAnomalyAlertManager

- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6
{
  return [(SMAnomalyAlertManager *)self initWithQueue:a3 anomalyState:a4 defaultsManager:a5 carPlayAlertManager:a6 toneDelay:0.7];
}

- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6 toneDelay:(double)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v12 = (OS_dispatch_queue *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13 && ([v13 isPromptState] & 1) != 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMAnomalyAlertManager;
    v16 = [(SMAnomalyAlertManager *)&v27 init];
    v17 = v16;
    if (v16)
    {
      v16->_queue = v12;
      uint64_t v18 = [v13 copy];
      anomalyState = v17->_anomalyState;
      v17->_anomalyState = (SMSessionManagerState *)v18;

      objc_storeStrong((id *)&v17->_defaultsManager, a5);
      v17->_toneDelay = a7;
      secondAlertAlarm = v17->_secondAlertAlarm;
      v17->_secondAlertAlarm = 0;

      thirdAlertAlarm = v17->_thirdAlertAlarm;
      v17->_thirdAlertAlarm = 0;

      objc_storeStrong((id *)&v17->_carPlayAlertManager, a6);
    }
    self = v17;
    v22 = self;
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138413058;
      v29 = v26;
      __int16 v30 = 2080;
      v31 = "-[SMAnomalyAlertManager initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:toneDelay:]";
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 2048;
      double v35 = a7;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %s, init invalid param, anomalyState, %@, toneDelay, %f", buf, 0x2Au);
    }
    v22 = 0;
  }

  return v22;
}

- (void)start
{
  v3 = [(SMAnomalyAlertManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SMAnomalyAlertManager_start__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__SMAnomalyAlertManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  [(SMAnomalyAlertManager *)self _executeAlertForAlertOrdinal:1];
  [(SMAnomalyAlertManager *)self _scheduleSecondAlert];

  [(SMAnomalyAlertManager *)self _scheduleThirdAlert];
}

- (void)resume
{
  v3 = [(SMAnomalyAlertManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SMAnomalyAlertManager_resume__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__SMAnomalyAlertManager_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resume];
}

- (void)_resume
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(SMAnomalyAlertManager *)self _targetAlertDateForAlertOrdinal:2];
  v4 = [(SMAnomalyAlertManager *)self _targetAlertDateForAlertOrdinal:3];
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v3 stringFromDate];
    v9 = [v4 stringFromDate];
    int v16 = 138413058;
    v17 = v7;
    __int16 v18 = 2080;
    v19 = "-[SMAnomalyAlertManager _resume]";
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@, %s, resume, second alarm target, %@, third alarm target, %@", (uint8_t *)&v16, 0x2Au);
  }
  v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:v3];
  double v12 = v11;

  if (v12 < 10.0) {
    [(SMAnomalyAlertManager *)self _scheduleSecondAlert];
  }
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSinceDate:v4];
  double v15 = v14;

  if (v15 < 10.0) {
    [(SMAnomalyAlertManager *)self _scheduleThirdAlert];
  }
}

- (void)stop
{
  v3 = [(SMAnomalyAlertManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SMAnomalyAlertManager_stop__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__SMAnomalyAlertManager_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)_stop
{
  [(SMAnomalyAlertManager *)self _stopTLAlert];
  v3 = [(SMAnomalyAlertManager *)self secondAlertAlarm];
  [(SMAnomalyAlertManager *)self _invalidateTimer:v3];

  v4 = [(SMAnomalyAlertManager *)self thirdAlertAlarm];
  [(SMAnomalyAlertManager *)self _invalidateTimer:v4];

  [(SMAnomalyAlertManager *)self setSecondAlertAlarm:0];

  [(SMAnomalyAlertManager *)self setThirdAlertAlarm:0];
}

- (void)_scheduleSecondAlert
{
  v3 = [(SMAnomalyAlertManager *)self secondAlertAlarm];
  [(SMAnomalyAlertManager *)self _invalidateTimer:v3];

  id v4 = [(SMAnomalyAlertManager *)self _scheduleAlertForAlertOrdinal:2];
  [(SMAnomalyAlertManager *)self setSecondAlertAlarm:v4];
}

- (void)_scheduleThirdAlert
{
  v3 = [(SMAnomalyAlertManager *)self thirdAlertAlarm];
  [(SMAnomalyAlertManager *)self _invalidateTimer:v3];

  id v4 = [(SMAnomalyAlertManager *)self _scheduleAlertForAlertOrdinal:3];
  [(SMAnomalyAlertManager *)self setThirdAlertAlarm:v4];
}

- (id)_scheduleAlertForAlertOrdinal:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = -[SMAnomalyAlertManager _targetAlertDateForAlertOrdinal:](self, "_targetAlertDateForAlertOrdinal:");
  v6 = [(SMAnomalyAlertManager *)self _alarmIdentifierForAlertOrdinal:a3];
  v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v5 stringFromDate];
    *(_DWORD *)buf = 138413314;
    id v35 = v9;
    __int16 v36 = 2080;
    v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
    __int16 v38 = 2048;
    int64_t v39 = a3;
    __int16 v40 = 2112;
    v41 = v10;
    __int16 v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%@, %s, ordinal, %lu, fireDate, %@, alarmIdentifier, %@", buf, 0x34u);
  }
  if (v5 && v6)
  {
    objc_initWeak(&location, self);
    double v11 = [RTXPCTimerAlarm alloc];
    double v12 = [(SMAnomalyAlertManager *)self queue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__SMAnomalyAlertManager__scheduleAlertForAlertOrdinal___block_invoke;
    v31[3] = &unk_1E6B99510;
    objc_copyWeak(v32, &location);
    v32[1] = (id)a3;
    v31[4] = self;
    id v13 = [(RTXPCTimerAlarm *)v11 initWithIdentifier:v6 queue:v12 handler:v31];

    id v30 = 0;
    [(RTXPCTimerAlarm *)v13 fireWithDate:v5 error:&v30];
    id v14 = v30;
    double v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v18 = [(RTXPCTimerAlarm *)v13 identifier];
      v19 = [v5 stringFromDate];
      *(_DWORD *)buf = 138413058;
      id v35 = v17;
      __int16 v36 = 2080;
      v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
      __int16 v38 = 2112;
      int64_t v39 = (int64_t)v18;
      __int16 v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@, %s, %@, timer set with end date, %@", buf, 0x2Au);
    }
    if (v14)
    {
      __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = [(RTXPCTimerAlarm *)v13 identifier];
        v29 = [v14 localizedDescription];
        *(_DWORD *)buf = 138413058;
        id v35 = v27;
        __int16 v36 = 2080;
        v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
        __int16 v38 = 2112;
        int64_t v39 = (int64_t)v28;
        __int16 v40 = 2112;
        v41 = v29;
        _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "%@, %s, %@, fireWithDate hit error: %@", buf, 0x2Au);
      }
      v21 = 0;
    }
    else
    {
      v21 = v13;
    }

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138412802;
      id v35 = v25;
      __int16 v36 = 2080;
      v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
      __int16 v38 = 2048;
      int64_t v39 = a3;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, %s, ordinal, %lu, invalid fireDate or alarmIdentifier", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

void __55__SMAnomalyAlertManager__scheduleAlertForAlertOrdinal___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained _alarmForAlertOrdinal:*(void *)(a1 + 48)];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v3 identifier];
    int v8 = 138412802;
    v9 = v6;
    __int16 v10 = 2080;
    double v11 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@, %s, %@, expired", (uint8_t *)&v8, 0x20u);
  }
  [WeakRetained _invalidateTimer:v3];
  [WeakRetained _executeAlertForAlertOrdinal:*(void *)(a1 + 48)];
}

- (void)_executeAlertForAlertOrdinal:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    __int16 v22 = 2080;
    v23 = "-[SMAnomalyAlertManager _executeAlertForAlertOrdinal:]";
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@, %s, executing alert for ordinal, %lu", buf, 0x20u);
  }
  int v8 = [(SMAnomalyAlertManager *)self anomalyState];
  [(SMAnomalyAlertManager *)self _updateActivityWithState:v8];

  uint64_t v9 = [(id)objc_opt_class() carPlayNotificationTypeForAnomalyManagerAlertOrdinal:a3];
  __int16 v10 = [(SMAnomalyAlertManager *)self anomalyState];
  double v11 = [v10 configuration];
  if ([v11 sessionType] == 1)
  {
    __int16 v12 = [(SMAnomalyAlertManager *)self anomalyState];
    int v13 = [v12 isTimerExtensionValid:*MEMORY[0x1E4F99B68]];

    if (!v13) {
      uint64_t v9 = 4;
    }
  }
  else
  {
  }
  uint64_t v14 = [(SMAnomalyAlertManager *)self carPlayAlertManager];
  double v15 = [(SMAnomalyAlertManager *)self anomalyState];
  [v14 postCarPlayNotificationForNotificationType:v9 sessionManagerState:v15 handler:0];

  if ([MEMORY[0x1E4F99808] hasActivity])
  {
    [(SMAnomalyAlertManager *)self toneDelay];
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    __int16 v18 = [(SMAnomalyAlertManager *)self queue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__SMAnomalyAlertManager__executeAlertForAlertOrdinal___block_invoke;
    v19[3] = &unk_1E6B91248;
    v19[4] = self;
    v19[5] = a3;
    dispatch_after(v17, v18, v19);
  }
}

uint64_t __54__SMAnomalyAlertManager__executeAlertForAlertOrdinal___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playTLAlertForAlertOrdinal:*(void *)(a1 + 40)];
}

- (void)_updateActivityWithState:(id)a3
{
  id v4 = a3;
  v5 = [(SMAnomalyAlertManager *)self defaultsManager];
  v6 = [v5 objectForKey:@"RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"];
  uint64_t v7 = [v6 BOOLValue];

  int v8 = [(SMAnomalyAlertManager *)self defaultsManager];
  uint64_t v9 = [v8 objectForKey:@"RTDefaultsSessionManagerSeparatedLowPowerModeKey"];
  uint64_t v10 = [v9 BOOLValue];

  id v11 = (id)[objc_alloc(MEMORY[0x1E4F998C0]) initWithUnsupportedDeviceSeparationState:v7 userDisabledConnectivity:0 separatedLPMConnectivityWarningState:v10];
  [MEMORY[0x1E4F99808] updateActivityWithState:v4 localState:v11 shouldNotify:1];
}

- (void)_playTLAlertForAlertOrdinal:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SMAnomalyAlertManager *)self _stopTLAlert];
  v5 = [(SMAnomalyAlertManager *)self _tlAlertConfigurationForAlertOrdinal:a3];
  v6 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v5];
  [(SMAnomalyAlertManager *)self setTlAlert:v6];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SMAnomalyAlertManager _playTLAlertForAlertOrdinal:]";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%s,playing alertConfiguration,%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  int v8 = [(SMAnomalyAlertManager *)self tlAlert];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SMAnomalyAlertManager__playTLAlertForAlertOrdinal___block_invoke;
  v9[3] = &unk_1E6B9A6F8;
  objc_copyWeak(&v10, (id *)buf);
  [v8 playWithCompletionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__SMAnomalyAlertManager__playTLAlertForAlertOrdinal___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromTLAlertPlaybackCompletionType();
    int v10 = 138413058;
    id v11 = v8;
    __int16 v12 = 2080;
    __int16 v13 = "-[SMAnomalyAlertManager _playTLAlertForAlertOrdinal:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@, %s, play completion called, playbackCompletionType, %@, error, %@", (uint8_t *)&v10, 0x2Au);
  }
  [WeakRetained setTlAlert:0];
}

- (void)_stopTLAlert
{
  v3 = [(SMAnomalyAlertManager *)self tlAlert];

  if (v3)
  {
    id v4 = [(SMAnomalyAlertManager *)self tlAlert];
    [v4 stop];

    [(SMAnomalyAlertManager *)self setTlAlert:0];
  }
}

- (id)_tlAlertConfigurationForAlertOrdinal:(int64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:18];
  uint64_t v6 = 0;
  id v7 = 0;
  int v8 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level1_urgent_ML.plist";
  uint64_t v9 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level1_urgent_ML.wav";
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      goto LABEL_4;
    case 2:
      uint64_t v6 = 1;
      int v8 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level2_urgent_ML.plist";
      uint64_t v9 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level2_urgent_ML.wav";
      goto LABEL_4;
    case 3:
      uint64_t v6 = 1;
      int v8 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.plist";
      uint64_t v9 = @"file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.wav";
LABEL_4:
      int v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      [v5 setExternalToneFileURL:v10];

      id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      [v5 setExternalVibrationPatternFileURL:v11];

      [v5 setShouldIgnoreRingerSwitch:v6];
      break;
    default:
      break;
  }
  __int16 v12 = [(SMAnomalyAlertManager *)self defaultsManager];
  __int16 v13 = [v12 objectForKey:@"RTDefaultsSessionManagerShouldIgnoreRingerSwitchKey"];

  if (v13) {
    [v5 setShouldIgnoreRingerSwitch:[v13 BOOLValue]];
  }
  id v7 = v5;

LABEL_8:

  return v7;
}

- (void)_invalidateTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = [v3 identifier];
      int v6 = 136315394;
      id v7 = "-[SMAnomalyAlertManager _invalidateTimer:]";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, invalidating timer with identifier, %@", (uint8_t *)&v6, 0x16u);
    }
    [v3 invalidate];
  }
}

- (id)_alarmForAlertOrdinal:(int64_t)a3
{
  if (a3 == 3)
  {
    id v3 = [(SMAnomalyAlertManager *)self thirdAlertAlarm];
  }
  else if (a3 == 2)
  {
    id v3 = [(SMAnomalyAlertManager *)self secondAlertAlarm];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_alarmIdentifierForAlertOrdinal:(int64_t)a3
{
  id v3 = @"com.apple.routined.safetyMonitor.sessionManager.smAnomalyAlertManager.thirdAlarm";
  if (a3 != 3) {
    id v3 = 0;
  }
  if (a3 == 2) {
    return @"com.apple.routined.safetyMonitor.sessionManager.smAnomalyAlertManager.secondAlarm";
  }
  else {
    return v3;
  }
}

- (id)_targetAlertDateForAlertOrdinal:(int64_t)a3
{
  if ((unint64_t)a3 < 2)
  {
    v5 = [(SMAnomalyAlertManager *)self anomalyState];
    id v3 = [v5 sessionStateTransitionDate];
  }
  else
  {
    if (a3 == 3)
    {
      id v4 = (void *)MEMORY[0x1E4F1C9C8];
      v5 = [(SMAnomalyAlertManager *)self anomalyState];
      int v6 = [v5 sessionStateTransitionDate];
      double v7 = 600.0;
    }
    else
    {
      if (a3 != 2) {
        goto LABEL_9;
      }
      id v4 = (void *)MEMORY[0x1E4F1C9C8];
      v5 = [(SMAnomalyAlertManager *)self anomalyState];
      int v6 = [v5 sessionStateTransitionDate];
      double v7 = 300.0;
    }
    id v3 = [v4 dateWithTimeInterval:v6 sinceDate:v7];
  }
LABEL_9:

  return v3;
}

+ (unint64_t)carPlayNotificationTypeForAnomalyManagerAlertOrdinal:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 2;
  }
  else {
    return qword_1DA0FFEC8[a3];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SMSessionManagerState)anomalyState
{
  return self->_anomalyState;
}

- (RTXPCTimerAlarm)secondAlertAlarm
{
  return self->_secondAlertAlarm;
}

- (void)setSecondAlertAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)thirdAlertAlarm
{
  return self->_thirdAlertAlarm;
}

- (void)setThirdAlertAlarm:(id)a3
{
}

- (TLAlert)tlAlert
{
  return self->_tlAlert;
}

- (void)setTlAlert:(id)a3
{
}

- (double)toneDelay
{
  return self->_toneDelay;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (SMCarPlayAlertManager)carPlayAlertManager
{
  return self->_carPlayAlertManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayAlertManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_tlAlert, 0);
  objc_storeStrong((id *)&self->_thirdAlertAlarm, 0);
  objc_storeStrong((id *)&self->_secondAlertAlarm, 0);

  objc_storeStrong((id *)&self->_anomalyState, 0);
}

@end