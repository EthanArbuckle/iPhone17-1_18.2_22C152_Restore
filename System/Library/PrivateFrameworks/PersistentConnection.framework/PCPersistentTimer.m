@interface PCPersistentTimer
+ (double)_currentGuidanceTime;
+ (double)currentMachTimeInterval;
+ (id)_backgroundUpdateQueue;
+ (id)lastSystemWakeDate;
+ (void)_updateTime:(double)a3 forGuidancePriority:(unint64_t)a4;
- (BOOL)disableSystemWaking;
- (BOOL)firingIsImminent;
- (BOOL)isUserVisible;
- (BOOL)isValid;
- (NSString)debugDescription;
- (PCPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7;
- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8;
- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7;
- (double)_earlyFireTime;
- (double)_nextForcedAlignmentAbsoluteTime;
- (double)earlyFireConstantInterval;
- (double)fireTime;
- (double)minimumEarlyFireProportion;
- (double)startTime;
- (id)_initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 triggerOnGMTChange:(BOOL)a9;
- (id)userInfo;
- (void)_fireTimerFired;
- (void)_updateTimers;
- (void)cutPowerMonitorBatteryConnectedStateDidChange:(id)a3;
- (void)dealloc;
- (void)interfaceManagerInternetReachabilityChanged:(id)a3;
- (void)interfaceManagerWWANInterfaceChangedPowerState:(id)a3;
- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3;
- (void)invalidate;
- (void)scheduleInQueue:(id)a3;
- (void)scheduleInRunLoop:(id)a3;
- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4;
- (void)setDisableSystemWaking:(BOOL)a3;
- (void)setEarlyFireConstantInterval:(double)a3;
- (void)setMinimumEarlyFireProportion:(double)a3;
- (void)setUserVisible:(BOOL)a3;
@end

@implementation PCPersistentTimer

- (void)scheduleInRunLoop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_simpleTimer, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)dealloc
{
  [(PCPersistentTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PCPersistentTimer;
  [(PCPersistentTimer *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_target);

  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1D94354F0]();
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v2;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Invalidating timer %{public}@", (uint8_t *)&v10, 0xCu);
    }
    objc_storeWeak(&v2->_target, 0);
    v2->_selector = 0;
    queue = v2->_queue;
    v2->_queue = 0;

    [(PCSimpleTimer *)v2->_simpleTimer invalidate];
    simpleTimer = v2->_simpleTimer;
    v2->_simpleTimer = 0;

    v8 = +[PCPersistentInterfaceManager sharedInstance];
    [v8 removeDelegate:v2];

    v9 = [MEMORY[0x1E4F59E00] sharedInstance];
    [v9 removeDelegate:v2];
  }
  objc_sync_exit(v2);
}

- (void)setDisableSystemWaking:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_disableSystemWaking != v3)
  {
    obj->_disableSystemWaking = v3;
    [(PCSimpleTimer *)obj->_simpleTimer setDisableSystemWaking:v3];
    [(PCPersistentTimer *)obj _updateTimers];
  }
  objc_sync_exit(obj);
}

- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, v9, @"PCPersistentTimer.m", 173, @"%@ run loop mode cannot be nil", objc_opt_class() object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained(&v9->_target);

  if (!WeakRetained)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, v9, @"PCPersistentTimer.m", 174, @"Cannot schedule invalidated %@", objc_opt_class() object file lineNumber description];
  }
  simpleTimer = v9->_simpleTimer;
  if (!simpleTimer)
  {
    v9->_startTime = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = [[PCSimpleTimer alloc] initWithAbsoluteTime:v9->_serviceIdentifier serviceIdentifier:v9 target:sel__fireTimerFired selector:0 userInfo:v9->_triggerOnGMTChange triggerOnGMTChange:v9->_fireTime];
    v13 = v9->_simpleTimer;
    v9->_simpleTimer = v12;

    [(PCSimpleTimer *)v9->_simpleTimer setDisableSystemWaking:v9->_disableSystemWaking];
    [(PCSimpleTimer *)v9->_simpleTimer setUserVisible:v9->_userVisible];
    logObject = v9->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v9->_simpleTimer;
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@", buf, 0x16u);
    }
    simpleTimer = v9->_simpleTimer;
  }
  unint64_t guidancePriority = v9->_guidancePriority;
  double fireTime = v9->_fireTime;
  [(PCSimpleTimer *)simpleTimer scheduleInRunLoop:v7 inMode:v8];
  v18 = +[PCPersistentInterfaceManager sharedInstance];
  v19 = +[PCPersistentTimer _backgroundUpdateQueue];
  [v18 addDelegate:v9 queue:v19];

  v20 = [MEMORY[0x1E4F59E00] sharedInstance];
  [v20 addDelegate:v9];

  [(PCPersistentTimer *)v9 _updateTimers];
  objc_sync_exit(v9);

  if (guidancePriority != -1) {
    +[PCPersistentTimer _updateTime:guidancePriority forGuidancePriority:fireTime];
  }
}

- (void)setMinimumEarlyFireProportion:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  double v4 = 0.0;
  if (a3 >= 0.0) {
    double v4 = a3;
  }
  obj->_minimumEarlyFireProportion = fmin(v4, 1.0);
  [(PCPersistentTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)_updateTimers
{
  if (self->_simpleTimer)
  {
    [(PCPersistentTimer *)self _earlyFireTime];
    simpleTimer = self->_simpleTimer;
    BOOL triggerOnGMTChange = self->_triggerOnGMTChange;
    -[PCSimpleTimer updateFireTime:triggerOnGMTChange:](simpleTimer, "updateFireTime:triggerOnGMTChange:", triggerOnGMTChange);
  }
}

- (double)_earlyFireTime
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (self->_fireTime - self->_startTime >= 0.0) {
    double v3 = self->_fireTime - self->_startTime;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = +[PCPersistentInterfaceManager sharedInstance];
  int v5 = [v4 isPowerStateDetectionSupported];
  int v6 = [v4 isWWANInterfaceUp];
  int v7 = [v4 isInternetReachable];
  int v8 = v7;
  if (v5) {
    int v9 = v6 | v7 ^ 1;
  }
  else {
    int v9 = 0;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"NO";
    if (v9) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    *(_DWORD *)buf = 138544386;
    v65 = self;
    if (v5) {
      *(double *)&v13 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&v13 = COERCE_DOUBLE(@"NO");
    }
    v67 = v12;
    __int16 v68 = 2112;
    if (v6) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    __int16 v66 = 2114;
    double v69 = *(double *)&v13;
    if (v8) {
      v11 = @"YES";
    }
    __int16 v70 = 2114;
    v71 = v14;
    __int16 v72 = 2114;
    uint64_t v73 = (uint64_t)v11;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ calculating _earlyFireDate. powerStateDetectionSupported = %{public}@ = (detectionSupported(%@) && (wwanIsUp(%{public}@) || ! internetReachable(%{public}@)))", buf, 0x34u);
  }
  if (v9)
  {
    int v15 = [v4 isWWANInterfaceInProlongedHighPowerState];
    int v16 = [v4 isInCall];
    double v17 = 0.9;
    if (v15 && !v16)
    {
      double v17 = 0.54;
      goto LABEL_31;
    }
  }
  else
  {
    [v4 isInCall];
    int v15 = 0;
    double v17 = 0.62;
  }
  if (self->_minimumEarlyFireProportion < 1.0)
  {
    v18 = +[PCPersistentTimer lastSystemWakeDate];
    v19 = v18;
    if (v18)
    {
      [v18 timeIntervalSinceNow];
      if (v3 * 0.5 < -v20)
      {
        v21 = self->_logObject;
        double v17 = 1.0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          PCStringFromDate(v19);
          v23 = (PCPersistentTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v65 = v23;
          _os_log_impl(&dword_1D340D000, v22, OS_LOG_TYPE_DEFAULT, "Last system wake date (%{public}@) was longer than half of the timer duration, so setting minimum fire date to fire date.", buf, 0xCu);
        }
      }
    }
  }
LABEL_31:
  v24 = [MEMORY[0x1E4F59E00] sharedInstance];
  int v25 = [v24 isExternalPowerConnected];

  v26 = self->_logObject;
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    double v17 = 1.0;
    if (!v27) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 138543362;
    v65 = self;
    v28 = "%{public}@ Device is plugged in, overriding earlyFireProportion to be 1.0";
  }
  else
  {
    if (!v27) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 138543362;
    v65 = self;
    v28 = "%{public}@ device is not plugged in.";
  }
  _os_log_impl(&dword_1D340D000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
LABEL_37:
  [(PCPersistentTimer *)self _nextForcedAlignmentAbsoluteTime];
  double v30 = v29;
  double startTime = self->_startTime;
  double v32 = (v30 - startTime) / v3;
  double v33 = fabs(v32);
  if (v17 < v32 || v33 == INFINITY) {
    double v36 = v17;
  }
  else {
    double v36 = (v30 - startTime) / v3;
  }
  if (v36 >= self->_minimumEarlyFireProportion) {
    double minimumEarlyFireProportion = v36;
  }
  else {
    double minimumEarlyFireProportion = self->_minimumEarlyFireProportion;
  }
  double v38 = startTime + minimumEarlyFireProportion * v3;
  double earlyFireConstantInterval = self->_earlyFireConstantInterval;
  if (earlyFireConstantInterval > 0.0)
  {
    double v40 = startTime + earlyFireConstantInterval;
    if (v40 < v38) {
      double v38 = v40;
    }
    v41 = self->_logObject;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      double v42 = self->_earlyFireConstantInterval;
      *(_DWORD *)buf = 134217984;
      v65 = *(PCPersistentTimer **)&v42;
      _os_log_impl(&dword_1D340D000, v41, OS_LOG_TYPE_DEFAULT, "Ignore early fire proportion. {earlyFireConstantInterval: %f}", buf, 0xCu);
    }
  }
  if (v32 == minimumEarlyFireProportion)
  {
    v43 = self->_logObject;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)MEMORY[0x1E4F1C9C8];
      v45 = v43;
      v46 = [v44 dateWithTimeIntervalSinceReferenceDate:v30];
      PCStringFromDate(v46);
      v47 = (PCPersistentTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v47;
      _os_log_impl(&dword_1D340D000, v45, OS_LOG_TYPE_DEFAULT, "Forcing timer alignment to fire date [%{public}@]", buf, 0xCu);
    }
  }
  v48 = self->_logObject;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = (void *)MEMORY[0x1E4F1C9C8];
    v50 = v48;
    v51 = [v49 dateWithTimeIntervalSinceReferenceDate:v38];
    PCStringFromDate(v51);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v53 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_fireTime];
    PCStringFromDate(v53);
    v63 = v4;
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v55 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTime];
    uint64_t v56 = PCStringFromDate(v55);
    v57 = (void *)v56;
    double v58 = self->_minimumEarlyFireProportion;
    v59 = "no";
    if (v9) {
      v60 = "yes";
    }
    else {
      v60 = "no";
    }
    double v61 = self->_earlyFireConstantInterval;
    *(_DWORD *)buf = 138545410;
    v65 = self;
    if (v15) {
      v59 = "yes";
    }
    __int16 v66 = 2114;
    v67 = v52;
    __int16 v68 = 2048;
    double v69 = minimumEarlyFireProportion * 100.0;
    __int16 v70 = 2114;
    v71 = v54;
    __int16 v72 = 2114;
    uint64_t v73 = v56;
    __int16 v74 = 2048;
    double v75 = v58;
    __int16 v76 = 2082;
    v77 = v60;
    __int16 v78 = 2082;
    v79 = v59;
    __int16 v80 = 2048;
    double v81 = v61;
    _os_log_impl(&dword_1D340D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Calculated minimum fire date [%{public}@] (%g%%) with fire date [%{public}@], start date [%{public}@], minimum early fire proportion %g, power state detection supported: %{public}s, in high power state: %{public}s, early fire constant interval %f", buf, 0x5Cu);

    double v4 = v63;
  }

  return v38;
}

+ (id)lastSystemWakeDate
{
  return +[PCSimpleTimer lastSystemWakeDate];
}

- (double)_nextForcedAlignmentAbsoluteTime
{
  double v2 = (double)(+[PCPersistentIdentifiers hostUniqueIdentifier]% 0x5460);
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = fmod(Current - v2, 21600.0);
  double v5 = -0.0;
  if (v4 < 0.0) {
    double v5 = v2;
  }
  return Current + 21600.0 - (v4 + v5);
}

+ (id)_backgroundUpdateQueue
{
  if (_backgroundUpdateQueue_pred != -1) {
    dispatch_once(&_backgroundUpdateQueue_pred, &__block_literal_global_0);
  }
  double v2 = (void *)_backgroundUpdateQueue_sQueue;
  return v2;
}

- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  int v15 = [(PCPersistentTimer *)self _initWithAbsoluteTime:v14 serviceIdentifier:-1 guidancePriority:v13 target:a6 selector:v12 userInfo:1 triggerOnGMTChange:CFAbsoluteTimeGetCurrent() + a3];

  return v15;
}

- (id)_initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 triggerOnGMTChange:(BOOL)a9
{
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PCPersistentTimer;
  double v20 = [(PCPersistentTimer *)&v29 init];
  if (v20)
  {
    if (!v18 || !a7)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, v20, @"PCPersistentTimer.m", 104, @"%@ target and selector are required", objc_opt_class() object file lineNumber description];
    }
    id v21 = [NSString stringWithFormat:@"persistentTimer.%@", v17];
    uint64_t v22 = +[PCLog logWithCategory:](PCLog, "logWithCategory:", [v21 UTF8String]);
    logObject = v20->_logObject;
    v20->_logObject = (OS_os_log *)v22;

    v20->_double fireTime = a3;
    v20->_double minimumEarlyFireProportion = 0.0;
    v20->_double earlyFireConstantInterval = 0.0;
    uint64_t v24 = [v17 copy];
    serviceIdentifier = v20->_serviceIdentifier;
    v20->_serviceIdentifier = (NSString *)v24;

    objc_storeWeak(&v20->_target, v18);
    if (a7) {
      SEL v26 = a7;
    }
    else {
      SEL v26 = 0;
    }
    v20->_selector = v26;
    objc_storeStrong(&v20->_userInfo, a8);
    v20->_BOOL triggerOnGMTChange = a9;
    v20->_unint64_t guidancePriority = a5;
  }
  return v20;
}

+ (double)currentMachTimeInterval
{
  +[PCSimpleTimer currentMachTimeInterval];
  return result;
}

- (PCPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  [a3 timeIntervalSinceReferenceDate];
  int v15 = -[PCPersistentTimer _initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:](self, "_initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:", v14, -1, v13, a6, v12, 0);

  return v15;
}

- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = [(PCPersistentTimer *)self _initWithAbsoluteTime:v16 serviceIdentifier:a5 guidancePriority:v15 target:a7 selector:v14 userInfo:1 triggerOnGMTChange:CFAbsoluteTimeGetCurrent() + a3];

  return v17;
}

- (void)setEarlyFireConstantInterval:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_double earlyFireConstantInterval = a3;
  [(PCPersistentTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)setUserVisible:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_userVisible != v3)
  {
    obj->_userVisible = v3;
    [(PCSimpleTimer *)obj->_simpleTimer setUserVisible:v3];
    [(PCPersistentTimer *)obj _updateTimers];
  }
  objc_sync_exit(obj);
}

- (BOOL)isUserVisible
{
  double v2 = self;
  objc_sync_enter(v2);
  BOOL userVisible = v2->_userVisible;
  objc_sync_exit(v2);

  return userVisible;
}

- (void)scheduleInQueue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = self;
  objc_sync_enter(v7);
  id WeakRetained = objc_loadWeakRetained(&v7->_target);

  if (WeakRetained)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, v7, @"PCPersistentTimer.m", 207, @"Cannot schedule invalidated %@", objc_opt_class() object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  double v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, v7, @"PCPersistentTimer.m", 208, @"Cannot schedule on NULL queue %@", objc_opt_class() object file lineNumber description];

LABEL_3:
  objc_storeStrong((id *)&v7->_queue, a3);
  simpleTimer = v7->_simpleTimer;
  if (!simpleTimer)
  {
    v7->_double startTime = CFAbsoluteTimeGetCurrent();
    int v10 = [[PCSimpleTimer alloc] initWithAbsoluteTime:v7->_serviceIdentifier serviceIdentifier:v7 target:sel__fireTimerFired selector:0 userInfo:v7->_triggerOnGMTChange triggerOnGMTChange:v7->_fireTime];
    v11 = v7->_simpleTimer;
    v7->_simpleTimer = v10;

    [(PCSimpleTimer *)v7->_simpleTimer setDisableSystemWaking:v7->_disableSystemWaking];
    [(PCSimpleTimer *)v7->_simpleTimer setUserVisible:v7->_userVisible];
    logObject = v7->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v7->_simpleTimer;
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@", buf, 0x16u);
    }
    simpleTimer = v7->_simpleTimer;
  }
  unint64_t guidancePriority = v7->_guidancePriority;
  double fireTime = v7->_fireTime;
  [(PCSimpleTimer *)simpleTimer scheduleInQueue:v7->_queue];
  id v16 = +[PCPersistentInterfaceManager sharedInstance];
  id v17 = +[PCPersistentTimer _backgroundUpdateQueue];
  [v16 addDelegate:v7 queue:v17];

  id v18 = [MEMORY[0x1E4F59E00] sharedInstance];
  [v18 addDelegate:v7];

  [(PCPersistentTimer *)v7 _updateTimers];
  objc_sync_exit(v7);

  if (guidancePriority != -1) {
    +[PCPersistentTimer _updateTime:guidancePriority forGuidancePriority:fireTime];
  }
}

- (double)fireTime
{
  double v2 = self;
  objc_sync_enter(v2);
  double fireTime = v2->_fireTime;
  objc_sync_exit(v2);

  return fireTime;
}

- (double)startTime
{
  double v2 = self;
  objc_sync_enter(v2);
  double startTime = v2->_startTime;
  objc_sync_exit(v2);

  return startTime;
}

- (BOOL)isValid
{
  double v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_target);
  BOOL v4 = WeakRetained != 0;

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)firingIsImminent
{
  double v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(PCSimpleTimer *)v2->_simpleTimer firingIsImminent];
  objc_sync_exit(v2);

  return v3;
}

- (id)userInfo
{
  double v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)_fireTimerFired
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_target);

  if (WeakRetained)
  {
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      int v7 = v2;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "PersistentTimer %{public}@ has fired", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained(&v2->_target);
    if (v2->_selector) {
      id WeakRetained = (id)v2->_selector;
    }
    else {
      id WeakRetained = 0;
    }
    [(PCPersistentTimer *)v2 invalidate];
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v2);

  if (WeakRetained) {
    [v5 performSelector:WeakRetained withObject:v2];
  }
}

uint64_t __43__PCPersistentTimer__backgroundUpdateQueue__block_invoke()
{
  _backgroundUpdateQueue_sQueue = PCCreateQueue("PCPersistentTimer-sharedBackgroundUpdateQueue");
  return MEMORY[0x1F41817F8]();
}

- (void)cutPowerMonitorBatteryConnectedStateDidChange:(id)a3
{
  BOOL v4 = +[PCPersistentTimer _backgroundUpdateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PCPersistentTimer_cutPowerMonitorBatteryConnectedStateDidChange___block_invoke;
  block[3] = &unk_1E698DE90;
  block[4] = self;
  dispatch_async(v4, block);
}

void __67__PCPersistentTimer_cutPowerMonitorBatteryConnectedStateDidChange___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _updateTimers];
  objc_sync_exit(obj);
}

- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(PCPersistentTimer *)v4 _updateTimers];
  objc_sync_exit(v4);
}

- (void)interfaceManagerWWANInterfaceChangedPowerState:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(PCPersistentTimer *)v4 _updateTimers];
  objc_sync_exit(v4);
}

- (void)interfaceManagerInternetReachabilityChanged:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(PCPersistentTimer *)v4 _updateTimers];
  objc_sync_exit(v4);
}

- (NSString)debugDescription
{
  id v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PCPersistentTimer;
  BOOL v4 = [(PCPersistentTimer *)&v14 description];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_fireTime];
  double minimumEarlyFireProportion = self->_minimumEarlyFireProportion;
  BOOL disableSystemWaking = self->_disableSystemWaking;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (self->_selector) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  if (disableSystemWaking) {
    int v10 = "yes";
  }
  else {
    int v10 = "no";
  }
  v11 = NSStringFromSelector(selector);
  id v12 = [v3 stringWithFormat:@"%@{fireDate = %@, early fire proportion = %g, disable system waking = %s, target = %@, selector = %@}", v4, v5, *(void *)&minimumEarlyFireProportion, v10, WeakRetained, v11];

  return (NSString *)v12;
}

+ (double)_currentGuidanceTime
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = a1;
  objc_sync_enter(v2);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PCPersistentTimer__currentGuidanceTime__block_invoke;
  v5[3] = &unk_1E698DEB8;
  v5[4] = v6;
  v5[5] = &v7;
  [(id)sGuidanceTimes enumerateKeysAndObjectsUsingBlock:v5];
  _Block_object_dispose(v6, 8);
  objc_sync_exit(v2);

  double v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __41__PCPersistentTimer__currentGuidanceTime__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ((unint64_t)[v9 unsignedIntegerValue] < *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24))
  {
    [v5 doubleValue];
    double v7 = v6 - CFAbsoluteTimeGetCurrent();
    if (v7 > 2.22044605e-16 && v7 < 7200.0)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 unsignedIntegerValue];
      [v5 doubleValue];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
    }
  }
}

+ (void)_updateTime:(double)a3 forGuidancePriority:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_updateTime_forGuidancePriority__onceToken != -1) {
    dispatch_once(&_updateTime_forGuidancePriority__onceToken, &__block_literal_global_45);
  }
  id v7 = a1;
  objc_sync_enter(v7);
  [v7 _currentGuidanceTime];
  double v9 = v8;
  uint64_t v10 = (void *)sGuidanceTimes;
  v11 = [NSNumber numberWithDouble:a3];
  id v12 = [NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v11 forKey:v12];

  [v7 _currentGuidanceTime];
  double v14 = v13;
  objc_sync_exit(v7);

  if (v14 != v9)
  {
    unint64_t v15 = (unint64_t)(v14 * 1000.0);
    if (v15)
    {
      id v16 = +[PCLog timer];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v15 / 1000.0];
        id v18 = PCStringFromDate(v17);
        int v20 = 138543362;
        id v21 = v18;
        _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "updating timer guidance to %{public}@", (uint8_t *)&v20, 0xCu);
      }
      int v19 = _updateTime_forGuidancePriority__token;
      if (_updateTime_forGuidancePriority__token == -1)
      {
        if (notify_register_check("PCPersistentTimerGuidanceNotification", &_updateTime_forGuidancePriority__token))
        {
LABEL_11:
          notify_cancel(_updateTime_forGuidancePriority__token);
          _updateTime_forGuidancePriority__token = -1;
          return;
        }
        int v19 = _updateTime_forGuidancePriority__token;
      }
      if (!notify_set_state(v19, (unint64_t)(v14 * 1000.0)))
      {
        notify_post("PCPersistentTimerGuidanceNotification");
        return;
      }
      goto LABEL_11;
    }
  }
}

uint64_t __53__PCPersistentTimer__updateTime_forGuidancePriority___block_invoke()
{
  sGuidanceTimes = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (double)minimumEarlyFireProportion
{
  return self->_minimumEarlyFireProportion;
}

- (double)earlyFireConstantInterval
{
  return self->_earlyFireConstantInterval;
}

- (BOOL)disableSystemWaking
{
  return self->_disableSystemWaking;
}

@end