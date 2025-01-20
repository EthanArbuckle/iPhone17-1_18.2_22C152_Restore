@interface PowerModeObjImpl
- (BOOL)appliesChargingPolicy;
- (BOOL)appliesPowerTarget;
- (BOOL)enabled;
- (BOOL)pendingDelayedEntryTimer;
- (BOOL)state;
- (BOOL)supportedPlatform;
- (NSDate)lastEntryTime;
- (NSDate)lastExitTime;
- (NSNumber)endingSOC;
- (NSNumber)startingSOC;
- (OS_os_log)log;
- (PPSTelemetryIdentifier)powerlogIdentifier;
- (double)entryDelay;
- (double)getEntryDelay;
- (double)getMaxEngagementDuration;
- (double)maxEngagementDuration;
- (unint64_t)exitReason;
- (void)disablePowerMode;
- (void)enablePowerMode;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)logStatusToPowerLog;
- (void)restoreState:(id)a3;
- (void)setAppliesChargingPolicy:(BOOL)a3;
- (void)setAppliesPowerTarget:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndingSOC:(id)a3;
- (void)setEntryDelay:(double)a3;
- (void)setExitReason:(unint64_t)a3;
- (void)setLastEntryTime:(id)a3;
- (void)setLastExitTime:(id)a3;
- (void)setLog:(id)a3;
- (void)setMaxEngagementDuration:(double)a3;
- (void)setPendingDelayedEntryTimer:(BOOL)a3;
- (void)setPowerlogIdentifier:(PPSTelemetryIdentifier *)a3;
- (void)setStartingSOC:(id)a3;
- (void)setState:(BOOL)a3;
- (void)setSupportedPlatform:(BOOL)a3;
- (void)updatePowerTarget;
- (void)updateSMCDebugKey;
@end

@implementation PowerModeObjImpl

- (BOOL)supportedPlatform
{
  return self->_supportedPlatform;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)state
{
  return self->_state;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)enterPowerMode
{
  [(PowerModeObjImpl *)self setState:1];
  v3 = +[NSDate date];
  [(PowerModeObjImpl *)self setLastEntryTime:v3];

  [(PowerModeObjImpl *)self setExitReason:0];
  v4 = +[DeviceContext sharedInstance];
  v5 = [v4 objectForKeyedSubscript:@"kBatteryLevelContext"];
  [(PowerModeObjImpl *)self setStartingSOC:v5];

  v6 = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering Contextual Power Mode %@", (uint8_t *)&v15, 0xCu);
  }
  if ([(PowerModeObjImpl *)self appliesPowerTarget] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v15 = 138412290;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating power target for %@", (uint8_t *)&v15, 0xCu);
    }
    [(PowerModeObjImpl *)self updatePowerTarget];
  }
  if ([(PowerModeObjImpl *)self appliesChargingPolicy]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v15 = 138412290;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating charging policy for %@", (uint8_t *)&v15, 0xCu);
    }
    [(PowerModeObjImpl *)self updateChargingPolicy];
  }
  [(PowerModeObjImpl *)self updateSMCDebugKey];
}

- (void)exitPowerMode
{
  [(PowerModeObjImpl *)self setState:0];
  v3 = +[NSDate date];
  [(PowerModeObjImpl *)self setLastExitTime:v3];

  v4 = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v24 = 138412290;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Exiting Contextual Power Mode %@", (uint8_t *)&v24, 0xCu);
  }
  if ([(PowerModeObjImpl *)self appliesPowerTarget] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v24 = 138412290;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating power target for %@", (uint8_t *)&v24, 0xCu);
    }
    [(PowerModeObjImpl *)self updatePowerTarget];
  }
  if ([(PowerModeObjImpl *)self appliesChargingPolicy]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v24 = 138412290;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating charging policy for %@", (uint8_t *)&v24, 0xCu);
    }
    [(PowerModeObjImpl *)self updateChargingPolicy];
  }
  v13 = +[DeviceContext sharedInstance];
  v14 = [v13 objectForKeyedSubscript:@"kBatteryLevelContext"];
  [(PowerModeObjImpl *)self setEndingSOC:v14];

  [(PowerModeObjImpl *)self updateSMCDebugKey];
  int v15 = +[AnalyticsLogger logger];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [(PowerModeObjImpl *)self lastEntryTime];
  v19 = [(PowerModeObjImpl *)self lastExitTime];
  v20 = [(PowerModeObjImpl *)self startingSOC];
  v21 = [(PowerModeObjImpl *)self endingSOC];
  unint64_t v22 = [(PowerModeObjImpl *)self exitReason] - 1;
  if (v22 > 4) {
    CFStringRef v23 = @"Unknown";
  }
  else {
    CFStringRef v23 = off_1000144F0[v22];
  }
  [v15 logCAEventforMode:v17 startDate:v18 endDate:v19 startingSOC:v20 endingSOC:v21 exitReason:v23];
}

- (void)enablePowerMode
{
}

- (void)disablePowerMode
{
}

- (void)restoreState:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    *(_DWORD *)buf = 138412546;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2112;
    id v24 = v4;
    id v7 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restoring state for %@: %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [v4 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 isEqualToString:@"state"])
        {
          v14 = [v4 objectForKeyedSubscript:@"state"];
          -[PowerModeObjImpl setState:](self, "setState:", [v14 BOOLValue]);
        }
        if ([v13 isEqualToString:@"lastExitTime"])
        {
          int v15 = [v4 objectForKeyedSubscript:@"lastExitTime"];
          [(PowerModeObjImpl *)self setLastExitTime:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)logStatusToPowerLog
{
  if (![(PowerModeObjImpl *)self powerlogIdentifier])
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    [(PowerModeObjImpl *)self setPowerlogIdentifier:PPSCreateTelemetryIdentifier()];
  }
  if ([(PowerModeObjImpl *)self powerlogIdentifier])
  {
    if ([(PowerModeObjImpl *)self exitReason])
    {
      v13[0] = @"status";
      v5 = +[NSNumber numberWithBool:[(PowerModeObjImpl *)self state]];
      v13[1] = @"ExitReason";
      v14[0] = v5;
      v6 = +[NSNumber numberWithUnsignedInteger:[(PowerModeObjImpl *)self exitReason]];
      v14[1] = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    }
    else
    {
      CFStringRef v11 = @"status";
      v5 = +[NSNumber numberWithBool:[(PowerModeObjImpl *)self state]];
      v12 = v5;
      id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    }

    v8 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Logging %@ to powerlog", (uint8_t *)&v9, 0xCu);
    }

    [(PowerModeObjImpl *)self powerlogIdentifier];
    PPSSendTelemetry();
  }
}

- (double)getEntryDelay
{
  [(PowerModeObjImpl *)self entryDelay];
  return result;
}

- (double)getMaxEngagementDuration
{
  [(PowerModeObjImpl *)self maxEngagementDuration];
  return result;
}

- (void)updatePowerTarget
{
  id v5 = +[CLPCPolicyInterfaceHelper sharedInstance];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [v5 updatePowerTargetForMode:v4 withState:-[PowerModeObjImpl state](self, "state")];
}

- (void)updateSMCDebugKey
{
  id v5 = +[SMCSensorExchangeHelper sharedInstance];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [v5 updateSMCDebugKey:v4 withState:-[PowerModeObjImpl state](self, "state")];
}

- (void)setLog:(id)a3
{
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setSupportedPlatform:(BOOL)a3
{
  self->_supportedPlatform = a3;
}

- (NSDate)lastEntryTime
{
  return self->_lastEntryTime;
}

- (void)setLastEntryTime:(id)a3
{
}

- (NSDate)lastExitTime
{
  return self->_lastExitTime;
}

- (void)setLastExitTime:(id)a3
{
}

- (double)entryDelay
{
  return self->_entryDelay;
}

- (void)setEntryDelay:(double)a3
{
  self->_entryDelay = a3;
}

- (double)maxEngagementDuration
{
  return self->_maxEngagementDuration;
}

- (void)setMaxEngagementDuration:(double)a3
{
  self->_maxEngagementDuration = a3;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (NSNumber)startingSOC
{
  return self->_startingSOC;
}

- (void)setStartingSOC:(id)a3
{
}

- (NSNumber)endingSOC
{
  return self->_endingSOC;
}

- (void)setEndingSOC:(id)a3
{
}

- (PPSTelemetryIdentifier)powerlogIdentifier
{
  return self->_powerlogIdentifier;
}

- (void)setPowerlogIdentifier:(PPSTelemetryIdentifier *)a3
{
  self->_powerlogIdentifier = a3;
}

- (BOOL)appliesPowerTarget
{
  return self->_appliesPowerTarget;
}

- (void)setAppliesPowerTarget:(BOOL)a3
{
  self->_appliesPowerTarget = a3;
}

- (BOOL)appliesChargingPolicy
{
  return self->_appliesChargingPolicy;
}

- (void)setAppliesChargingPolicy:(BOOL)a3
{
  self->_appliesChargingPolicy = a3;
}

- (BOOL)pendingDelayedEntryTimer
{
  return self->_pendingDelayedEntryTimer;
}

- (void)setPendingDelayedEntryTimer:(BOOL)a3
{
  self->_pendingDelayedEntryTimer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingSOC, 0);
  objc_storeStrong((id *)&self->_startingSOC, 0);
  objc_storeStrong((id *)&self->_lastExitTime, 0);
  objc_storeStrong((id *)&self->_lastEntryTime, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end