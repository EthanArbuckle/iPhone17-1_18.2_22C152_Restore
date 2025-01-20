@interface NFReaderRestrictor
- (BOOL)_readerModeStoppedShouldCooloffRun:(id)a3;
- (BOOL)_requiresReaderModeProtection;
- (BOOL)_requiresThermalModeProtection;
- (BOOL)_validateStartStopSequence;
- (BOOL)readerModeProtectionActive;
- (BOOL)readerModeStoppedShouldCooloffRun;
- (BOOL)thermalPressureBackoff;
- (BOOL)thermalPressureCritical;
- (BOOL)thermalPressureNominal;
- (NFReaderRestrictor)init;
- (NFReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4;
- (NFReaderRestrictorDelegate)delegate;
- (NSDate)currentTestTime;
- (double)getCooloffTime;
- (double)maxOperationTimeSpan;
- (double)maxReaderTime;
- (id)description;
- (id)readerOperations;
- (id)state;
- (void)_handleReaderBurnoutProtectionDebounceTimer;
- (void)_handleReaderBurnoutProtectionTimer;
- (void)_purgeOldOperations;
- (void)_tagDetectedWithDate:(id)a3;
- (void)setCurrentTestTime:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stackLoaded:(id)a3;
- (void)stackUnloaded;
- (void)tagDetected;
- (void)thermalStateChanged:(unint64_t)a3;
- (void)triggerBurnoutTimer;
@end

@implementation NFReaderRestrictor

- (NFReaderRestrictor)init
{
  return 0;
}

- (NFReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFReaderRestrictor;
  v9 = [(NFReaderRestrictor *)&v16 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    burnoutStateLock = v9->_burnoutStateLock;
    v9->_burnoutStateLock = (NSLock *)v10;

    uint64_t v12 = objc_opt_new();
    readerOperationTimes = v9->_readerOperationTimes;
    v9->_readerOperationTimes = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_thermalMonitor, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    currentTestTime = v9->_currentTestTime;
    v9->_currentTestTime = 0;

    v9->_burnoutProtectionState = 0;
  }

  return v9;
}

- (id)description
{
  v3 = objc_opt_new();
  [(NSLock *)self->_burnoutStateLock lock];
  if ([(NFReaderRestrictor *)self thermalPressureCritical])
  {
    CFStringRef v4 = @"thermal = critical, ";
  }
  else if ([(NFReaderRestrictor *)self thermalPressureBackoff])
  {
    CFStringRef v4 = @"thermal = backoff, ";
  }
  else
  {
    if (![(NFReaderRestrictor *)self thermalPressureNominal]) {
      goto LABEL_8;
    }
    CFStringRef v4 = @"thermal = nominal, ";
  }
  [v3 appendFormat:v4];
LABEL_8:
  uint64_t burnoutProtectionState = (int)self->_burnoutProtectionState;
  if (burnoutProtectionState <= 3) {
    [v3 appendFormat:*(&off_100303A80 + burnoutProtectionState)];
  }
  [v3 appendFormat:@", _currentTestTime = %@", self->_currentTestTime];
  [(NSLock *)self->_burnoutStateLock unlock];

  return v3;
}

- (void)stackLoaded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(NSLock *)self->_burnoutStateLock lock];
  self->_uint64_t burnoutProtectionState = 0;
  id v5 = objc_alloc((Class)NFTimer);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B268C;
  v16[3] = &unk_100301C18;
  objc_copyWeak(&v17, &location);
  v6 = (NFTimer *)[v5 initWithCallback:v16 queue:v4];
  readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
  self->_readermodeBurnoutProtectionTimer = v6;

  id v8 = objc_alloc((Class)NFTimer);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B2704;
  v14[3] = &unk_100301C18;
  objc_copyWeak(&v15, &location);
  v9 = (NFTimer *)[v8 initWithCallback:v14 queue:v4];
  readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
  self->_readermodeBurnoutProtectionDebounceTimer = v9;

  [(NSLock *)self->_burnoutStateLock unlock];
  thermalMonitor = self->_thermalMonitor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B2788;
  v12[3] = &unk_100303A60;
  objc_copyWeak(&v13, &location);
  sub_100077D1C((uint64_t)thermalMonitor, v12, v4);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)stackUnloaded
{
  [(NSLock *)self->_burnoutStateLock lock];
  [(NFTimer *)self->_readermodeBurnoutProtectionTimer stopTimer];
  readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
  self->_readermodeBurnoutProtectionTimer = 0;

  [(NFTimer *)self->_readermodeBurnoutProtectionDebounceTimer stopTimer];
  readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
  self->_readermodeBurnoutProtectionDebounceTimer = 0;

  self->_uint64_t burnoutProtectionState = 0;
  [(NSMutableArray *)self->_readerOperationTimes removeAllObjects];
  sub_100077DB0((uint64_t)self->_thermalMonitor);
  burnoutStateLock = self->_burnoutStateLock;

  [(NSLock *)burnoutStateLock unlock];
}

- (void)_tagDetectedWithDate:(id)a3
{
  burnoutStateLock = self->_burnoutStateLock;
  id v5 = a3;
  [(NSLock *)burnoutStateLock lock];
  readerOperationTimes = self->_readerOperationTimes;
  id v7 = sub_1000C1418((uint64_t)NFReaderOperation, @"ReaderStarted", v5);

  [(NSMutableArray *)readerOperationTimes addObject:v7];
  if ([(NFReaderRestrictor *)self _requiresThermalModeProtection]
    && [(NFReaderRestrictor *)self thermalPressureCritical])
  {
    self->_uint64_t burnoutProtectionState = 1;
    readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
    double v9 = 0.0;
    double v10 = 0.5;
LABEL_7:
    [(NFTimer *)readermodeBurnoutProtectionTimer startTimer:v9 leeway:v10];
    goto LABEL_8;
  }
  if ([(NFReaderRestrictor *)self _requiresReaderModeProtection]
    || [(NFReaderRestrictor *)self _requiresThermalModeProtection])
  {
    self->_uint64_t burnoutProtectionState = 1;
    v11 = self->_readermodeBurnoutProtectionTimer;
    [(NFReaderRestrictor *)self maxReaderTime];
    double v10 = 0.5;
    readermodeBurnoutProtectionTimer = v11;
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v12 = self->_burnoutStateLock;

  [(NSLock *)v12 unlock];
}

- (void)tagDetected
{
  if (self->_currentTestTime)
  {
    -[NFReaderRestrictor _tagDetectedWithDate:](self, "_tagDetectedWithDate:");
  }
  else
  {
    id v3 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
    [(NFReaderRestrictor *)self _tagDetectedWithDate:v3];
  }
}

- (BOOL)_readerModeStoppedShouldCooloffRun:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_burnoutStateLock lock];
  if (![(NFReaderRestrictor *)self _requiresReaderModeProtection])
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_47;
  }
  unsigned int burnoutProtectionState = self->_burnoutProtectionState;
  if (burnoutProtectionState == 2)
  {
    [(NFReaderRestrictor *)self getCooloffTime];
    double v12 = v11;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v14(6, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", v18, ClassName, Name, 243, *(void *)&v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v49 = v21;
      *(_WORD *)&v49[4] = 2082;
      *(void *)&v49[6] = object_getClassName(self);
      __int16 v50 = 2082;
      v51 = sel_getName(a2);
      __int16 v52 = 1024;
      int v53 = 243;
      __int16 v54 = 2048;
      double v55 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", buf, 0x2Cu);
    }

    readerOperationTimes = self->_readerOperationTimes;
    v23 = sub_1000C1418((uint64_t)NFReaderOperation, @"ReaderStopped", v5);
    [(NSMutableArray *)readerOperationTimes addObject:v23];

    goto LABEL_33;
  }
  if (burnoutProtectionState != 1)
  {
    if (!burnoutProtectionState && [(NFReaderRestrictor *)self thermalPressureCritical])
    {
      self->_unsigned int burnoutProtectionState = 3;
      BOOL v7 = !self->_coolOffRunning;
      if (!self->_coolOffRunning) {
        self->_coolOffRunning = 1;
      }
      readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
      double v9 = 3153600000.0;
      double v10 = 0.5;
LABEL_36:
      [(NFTimer *)readermodeBurnoutProtectionDebounceTimer startTimer:v9 leeway:v10];
      goto LABEL_47;
    }
    goto LABEL_9;
  }
  [(NFReaderRestrictor *)self getCooloffTime];
  double v12 = v24;
  v25 = self->_readerOperationTimes;
  v26 = sub_1000C1418((uint64_t)NFReaderOperation, @"ReaderStopped", v5);
  [(NSMutableArray *)v25 addObject:v26];

  [(NFTimer *)self->_readermodeBurnoutProtectionTimer stopTimer];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v27 = NFLogGetLogger();
  v28 = (void (*)(uint64_t, const char *, ...))v27;
  if (v12 > 0.0)
  {
    if (v27)
    {
      v29 = object_getClass(self);
      BOOL v30 = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v46 = sel_getName(a2);
      uint64_t v32 = 45;
      if (v30) {
        uint64_t v32 = 43;
      }
      v28(6, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", v32, v31, v46, 225, *(void *)&v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = object_getClass(self);
      if (class_isMetaClass(v34)) {
        int v35 = 43;
      }
      else {
        int v35 = 45;
      }
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v49 = v35;
      *(_WORD *)&v49[4] = 2082;
      *(void *)&v49[6] = object_getClassName(self);
      __int16 v50 = 2082;
      v51 = sel_getName(a2);
      __int16 v52 = 1024;
      int v53 = 225;
      __int16 v54 = 2048;
      double v55 = v12;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", buf, 0x2Cu);
    }

    v36 = NFSharedSignpostLog();
    if (os_signpost_enabled(v36))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v49 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for %0.2lf secs", buf, 0xCu);
    }

    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322CB8];
LABEL_33:
    self->_unsigned int burnoutProtectionState = 3;
    BOOL v7 = !self->_coolOffRunning;
    if (!self->_coolOffRunning) {
      self->_coolOffRunning = 1;
    }
    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
    double v10 = 0.5;
    double v9 = v12;
    goto LABEL_36;
  }
  if (v27)
  {
    v37 = object_getClass(self);
    BOOL v38 = class_isMetaClass(v37);
    v39 = object_getClassName(self);
    v47 = sel_getName(a2);
    uint64_t v40 = 45;
    if (v38) {
      uint64_t v40 = 43;
    }
    v28(6, "%c[%{public}s %{public}s]:%i Cooloff not needed.", v40, v39, v47, 236);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v41 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = object_getClass(self);
    if (class_isMetaClass(v42)) {
      int v43 = 43;
    }
    else {
      int v43 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v49 = v43;
    *(_WORD *)&v49[4] = 2082;
    *(void *)&v49[6] = object_getClassName(self);
    __int16 v50 = 2082;
    v51 = sel_getName(a2);
    __int16 v52 = 1024;
    int v53 = 236;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff not needed.", buf, 0x22u);
  }

  BOOL v7 = 0;
  self->_unsigned int burnoutProtectionState = 0;
LABEL_47:
  [(NFReaderRestrictor *)self _purgeOldOperations];
  [(NFReaderRestrictor *)self _validateStartStopSequence];
  [(NSLock *)self->_burnoutStateLock unlock];

  return v7;
}

- (BOOL)readerModeStoppedShouldCooloffRun
{
  if (self->_currentTestTime)
  {
    return -[NFReaderRestrictor _readerModeStoppedShouldCooloffRun:](self, "_readerModeStoppedShouldCooloffRun:");
  }
  else
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
    BOOL v5 = [(NFReaderRestrictor *)self _readerModeStoppedShouldCooloffRun:v4];

    return v5;
  }
}

- (BOOL)readerModeProtectionActive
{
  [(NSLock *)self->_burnoutStateLock lock];
  if ([(NFReaderRestrictor *)self _requiresReaderModeProtection]
    && self->_burnoutProtectionState > 1)
  {
    BOOL v3 = 1;
  }
  else if ([(NFReaderRestrictor *)self _requiresThermalModeProtection])
  {
    BOOL v3 = [(NFReaderRestrictor *)self thermalPressureCritical];
  }
  else
  {
    BOOL v3 = 0;
  }
  [(NSLock *)self->_burnoutStateLock unlock];
  return v3;
}

- (void)triggerBurnoutTimer
{
  [(NSLock *)self->_burnoutStateLock lock];
  self->_unsigned int burnoutProtectionState = 1;
  [(NSLock *)self->_burnoutStateLock unlock];
  readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;

  [(NFTimer *)readermodeBurnoutProtectionTimer startTimer:0.0 leeway:0.5];
}

- (id)state
{
  BOOL v3 = objc_opt_new();
  id v4 = [(NSMutableArray *)self->_readerOperationTimes copy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) description];
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc((Class)NSDictionary);
  id v12 = [v3 copy];
  id v13 = +[NSNumber numberWithUnsignedInt:self->_burnoutProtectionState];
  v14 = +[NSNumber numberWithUnsignedInteger:sub_100077E24(self->_thermalMonitor)];
  id v15 = [v11 initWithObjectsAndKeys:v12, @"ReaderHistory", v13, @"state", v14, @"ThermalState", 0, (void)v17];

  return v15;
}

- (id)readerOperations
{
  return self->_readerOperationTimes;
}

- (void)setCurrentTestTime:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentTestTime, a3);
  if (self->_burnoutProtectionState == 3
    && ![(NFReaderRestrictor *)self thermalPressureCritical])
  {
    [(NFTimer *)self->_readermodeBurnoutProtectionDebounceTimer stopTimer];
    [(NFReaderRestrictor *)self _handleReaderBurnoutProtectionDebounceTimer];
  }
}

- (NSDate)currentTestTime
{
  return self->_currentTestTime;
}

- (BOOL)thermalPressureCritical
{
  return (unint64_t)sub_100077E24(self->_thermalMonitor) > 2;
}

- (BOOL)thermalPressureBackoff
{
  return sub_100077E24(self->_thermalMonitor) == 2;
}

- (BOOL)thermalPressureNominal
{
  return !sub_100077E24(self->_thermalMonitor) || sub_100077E24(self->_thermalMonitor) == 1;
}

- (BOOL)_requiresThermalModeProtection
{
  return 1;
}

- (BOOL)_requiresReaderModeProtection
{
  if (!NFIsInternalBuild()) {
    return 1;
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"BurnoutTimerDisable"];

  if (!v5) {
    return 1;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Disabling reader mode protection.", v11, ClassName, Name, 371);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = v14;
    __int16 v19 = 2082;
    long long v20 = object_getClassName(self);
    __int16 v21 = 2082;
    v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 371;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling reader mode protection.", buf, 0x22u);
  }

  return 0;
}

- (void)_purgeOldOperations
{
  currentTestTime = self->_currentTestTime;
  if (currentTestTime)
  {
    id v4 = currentTestTime;
  }
  else
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  }
  unsigned int v5 = v4;
  id v6 = (NSMutableArray *)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_readerOperationTimes;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
        if (v12) {
          id v13 = *(void **)(v12 + 8);
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;
        -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v14, (void)v21);
        double v16 = v15;
        [(NFReaderRestrictor *)self maxOperationTimeSpan];
        double v18 = v17;

        if (v16 <= v18) {
          [(NSMutableArray *)v6 addObject:v12];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v19 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v9 = v19;
    }
    while (v19);
  }

  readerOperationTimes = self->_readerOperationTimes;
  self->_readerOperationTimes = v6;
}

- (BOOL)_validateStartStopSequence
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_readerOperationTimes;
  id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v30;
    char v6 = -1;
    do
    {
      id v7 = 0;
      char v8 = v6;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v7);
        if (v9) {
          id v9 = (void *)v9[2];
        }
        uint64_t v10 = v9;
        unsigned int v11 = [v10 isEqualToString:@"ReaderStopped"];
        char v6 = v11 ^ 1;

        if ((v11 ^ 1) == v8)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            id v13 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            if (v11) {
              CFStringRef v18 = @"Stop";
            }
            else {
              CFStringRef v18 = @"Start";
            }
            uint64_t v19 = 45;
            if (isMetaClass) {
              uint64_t v19 = 43;
            }
            v13(3, "%c[%{public}s %{public}s]:%i Failed validation : last == current == %{public}@", v19, ClassName, Name, 406, v18);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          long long v20 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            long long v21 = object_getClass(self);
            if (class_isMetaClass(v21)) {
              int v22 = 43;
            }
            else {
              int v22 = 45;
            }
            long long v23 = object_getClassName(self);
            long long v24 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            CFStringRef v25 = @"Start";
            if (v11) {
              CFStringRef v25 = @"Stop";
            }
            int v34 = v22;
            __int16 v35 = 2082;
            v36 = v23;
            __int16 v37 = 2082;
            BOOL v38 = v24;
            __int16 v39 = 1024;
            int v40 = 406;
            __int16 v41 = 2114;
            CFStringRef v42 = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed validation : last == current == %{public}@", buf, 0x2Cu);
          }
        }
        id v7 = (char *)v7 + 1;
        char v8 = v11 ^ 1;
      }
      while (v4 != v7);
      id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    }
    while (v4);
  }

  return 1;
}

- (void)thermalStateChanged:(unint64_t)a3
{
  [(NSLock *)self->_burnoutStateLock lock];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i New state : %lu", v10, ClassName, Name, 424, a3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unsigned int v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v57 = v13;
    *(_WORD *)&v57[4] = 2082;
    *(void *)&v57[6] = object_getClassName(self);
    __int16 v58 = 2082;
    v59 = sel_getName(a2);
    __int16 v60 = 1024;
    int v61 = 424;
    __int16 v62 = 2048;
    unint64_t v63 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New state : %lu", buf, 0x2Cu);
  }

  if (a3 < 2)
  {
    if (self->_burnoutProtectionState != 3) {
      goto LABEL_53;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v26 = NFLogGetLogger();
    if (v26)
    {
      uint64_t v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(self);
      BOOL v29 = class_isMetaClass(v28);
      long long v30 = object_getClassName(self);
      __int16 v54 = sel_getName(a2);
      uint64_t v31 = 45;
      if (v29) {
        uint64_t v31 = 43;
      }
      v27(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now nominal, re-scheduling the timer.", v31, v30, v54, 432);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      __int16 v35 = object_getClassName(self);
      v36 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v57 = v34;
      *(_WORD *)&v57[4] = 2082;
      *(void *)&v57[6] = v35;
      __int16 v58 = 2082;
      v59 = v36;
      __int16 v60 = 1024;
      int v61 = 432;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now nominal, re-scheduling the timer.", buf, 0x22u);
    }

    __int16 v37 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v37)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)v57 = 0x4014000000000000;
LABEL_49:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for %lf secs", buf, 0xCu);
LABEL_50:

    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
    double v50 = 5.0;
LABEL_52:
    [(NFTimer *)readermodeBurnoutProtectionDebounceTimer startTimer:v50 leeway:0.5];
    goto LABEL_53;
  }
  if (a3 - 3 >= 2)
  {
    if (a3 != 2 || self->_burnoutProtectionState != 3) {
      goto LABEL_53;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      __int16 v39 = (void (*)(uint64_t, const char *, ...))v38;
      int v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      CFStringRef v42 = object_getClassName(self);
      double v55 = sel_getName(a2);
      uint64_t v43 = 45;
      if (v41) {
        uint64_t v43 = 43;
      }
      v39(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now moderate, re-scheduling the timer.", v43, v42, v55, 447);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      v47 = object_getClassName(self);
      v48 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v57 = v46;
      *(_WORD *)&v57[4] = 2082;
      *(void *)&v57[6] = v47;
      __int16 v58 = 2082;
      v59 = v48;
      __int16 v60 = 1024;
      int v61 = 447;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now moderate, re-scheduling the timer.", buf, 0x22u);
    }

    __int16 v37 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v37)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)v57 = 0x4014000000000000;
    goto LABEL_49;
  }
  unsigned int burnoutProtectionState = self->_burnoutProtectionState;
  if (!burnoutProtectionState)
  {
    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionTimer;
    double v50 = 0.0;
    goto LABEL_52;
  }
  if (burnoutProtectionState == 1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      double v16 = (void (*)(uint64_t, const char *, ...))v15;
      double v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      uint64_t v19 = object_getClassName(self);
      int v53 = sel_getName(a2);
      uint64_t v20 = 45;
      if (v18) {
        uint64_t v20 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now heavy, re-scheduling the timer.", v20, v19, v53, 461);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      long long v24 = object_getClassName(self);
      CFStringRef v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v57 = v23;
      *(_WORD *)&v57[4] = 2082;
      *(void *)&v57[6] = v24;
      __int16 v58 = 2082;
      v59 = v25;
      __int16 v60 = 1024;
      int v61 = 461;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now heavy, re-scheduling the timer.", buf, 0x22u);
    }

    [(NFTimer *)self->_readermodeBurnoutProtectionTimer startTimer:0.0];
  }
LABEL_53:
  [(NSLock *)self->_burnoutStateLock unlock];
}

- (void)_handleReaderBurnoutProtectionTimer
{
  [(NSLock *)self->_burnoutStateLock lock];
  if ([(NFReaderRestrictor *)self _requiresReaderModeProtection])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", v9, ClassName, Name, 482);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v12;
      __int16 v18 = 2082;
      uint64_t v19 = object_getClassName(self);
      __int16 v20 = 2082;
      long long v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 482;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", buf, 0x22u);
    }

    self->_unsigned int burnoutProtectionState = 2;
    [(NSLock *)self->_burnoutStateLock unlock];
    int v13 = [(NFReaderRestrictor *)self delegate];
    [v13 handleReaderBurnoutTimer];
  }
  else
  {
    burnoutStateLock = self->_burnoutStateLock;
    [(NSLock *)burnoutStateLock unlock];
  }
}

- (void)_handleReaderBurnoutProtectionDebounceTimer
{
  [(NSLock *)self->_burnoutStateLock lock];
  if ([(NFReaderRestrictor *)self _requiresThermalModeProtection]
    && [(NFReaderRestrictor *)self thermalPressureCritical])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed but thermals is still too hot.", v9, ClassName, Name, 497);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v28 = v12;
      __int16 v29 = 2082;
      long long v30 = object_getClassName(self);
      __int16 v31 = 2082;
      long long v32 = sel_getName(a2);
      __int16 v33 = 1024;
      int v34 = 497;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed but thermals is still too hot.", buf, 0x22u);
    }

    int v13 = NFSharedSignpostLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for.. ever", buf, 2u);
    }

    [(NFTimer *)self->_readermodeBurnoutProtectionDebounceTimer startTimer:3153600000.0 leeway:0.5];
    [(NSLock *)self->_burnoutStateLock unlock];
  }
  else if ([(NFReaderRestrictor *)self _requiresReaderModeProtection])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFLogGetLogger();
    if (v14)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
      double v16 = object_getClass(self);
      BOOL v17 = class_isMetaClass(v16);
      __int16 v18 = object_getClassName(self);
      uint64_t v26 = sel_getName(a2);
      uint64_t v19 = 45;
      if (v17) {
        uint64_t v19 = 43;
      }
      v15(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", v19, v18, v26, 507);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v28 = v22;
      __int16 v29 = 2082;
      long long v30 = object_getClassName(self);
      __int16 v31 = 2082;
      long long v32 = sel_getName(a2);
      __int16 v33 = 1024;
      int v34 = 507;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", buf, 0x22u);
    }

    self->_unsigned int burnoutProtectionState = 0;
    [(NSLock *)self->_burnoutStateLock unlock];
    int v23 = [(NFReaderRestrictor *)self delegate];
    [v23 handleReaderBurnoutCleared];
  }
  else
  {
    burnoutStateLock = self->_burnoutStateLock;
    [(NSLock *)burnoutStateLock unlock];
  }
}

- (NFReaderRestrictorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NFReaderRestrictorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTestTime, 0);
  objc_storeStrong((id *)&self->_burnoutStateLock, 0);
  objc_storeStrong((id *)&self->_readerOperationTimes, 0);
  objc_storeStrong((id *)&self->_readermodeBurnoutProtectionDebounceTimer, 0);
  objc_storeStrong((id *)&self->_readermodeBurnoutProtectionTimer, 0);

  objc_storeStrong((id *)&self->_thermalMonitor, 0);
}

- (double)maxOperationTimeSpan
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"NFReaderRestrictor.m" lineNumber:528 description:@"Not implemented"];

  return 300.0;
}

- (double)getCooloffTime
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"NFReaderRestrictor.m" lineNumber:534 description:@"Not implemented"];

  return 315360000.0;
}

- (double)maxReaderTime
{
  unsigned __int8 v3 = [(NFReaderRestrictor *)self thermalPressureNominal];
  double result = 20.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(NFReaderRestrictor *)self thermalPressureBackoff];
    double result = 0.0;
    if (v5) {
      return 7.0;
    }
  }
  return result;
}

@end