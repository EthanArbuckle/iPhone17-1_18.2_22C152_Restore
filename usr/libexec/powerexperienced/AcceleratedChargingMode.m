@interface AcceleratedChargingMode
+ (id)powerModeInstance;
- (AcceleratedChargingMode)init;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (void)enterPowerMode;
- (void)exitPowerMode;
@end

@implementation AcceleratedChargingMode

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:@"kPluggedInContext"];
  HIDWORD(v36) = [v7 BOOLValue];

  v8 = [v5 objectForKeyedSubscript:@"kBatteryLevelContext"];
  LODWORD(v36) = [v8 intValue];

  v9 = [v5 objectForKeyedSubscript:@"kLockStateContext"];
  unsigned __int8 v10 = [v9 BOOLValue];

  v11 = [v6 objectForKeyedSubscript:@"Display"];
  id v12 = [v11 state];
  v13 = [v6 objectForKeyedSubscript:@"CarPlay"];

  id v14 = [v13 state];
  v15 = [v6 objectForKeyedSubscript:@"AudioPlayback"];

  id v16 = [v15 state];
  v17 = [v6 objectForKeyedSubscript:@"OnenessSession"];

  id v18 = [v17 state];
  v19 = [v6 objectForKeyedSubscript:@"USBDeviceMode"];

  id v20 = [v19 state];
  char v21 = v10 ^ 1;
  if (v12 != (id)101) {
    char v21 = 0;
  }
  int v22 = 1;
  if ((v21 & 1) != 0 || v14 == (id)1)
  {
    v23 = self;
    goto LABEL_18;
  }
  v23 = self;
  if (v16 == (id)1
    || (v18 != (id)1 ? (BOOL v24 = v20 == (id)1) : (BOOL v24 = 1),
        !v24 ? (int v22 = 0) : (int v22 = 1),
        !HIDWORD(v36) || (v22 & 1) != 0 || (int)v36 > 50))
  {
LABEL_18:
    unsigned int v28 = 0;
    LOBYTE(v27) = 0;
    if (![(PowerModeObjImpl *)v23 state]) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  v25 = +[ChargeDurationPredictor sharedInstance];
  v26 = v25;
  if (v25) {
    unsigned int v27 = [v25 shortChargeExpected];
  }
  else {
    unsigned int v27 = 0;
  }

  if (v27 == [(PowerModeObjImpl *)self state]) {
    goto LABEL_35;
  }
  int v22 = 0;
  unsigned int v28 = v27;
LABEL_23:
  v29 = [(PowerModeObjImpl *)v23 log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = [v5 objectForKeyedSubscript:@"kBatteryLevelContext"];
    *(_DWORD *)buf = 138413570;
    v41 = v31;
    __int16 v42 = 1024;
    unsigned int v43 = v28;
    __int16 v44 = 1024;
    BOOL v45 = v12 == (id)101;
    __int16 v46 = 1024;
    BOOL v47 = v14 == (id)1;
    __int16 v48 = 1024;
    int v49 = v38;
    __int16 v50 = 2112;
    v51 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d, batterylevel %@", buf, 0x2Eu);

    v23 = self;
  }

  if (v27)
  {
    LOBYTE(v27) = 1;
  }
  else
  {
    uint64_t v33 = 5;
    if (v37 <= 50) {
      uint64_t v33 = 1;
    }
    if (!v38) {
      uint64_t v33 = 4;
    }
    if (v22) {
      uint64_t v34 = 3;
    }
    else {
      uint64_t v34 = v33;
    }
    [(PowerModeObjImpl *)v23 setExitReason:v34];
    LOBYTE(v27) = 0;
  }
LABEL_35:

  return v27;
}

- (AcceleratedChargingMode)init
{
  if (_os_feature_enabled_impl())
  {
    v8.receiver = self;
    v8.super_class = (Class)AcceleratedChargingMode;
    self = [(AcceleratedChargingMode *)&v8 init];
    os_log_t v3 = os_log_create("com.apple.powerexperience", "AcceleratedChargingMode");
    [(PowerModeObjImpl *)self setLog:v3];

    [(PowerModeObjImpl *)self setState:0];
    [(PowerModeObjImpl *)self setEnabled:1];
    [(PowerModeObjImpl *)self setEntryDelay:120.0];
    [(PowerModeObjImpl *)self setMaxEngagementDuration:1800.0];
    v4 = +[DeviceContext sharedInstance];
    id v5 = [v4 objectForKeyedSubscript:@"kPlatformContext"];
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", [v5 isEqual:@"iPhone"]);

    [(PowerModeObjImpl *)self setAppliesPowerTarget:1];
  }
  id v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BE38 != -1) {
    dispatch_once(&qword_10001BE38, &stru_1000144D0);
  }
  v2 = (void *)qword_10001BE40;

  return v2;
}

- (void)enterPowerMode
{
  if (![(PowerModeObjImpl *)self state])
  {
    v3.receiver = self;
    v3.super_class = (Class)AcceleratedChargingMode;
    [(PowerModeObjImpl *)&v3 enterPowerMode];
    [(PowerModeObjImpl *)self updatePowerTarget];
    [(PowerModeObjImpl *)self logStatusToPowerLog];
  }
}

- (void)exitPowerMode
{
  if ([(PowerModeObjImpl *)self state])
  {
    v3.receiver = self;
    v3.super_class = (Class)AcceleratedChargingMode;
    [(PowerModeObjImpl *)&v3 exitPowerMode];
    [(PowerModeObjImpl *)self logStatusToPowerLog];
  }
}

@end