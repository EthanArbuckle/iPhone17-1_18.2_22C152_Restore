@interface DPCRSSIPolicy
- (DPCRSSIPolicy)initWithStateMachine:(id)a3;
- (unint64_t)onRSSIChange:(id)a3;
- (void)notifyNewEvent:(unint64_t)a3;
- (void)onWristStateChange:(int64_t)a3;
- (void)runRSSIAdapter:(unint64_t)a3 RSSI:(id)a4;
@end

@implementation DPCRSSIPolicy

- (DPCRSSIPolicy)initWithStateMachine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCRSSIPolicy;
  v5 = [(DPCBasePolicy *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DPCBasePolicy *)v5 setRequireRSSI:1];
    [(DPCBasePolicy *)v6 setStateMachine:v4];
  }

  return v6;
}

- (void)notifyNewEvent:(unint64_t)a3
{
  v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(DPCBasePolicy *)self stateMachine];
    id v7 = [v6 currentWatchWristState];
    if ((unint64_t)v7 >= 4)
    {
      objc_super v8 = +[NSString stringWithFormat:@"Undefined state (%ld)", v7];
    }
    else
    {
      objc_super v8 = *(&off_100010508 + (void)v7);
    }
    id v9 = v8;
    if (a3 >= 3)
    {
      v10 = +[NSString stringWithFormat:@"Undefined state (%ld)", a3];
    }
    else
    {
      v10 = *(&off_100010528 + a3);
    }
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current wrist state: %@, checking if need to notify with watch state: %@", buf, 0x16u);
  }
  v11 = [(DPCBasePolicy *)self stateMachine];
  if ([v11 currentWatchWristState] == (id)3)
  {
    BOOL v12 = 1;
  }
  else
  {
    v13 = [(DPCBasePolicy *)self stateMachine];
    BOOL v12 = [v13 currentWatchWristState] == (id)1;
  }
  if (a3 == 2 && v12)
  {
    [(DPCBasePolicy *)self scheduleSendAbsenceEvent];
  }
  else if (a3 == 1)
  {
    [(DPCBasePolicy *)self invalidateAbsenceEvent];
    v14 = [(DPCBasePolicy *)self detectedNewEventBlock];
    v14[2](v14, 1);

    v15 = +[NSDate date];
    [v15 timeIntervalSince1970];
    double v17 = v16;
    v18 = [(DPCBasePolicy *)self stateMachine];
    [v18 setLastPresenceEventTimestamp:v17];
  }
}

- (unint64_t)onRSSIChange:(id)a3
{
  id v4 = a3;
  v5 = [(DPCBasePolicy *)self stateMachine];
  uint64_t v6 = (uint64_t)[v5 isInRSSIStreamingMode];

  if (v6) {
    goto LABEL_2;
  }
  objc_super v8 = [(DPCBasePolicy *)self stateMachine];
  unsigned __int8 v9 = [v8 isInDiscoveryMode];
  if ((v9 & 1) != 0
    || ([(DPCBasePolicy *)self stateMachine],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        ([(id)v6 isMonitoringAbsence] & 1) != 0))
  {
    [v4 floatValue];
    float v11 = v10;
    BOOL v12 = +[DPCDefaults sharedInstance];
    v13 = [v12 NSNumberForDefault:@"DPCDefaultsThresholdD2"];
    [v13 floatValue];
    float v15 = v14;

    if ((v9 & 1) == 0) {
    if (v11 <= v15)
    }
    {
      double v16 = sub_100006A24((uint64_t)off_100016CB8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        id v37 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device Absence Detected! %@; going to monitor for Presence",
          (uint8_t *)&v36,
          0xCu);
      }

      double v17 = [(DPCBasePolicy *)self stateMachine];
      [v17 setIsInDiscoveryMode:0];

      [(DPCRSSIPolicy *)self runRSSIAdapter:2 RSSI:v4];
      v18 = [(DPCBasePolicy *)self stateMachine];
      [v18 lastPresenceEventTimestamp];
      double v20 = v19;

      if (v20 == 0.0)
      {
        __int16 v21 = sub_100006A24((uint64_t)off_100016CB8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignore Absence event: Watch hasn't been back to phone in this session.", (uint8_t *)&v36, 2u);
        }
      }
      else
      {
        [(DPCRSSIPolicy *)self notifyNewEvent:2];
        __int16 v21 = [(DPCBasePolicy *)self telemetry];
        -[NSObject registerWatchEvent:rssiValue:](v21, "registerWatchEvent:rssiValue:", 2, [v4 integerValue]);
      }

      v34 = [(DPCBasePolicy *)self stateMachine];
      [v34 setIsMonitoringAbsence:0];

      unint64_t v7 = 1;
      goto LABEL_25;
    }
  }
  else
  {
  }
  v22 = [(DPCBasePolicy *)self stateMachine];
  unsigned __int8 v23 = [v22 isInDiscoveryMode];
  if ((v23 & 1) == 0)
  {
    uint64_t v6 = [(DPCBasePolicy *)self stateMachine];
    if ([(id)v6 isMonitoringAbsence])
    {

LABEL_2:
      unint64_t v7 = 0;
      goto LABEL_25;
    }
  }
  [v4 floatValue];
  float v25 = v24;
  v26 = +[DPCDefaults sharedInstance];
  v27 = [v26 NSNumberForDefault:@"DPCDefaultsThresholdD1"];
  [v27 floatValue];
  float v29 = v28;

  if ((v23 & 1) == 0) {
  if (v25 < v29)
  }
    goto LABEL_2;
  v30 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    id v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Device Presence Detected! %@; going to monitor for Absence",
      (uint8_t *)&v36,
      0xCu);
  }

  v31 = [(DPCBasePolicy *)self stateMachine];
  [v31 setIsInDiscoveryMode:0];

  [(DPCRSSIPolicy *)self runRSSIAdapter:1 RSSI:v4];
  [(DPCRSSIPolicy *)self notifyNewEvent:1];
  v32 = [(DPCBasePolicy *)self telemetry];
  [v32 registerWatchEvent:1 rssiValue:[v4 integerValue]];

  v33 = [(DPCBasePolicy *)self stateMachine];
  [v33 setIsMonitoringAbsence:1];

  unint64_t v7 = 2;
LABEL_25:

  return v7;
}

- (void)onWristStateChange:(int64_t)a3
{
  id v10 = [(DPCBasePolicy *)self stateMachine];
  if ([v10 isRunning])
  {
    v5 = [(DPCBasePolicy *)self stateMachine];
    unsigned __int8 v6 = [v5 isMonitoringAbsence];

    if ((v6 & 1) == 0)
    {
      [(DPCBasePolicy *)self invalidateAbsenceEvent];
      if (a3 == 3)
      {
        unsigned __int8 v9 = sub_100006A24((uint64_t)off_100016CB8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)float v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wrist on while absence, going to send a absence event", v11, 2u);
        }

        [(DPCBasePolicy *)self scheduleSendAbsenceEvent];
      }
      else if (a3 == 2)
      {
        unint64_t v7 = sub_100006A24((uint64_t)off_100016CB8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wrist off while absence, going to send a presence event", buf, 2u);
        }

        [(DPCBasePolicy *)self invalidateAbsenceEvent];
        objc_super v8 = [(DPCBasePolicy *)self detectedNewEventBlock];
        v8[2](v8, 1);
      }
    }
  }
  else
  {
  }
}

- (void)runRSSIAdapter:(unint64_t)a3 RSSI:(id)a4
{
  unsigned __int8 v6 = +[DPCDefaults sharedInstance];
  unint64_t v7 = [v6 NSNumberForDefault:@"DPCDefaultsSessionBasedAdaptiveRSSIEnabled"];
  unsigned int v8 = [v7 BOOLValue];

  if (!v8) {
    return;
  }
  unsigned __int8 v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  if (a3 == 1)
  {
    BOOL v12 = [(DPCBasePolicy *)self stateMachine];
    [v12 lastAbsenceEventTimestamp];
    double v14 = v13;

    float v15 = [(DPCBasePolicy *)self stateMachine];
    [v15 lastAbsenceEventTimestamp];
    if (v16 == 0.0)
    {
LABEL_6:

      goto LABEL_7;
    }
    double v17 = v11 - v14;
    v18 = +[DPCDefaults sharedInstance];
    double v19 = [v18 NSNumberForDefault:@"DPCDefaultsAPWakeToSuppressionBreakEvenDuration"];
    [v19 floatValue];
    float v21 = v20;
    v22 = +[DPCDefaults sharedInstance];
    unsigned __int8 v23 = [v22 NSNumberForDefault:@"DPCDefaultsPowerWinGainTimes"];
    [v23 floatValue];
    double v25 = (float)(v21 * v24);

    if (v17 < v25)
    {
      float v15 = [(DPCBasePolicy *)self stateMachine];
      v26 = +[DPCDefaults sharedInstance];
      v27 = [v26 NSNumberForDefault:@"DPCDefaultsD2FixedStepSize"];
      [v15 setD2ThresholdMargin:[v15 D2ThresholdMargin] + [v27 intValue]];

      goto LABEL_6;
    }
  }
LABEL_7:
  float v28 = +[DPCDefaults sharedInstance];
  float v29 = [v28 NSNumberForDefault:@"DPCDefaultsSessionBasedAdaptiveRSSITwoWaysEnabled"];
  unsigned int v30 = [v29 BOOLValue];

  if (a3 == 2)
  {
    if (v30)
    {
      v31 = [(DPCBasePolicy *)self stateMachine];
      [v31 lastAbsenceEventTimestamp];
      double v33 = v32;

      if (v33 != 0.0)
      {
        v34 = [(DPCBasePolicy *)self stateMachine];
        [v34 lastPresenceEventTimestamp];
        double v36 = v35;

        id v49 = [(DPCBasePolicy *)self stateMachine];
        [v49 lastPresenceEventTimestamp];
        if (v37 != 0.0)
        {
          double v38 = v11 - v36;
          v39 = +[DPCDefaults sharedInstance];
          v40 = [v39 NSNumberForDefault:@"DPCDefaultsAPWakeToSuppressionBreakEvenDuration"];
          [v40 floatValue];
          float v42 = v41;
          v43 = +[DPCDefaults sharedInstance];
          v44 = [v43 NSNumberForDefault:@"DPCDefaultsPowerWinGainTimes"];
          [v44 floatValue];
          double v46 = (float)(v42 * v45);

          if (v38 >= v46) {
            return;
          }
          id v49 = [(DPCBasePolicy *)self stateMachine];
          v47 = +[DPCDefaults sharedInstance];
          v48 = [v47 NSNumberForDefault:@"DPCDefaultsD2FixedStepSize"];
          [v49 setD2ThresholdMargin:[v49 D2ThresholdMargin] + [v48 intValue]];
        }
      }
    }
  }
}

@end