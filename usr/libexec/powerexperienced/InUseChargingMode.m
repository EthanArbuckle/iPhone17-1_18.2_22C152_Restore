@interface InUseChargingMode
+ (id)powerModeInstance;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (InUseChargingMode)init;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)updateChargingPolicy;
@end

@implementation InUseChargingMode

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v37 = [(PowerModeObjImpl *)self state];
  v8 = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "evaluatePowerMode resources %@", buf, 0xCu);
  }

  v9 = [v6 objectForKeyedSubscript:@"Display"];
  id v10 = [v9 state];
  v11 = [v6 objectForKeyedSubscript:@"CarPlay"];

  id v12 = [v11 state];
  v13 = [v6 objectForKeyedSubscript:@"Camera"];

  id v36 = [v13 state];
  v14 = [v6 objectForKeyedSubscript:@"PersonalHotspot"];

  id v15 = [v14 state];
  v16 = [v7 objectForKeyedSubscript:@"kPluggedInContext"];
  unsigned int v17 = [v16 BOOLValue];

  v18 = [v7 objectForKeyedSubscript:@"kLockStateContext"];
  unsigned __int8 v19 = [v18 BOOLValue];

  id v35 = v10;
  char v20 = v19 ^ 1;
  if (v10 != (id)101) {
    char v20 = 0;
  }
  BOOL v21 = 1;
  if ((v20 & 1) == 0 && v12 != (id)1) {
    BOOL v21 = v36 == (id)1 || v15 == (id)1;
  }
  v23 = [v7 objectForKeyedSubscript:@"kBatteryLevelContext"];

  int v24 = [v23 intValue];
  if ((v17 & 1) == 0)
  {
    int v27 = 0;
    if ((v37 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  BOOL v25 = v24 > 19 && v21;
  int v26 = !v25 | v37;
  int v27 = v25 | v26 ^ 1;
  if ((v26 & 1) == 0 && v12 != (id)1)
  {
    v28 = +[ChargeDurationPredictor sharedInstance];
    int v27 = [v28 inTypicalUsageEnvironment];
  }
  if (v37 != v27)
  {
LABEL_23:
    v29 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138413570;
      id v39 = v31;
      __int16 v40 = 1024;
      int v41 = v27;
      __int16 v42 = 1024;
      BOOL v43 = v35 == (id)101;
      __int16 v44 = 1024;
      BOOL v45 = v12 == (id)1;
      __int16 v46 = 1024;
      BOOL v47 = v36 == (id)1;
      __int16 v48 = 1024;
      unsigned int v49 = v17;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlaySession %d cameraActive %d, pluggedIn %d", buf, 0x2Au);
    }
    if (v27)
    {
      LOBYTE(v27) = 1;
    }
    else
    {
      uint64_t v32 = 5;
      if (v24 > 19) {
        uint64_t v32 = 1;
      }
      if (!v21) {
        uint64_t v32 = 2;
      }
      if (v17) {
        uint64_t v33 = v32;
      }
      else {
        uint64_t v33 = 4;
      }
      [(PowerModeObjImpl *)self setExitReason:v33];
      LOBYTE(v27) = 0;
    }
  }
LABEL_35:

  return v27;
}

- (InUseChargingMode)init
{
  if (_os_feature_enabled_impl())
  {
    v8.receiver = self;
    v8.super_class = (Class)InUseChargingMode;
    self = [(InUseChargingMode *)&v8 init];
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "InUseChargingMode");
    [(PowerModeObjImpl *)self setLog:v3];

    [(PowerModeObjImpl *)self setState:0];
    [(PowerModeObjImpl *)self setEnabled:1];
    [(PowerModeObjImpl *)self setEntryDelay:30.0];
    v4 = +[DeviceContext sharedInstance];
    v5 = [v4 objectForKeyedSubscript:@"kPlatformContext"];
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", [v5 isEqual:@"iPhone"]);

    [(PowerModeObjImpl *)self setAppliesChargingPolicy:1];
  }
  id v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BE00 != -1) {
    dispatch_once(&qword_10001BE00, &stru_100014470);
  }
  v2 = (void *)qword_10001BE08;

  return v2;
}

- (void)enterPowerMode
{
  v3.receiver = self;
  v3.super_class = (Class)InUseChargingMode;
  [(PowerModeObjImpl *)&v3 enterPowerMode];
  [(PowerModeObjImpl *)self logStatusToPowerLog];
}

- (void)exitPowerMode
{
  v3.receiver = self;
  v3.super_class = (Class)InUseChargingMode;
  [(PowerModeObjImpl *)&v3 exitPowerMode];
  [(PowerModeObjImpl *)self logStatusToPowerLog];
}

- (void)updateChargingPolicy
{
  id v3 = +[SMCSensorExchangeHelper sharedInstance];
  [v3 updateCLTMChargingPolicy:-[PowerModeObjImpl state](self, "state")];
}

@end