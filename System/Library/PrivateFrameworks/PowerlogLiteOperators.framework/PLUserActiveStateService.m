@interface PLUserActiveStateService
+ (id)defaults;
+ (id)entryEventPointDefinitionState;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSDate)lastPluggedInTime;
- (NSDate)lastUnplugTime;
- (NSDate)lastUserInactiveTime;
- (NSDictionary)cachedBatteryMetrics;
- (NSNumber)pluggedInState;
- (PLEntryNotificationOperatorComposition)batteryNotification;
- (PLUserActiveStateService)init;
- (double)getUserInactiveMinIntervalCA;
- (double)pluggedInTime;
- (id)getLastSystemSleepDate;
- (unint64_t)userActiveNotificationHandle;
- (void)handlePluggedInStateUpdate:(BOOL)a3;
- (void)handleUserActiveStateChangeCallback:(BOOL)a3;
- (void)initOperatorDependancies;
- (void)setBatteryNotification:(id)a3;
- (void)setCachedBatteryMetrics:(id)a3;
- (void)setLastPluggedInTime:(id)a3;
- (void)setLastUnplugTime:(id)a3;
- (void)setLastUserInactiveTime:(id)a3;
- (void)setPluggedInState:(id)a3;
- (void)setPluggedInTime:(double)a3;
- (void)setUserActiveNotificationHandle:(unint64_t)a3;
@end

@implementation PLUserActiveStateService

uint64_t __52__PLUserActiveStateService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"entry"];
  v4 = [v3 objectForKeyedSubscript:@"ExternalConnected"];
  uint64_t v5 = [v4 BOOLValue];

  v6 = *(void **)(a1 + 32);
  return [v6 handlePluggedInStateUpdate:v5];
}

- (void)handlePluggedInStateUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLUserActiveStateService *)self pluggedInState];
  if (!v5
    || (v6 = (void *)v5,
        [(PLUserActiveStateService *)self pluggedInState],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v6,
        v8 != v3))
  {
    v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (v3)
    {
      [(PLUserActiveStateService *)self setLastPluggedInTime:v9];

      [(PLUserActiveStateService *)self setLastUnplugTime:0];
      v10 = PLLogUserActiveState();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        v18 = [NSNumber numberWithBool:v3];
        [(PLUserActiveStateService *)self setPluggedInState:v18];

        return;
      }
      v11 = [(PLUserActiveStateService *)self lastPluggedInTime];
      int v21 = 138412290;
      v22 = v11;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Updated last plugged in time: %@", (uint8_t *)&v21, 0xCu);
    }
    else
    {
      [(PLUserActiveStateService *)self setLastUnplugTime:v9];

      v12 = [(PLUserActiveStateService *)self lastPluggedInTime];

      if (v12)
      {
        v13 = [(PLUserActiveStateService *)self lastUnplugTime];
        v14 = [(PLUserActiveStateService *)self lastPluggedInTime];
        [v13 timeIntervalSinceDate:v14];
        double v16 = v15;

        if (v16 > 0.0)
        {
          [(PLUserActiveStateService *)self pluggedInTime];
          [(PLUserActiveStateService *)self setPluggedInTime:v16 + v17];
        }
        [(PLUserActiveStateService *)self setLastPluggedInTime:0];
      }
      v10 = PLLogUserActiveState();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      v11 = [(PLUserActiveStateService *)self lastUnplugTime];
      v19 = NSNumber;
      [(PLUserActiveStateService *)self pluggedInTime];
      v20 = objc_msgSend(v19, "numberWithDouble:");
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Updated last unplug time: %@, total plugged in time: %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_11;
  }
}

- (NSNumber)pluggedInState
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLUserActiveStateService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"State";
  objc_super v2 = +[PLUserActiveStateService entryEventPointDefinitionState];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionState
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F29F01C0;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"UserInactiveTime";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_RealFormat");
  v17[0] = v13;
  v16[1] = @"TimePluggedInDuringInactiveState";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v3 = objc_msgSend(v2, "commonTypeDict_RealFormat");
  v17[1] = v3;
  v16[2] = @"TimeSinceLastUnplugDuringInactiveState";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v17[2] = v5;
  v16[3] = @"DidSleep";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v17[3] = v7;
  v16[4] = @"BatteryTableID";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

- (PLUserActiveStateService)init
{
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    BOOL v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLUserActiveStateService;
    self = [(PLOperator *)&v5 init];
    BOOL v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if ([MEMORY[0x1E4F92A88] deviceRebooted] || IOPMUserIsActive())
  {
    [(PLUserActiveStateService *)self setLastUserInactiveTime:0];
  }
  else
  {
    v7 = [(PLUserActiveStateService *)self lastUserInactiveTime];

    if (v7 && IOPSDrawingUnlimitedPower())
    {
      int v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLUserActiveStateService *)self setLastPluggedInTime:v8];

      [(PLUserActiveStateService *)self setPluggedInState:MEMORY[0x1E4F1CC38]];
    }
  }
  id v3 = objc_alloc(MEMORY[0x1E4F929E8]);
  v4 = +[PLEventBackwardBatteryEntry entryKey];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PLUserActiveStateService_initOperatorDependancies__block_invoke;
  v9[3] = &unk_1E692A0F0;
  v9[4] = self;
  objc_super v5 = (void *)[v3 initWithOperator:self forEntryKey:v4 withBlock:v9];
  [(PLUserActiveStateService *)self setBatteryNotification:v5];

  v6 = [(PLOperator *)self workQueue];
  -[PLUserActiveStateService setUserActiveNotificationHandle:](self, "setUserActiveNotificationHandle:", IOPMScheduleUserActiveChangedNotification(), MEMORY[0x1E4F143A8], 3221225472, __52__PLUserActiveStateService_initOperatorDependancies__block_invoke_2, &unk_1E692A278, self);
}

uint64_t __52__PLUserActiveStateService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleUserActiveStateChangeCallback:a2];
}

- (void)handleUserActiveStateChangeCallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  objc_super v5 = PLLogUserActiveState();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412290;
    v96 = v6;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "User active tracking: curr state %@", buf, 0xCu);
  }
  v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (v3)
  {
    int v8 = [(PLUserActiveStateService *)self lastUserInactiveTime];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    uint64_t v11 = [(PLUserActiveStateService *)self lastUserInactiveTime];
    if (v11)
    {
      v12 = (void *)v11;
      [MEMORY[0x1E4F929C0] doubleForKey:@"userInactiveMinInterval" ifNotSet:300.0];
      double v14 = v13;

      if (v10 >= v14)
      {
        uint64_t v15 = [(PLUserActiveStateService *)self getLastSystemSleepDate];
        uint64_t v16 = +[PLEventBackwardBatteryEntry entryKey];
        double v17 = [(PLOperator *)self storage];
        v74 = (void *)v16;
        v78 = [v17 lastEntryForKey:v16];

        uint64_t v18 = [(PLUserActiveStateService *)self lastUnplugTime];
        if (v18)
        {
          v19 = [(PLUserActiveStateService *)self lastUnplugTime];
          [v7 timeIntervalSinceDate:v19];
          double v21 = v20;
        }
        else
        {
          double v21 = 0.0;
        }

        if (v15)
        {
          v33 = [(PLUserActiveStateService *)self lastUserInactiveTime];
          BOOL v34 = [v33 compare:v15] == -1;
        }
        else
        {
          BOOL v34 = 0;
        }
        uint64_t v35 = [(PLUserActiveStateService *)self lastPluggedInTime];
        if (v35)
        {
          v36 = (void *)v35;
          v37 = [(PLUserActiveStateService *)self pluggedInState];
          int v38 = [v37 BOOLValue];

          if (v38)
          {
            v39 = [(PLUserActiveStateService *)self lastPluggedInTime];
            [v7 timeIntervalSinceDate:v39];
            double v41 = v40;

            if (v41 <= v10)
            {
              [(PLUserActiveStateService *)self pluggedInTime];
              [(PLUserActiveStateService *)self setPluggedInTime:v41 + v42];
            }
          }
        }
        v75 = (void *)v15;
        v77 = v7;
        v43 = [MEMORY[0x1E4F1CA60] dictionary];
        double v44 = round(v10);
        v45 = [NSNumber numberWithDouble:v44];
        [v43 setObject:v45 forKeyedSubscript:@"UserInactiveTime"];

        v46 = NSNumber;
        v79 = self;
        [(PLUserActiveStateService *)self pluggedInTime];
        v48 = [v46 numberWithDouble:round(v47)];
        [v43 setObject:v48 forKeyedSubscript:@"TimePluggedInDuringInactiveState"];

        BOOL v73 = v34;
        v49 = [NSNumber numberWithBool:v34];
        [v43 setObject:v49 forKeyedSubscript:@"DidSleep"];

        double v50 = round(v21);
        v51 = [NSNumber numberWithDouble:v50];
        [v43 setObject:v51 forKeyedSubscript:@"TimeSinceLastUnplugDuringInactiveState"];

        v52 = PLLogUserActiveState();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v43;
          _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "User active states to send: %@", buf, 0xCu);
        }

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        uint64_t v53 = [&unk_1F29ED6B8 countByEnumeratingWithState:&v89 objects:v94 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v90 != v55) {
                objc_enumerationMutation(&unk_1F29ED6B8);
              }
              uint64_t v57 = *(void *)(*((void *)&v89 + 1) + 8 * i);
              v58 = [NSString stringWithFormat:@"%@_Start", v57];
              v59 = [NSString stringWithFormat:@"%@_End", v57];
              v60 = [(PLUserActiveStateService *)v79 cachedBatteryMetrics];
              v61 = [v60 objectForKeyedSubscript:v57];
              [v43 setObject:v61 forKeyedSubscript:v58];

              v62 = [v78 objectForKeyedSubscript:v57];
              [v43 setObject:v62 forKeyedSubscript:v59];
            }
            uint64_t v54 = [&unk_1F29ED6B8 countByEnumeratingWithState:&v89 objects:v94 count:16];
          }
          while (v54);
        }
        self = v79;
        [(PLUserActiveStateService *)v79 getUserInactiveMinIntervalCA];
        if (v10 >= v63)
        {
          uint64_t v84 = MEMORY[0x1E4F143A8];
          uint64_t v85 = 3221225472;
          v86 = __64__PLUserActiveStateService_handleUserActiveStateChangeCallback___block_invoke;
          v87 = &unk_1E692A2A0;
          id v88 = v43;
          AnalyticsSendEventLazy();
        }
        v64 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"State"];
        v65 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v64];
        v66 = [NSNumber numberWithDouble:v44];
        [v65 setObject:v66 forKeyedSubscript:@"UserInactiveTime"];

        v67 = NSNumber;
        [(PLUserActiveStateService *)v79 pluggedInTime];
        v69 = [v67 numberWithDouble:round(v68)];
        [v65 setObject:v69 forKeyedSubscript:@"TimePluggedInDuringInactiveState"];

        v70 = [NSNumber numberWithBool:v73];
        [v65 setObject:v70 forKeyedSubscript:@"DidSleep"];

        v71 = [NSNumber numberWithDouble:v50];
        [v65 setObject:v71 forKeyedSubscript:@"TimeSinceLastUnplugDuringInactiveState"];

        v7 = v77;
        if (v78)
        {
          v72 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v78, "entryID"));
          [v65 setObject:v72 forKeyedSubscript:@"BatteryTableID"];
        }
        [(PLOperator *)v79 logEntry:v65];
      }
    }
    [(PLUserActiveStateService *)self setLastUserInactiveTime:0];
    [(PLUserActiveStateService *)self setLastUnplugTime:0];
    [(PLUserActiveStateService *)self setPluggedInTime:0.0];
    [(PLUserActiveStateService *)self setCachedBatteryMetrics:0];
  }
  else
  {
    v76 = v7;
    [(PLUserActiveStateService *)self setLastUserInactiveTime:v7];
    [(PLUserActiveStateService *)self setPluggedInTime:0.0];
    [(PLUserActiveStateService *)self setLastUnplugTime:0];
    v22 = +[PLEventBackwardBatteryEntry entryKey];
    __int16 v23 = [(PLOperator *)self storage];
    v24 = [v23 lastEntryForKey:v22];

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v26 = [&unk_1F29ED6B8 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v81 != v28) {
            objc_enumerationMutation(&unk_1F29ED6B8);
          }
          uint64_t v30 = *(void *)(*((void *)&v80 + 1) + 8 * j);
          v31 = [v24 objectForKeyedSubscript:v30];
          [v25 setObject:v31 forKeyedSubscript:v30];
        }
        uint64_t v27 = [&unk_1F29ED6B8 countByEnumeratingWithState:&v80 objects:v93 count:16];
      }
      while (v27);
    }
    [(PLUserActiveStateService *)self setCachedBatteryMetrics:v25];
    v7 = v76;
    if (IOPSDrawingUnlimitedPower()) {
      v32 = v76;
    }
    else {
      v32 = 0;
    }
    [(PLUserActiveStateService *)self setLastPluggedInTime:v32];
  }
}

id __64__PLUserActiveStateService_handleUserActiveStateChangeCallback___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)getLastSystemSleepDate
{
  v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"PowerState"];
  v4 = [NSString stringWithFormat:@"%@ IS NOT NULL", @"KernelSleepDate"];
  objc_super v5 = [NSString stringWithFormat:@"%@ = %hd", @"Event", 4];
  v6 = [(PLOperator *)self storage];
  v11[0] = v4;
  v11[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  int v8 = [v6 lastEntryForKey:v3 withFilters:v7];

  if (v8)
  {
    double v9 = [v8 entryDate];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (NSDate)lastUserInactiveTime
{
  [MEMORY[0x1E4F929C0] doubleForKey:@"PLUserActiveStateLastUserInactiveTimestamp" ifNotSet:0.0];
  if (v2 == 0.0)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
  return (NSDate *)v3;
}

- (void)setLastUserInactiveTime:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSince1970];
    BOOL v3 = (void *)MEMORY[0x1E4F929C0];
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"PLUserActiveStateLastUserInactiveTimestamp" saveToDisk:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F929C0];
    objc_msgSend(v4, "setObject:forKey:saveToDisk:");
  }
}

- (double)getUserInactiveMinIntervalCA
{
  if (qword_1EBD577F0 != -1) {
    dispatch_once(&qword_1EBD577F0, &__block_literal_global_87);
  }
  return *(double *)&qword_1EBD577F8;
}

uint64_t __56__PLUserActiveStateService_getUserInactiveMinIntervalCA__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F929C0] doubleForKey:@"userInactiveMinIntervalCA" ifNotSet:43200.0];
  qword_1EBD577F8 = v1;
  return result;
}

- (NSDate)lastUnplugTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastUnplugTime:(id)a3
{
}

- (NSDate)lastPluggedInTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastPluggedInTime:(id)a3
{
}

- (double)pluggedInTime
{
  return self->_pluggedInTime;
}

- (void)setPluggedInTime:(double)a3
{
  self->_pluggedInTime = a3;
}

- (unint64_t)userActiveNotificationHandle
{
  return self->_userActiveNotificationHandle;
}

- (void)setUserActiveNotificationHandle:(unint64_t)a3
{
  self->_userActiveNotificationHandle = a3;
}

- (PLEntryNotificationOperatorComposition)batteryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryNotification:(id)a3
{
}

- (void)setPluggedInState:(id)a3
{
}

- (NSDictionary)cachedBatteryMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCachedBatteryMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBatteryMetrics, 0);
  objc_storeStrong((id *)&self->_pluggedInState, 0);
  objc_storeStrong((id *)&self->_batteryNotification, 0);
  objc_storeStrong((id *)&self->_lastPluggedInTime, 0);
  objc_storeStrong((id *)&self->_lastUnplugTime, 0);
}

@end