@interface LongChargingMode
+ (id)powerModeInstance;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (LongChargingMode)init;
- (void)enterPowerMode;
- (void)exitPowerMode;
@end

@implementation LongChargingMode

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 objectForKeyedSubscript:@"kPluggedInContext"];
  unsigned int v9 = [v8 BOOLValue];

  v10 = [v7 objectForKeyedSubscript:@"Display"];
  id v11 = [v10 state];
  v12 = [v6 objectForKeyedSubscript:@"kLockStateContext"];

  unsigned __int8 v13 = [v12 BOOLValue];
  v14 = [v7 objectForKeyedSubscript:@"CarPlay"];

  id v15 = [v14 state];
  v16 = [v7 objectForKeyedSubscript:@"AudioPlayback"];

  id v17 = [v16 state];
  v18 = [v7 objectForKeyedSubscript:@"OnenessSession"];

  id v19 = [v18 state];
  v20 = [v7 objectForKeyedSubscript:@"USBDeviceMode"];

  id v21 = [v20 state];
  char v22 = v13 ^ 1;
  if (v11 != (id)101) {
    char v22 = 0;
  }
  int v23 = 1;
  if ((v22 & 1) != 0
    || v15 == (id)1
    || v17 == (id)1
    || (v19 != (id)1 ? (v24 = v21 == (id)1) : (v24 = 1), !v24 ? (int v23 = 0) : (int v23 = 1), !v9 || (v23 & 1) != 0))
  {
    unsigned int v28 = 0;
    LOBYTE(v27) = 0;
    if (![(PowerModeObjImpl *)self state]) {
      goto LABEL_31;
    }
  }
  else
  {
    v25 = +[ChargeDurationPredictor sharedInstance];
    v26 = v25;
    if (v25) {
      unsigned int v27 = [v25 longChargeExpected];
    }
    else {
      unsigned int v27 = 0;
    }

    if (v27 == [(PowerModeObjImpl *)self state]) {
      goto LABEL_31;
    }
    int v23 = 0;
    unsigned int v28 = v27;
  }
  v29 = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v30 = v11 == (id)101;
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    int v36 = 138413314;
    v37 = v32;
    __int16 v38 = 1024;
    unsigned int v39 = v28;
    __int16 v40 = 1024;
    BOOL v41 = v30;
    __int16 v42 = 1024;
    BOOL v43 = v15 == (id)1;
    __int16 v44 = 1024;
    unsigned int v45 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d", (uint8_t *)&v36, 0x24u);
  }
  if (v27)
  {
    LOBYTE(v27) = 1;
  }
  else
  {
    uint64_t v33 = 4;
    if (v9) {
      uint64_t v33 = 1;
    }
    if (v23) {
      uint64_t v34 = 3;
    }
    else {
      uint64_t v34 = v33;
    }
    [(PowerModeObjImpl *)self setExitReason:v34];
    LOBYTE(v27) = 0;
  }
LABEL_31:

  return v27;
}

- (LongChargingMode)init
{
  if (_os_feature_enabled_impl())
  {
    v8.receiver = self;
    v8.super_class = (Class)LongChargingMode;
    self = [(LongChargingMode *)&v8 init];
    os_log_t v3 = os_log_create("com.apple.powerexperience", "LongChargingMode");
    [(PowerModeObjImpl *)self setLog:v3];

    [(PowerModeObjImpl *)self setState:0];
    [(PowerModeObjImpl *)self setEnabled:1];
    v4 = +[DeviceContext sharedInstance];
    v5 = [v4 objectForKeyedSubscript:@"kPlatformContext"];
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", [v5 isEqual:@"iPhone"]);

    [(PowerModeObjImpl *)self setAppliesPowerTarget:1];
    [(PowerModeObjImpl *)self setMaxEngagementDuration:21600.0];
  }
  id v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BE10 != -1) {
    dispatch_once(&qword_10001BE10, &stru_100014490);
  }
  v2 = (void *)qword_10001BE18;

  return v2;
}

- (void)enterPowerMode
{
  if (![(PowerModeObjImpl *)self state])
  {
    v3.receiver = self;
    v3.super_class = (Class)LongChargingMode;
    [(PowerModeObjImpl *)&v3 enterPowerMode];
    [(PowerModeObjImpl *)self logStatusToPowerLog];
  }
}

- (void)exitPowerMode
{
  if ([(PowerModeObjImpl *)self state])
  {
    v3.receiver = self;
    v3.super_class = (Class)LongChargingMode;
    [(PowerModeObjImpl *)&v3 exitPowerMode];
    [(PowerModeObjImpl *)self logStatusToPowerLog];
  }
}

@end