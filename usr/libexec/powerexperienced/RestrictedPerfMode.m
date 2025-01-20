@interface RestrictedPerfMode
+ (id)powerModeInstance;
- (BOOL)allowOnCharger;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (CLPCPolicyAccess)clpcClient;
- (RestrictedPerfMode)init;
- (unint64_t)clientResponsible;
- (void)allowOnCharger:(BOOL)a3;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)logStatusToPowerLog;
- (void)restoreState:(id)a3;
- (void)setAllowOnCharger:(BOOL)a3;
- (void)setClientResponsible:(unint64_t)a3;
- (void)setClpcClient:(id)a3;
@end

@implementation RestrictedPerfMode

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PowerModeObjImpl *)self supportedPlatform])
  {
    v19 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v29 = "Platform not supported";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v29, buf, 2u);
    }
LABEL_30:
    LOBYTE(v22) = 0;
    goto LABEL_31;
  }
  if (![(PowerModeObjImpl *)self enabled])
  {
    v19 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v29 = "Restriced Perf Mode is disabled";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v8 = [v6 objectForKeyedSubscript:@"Display"];
  id v39 = [v8 state];
  [v8 state];
  v9 = [v6 objectForKeyedSubscript:@"CarPlay"];

  id v36 = [v9 state];
  v10 = [v6 objectForKeyedSubscript:@"NFCSession"];

  id v40 = [v10 state];
  v11 = [v6 objectForKeyedSubscript:@"AudioPlayback"];

  id v12 = [v11 state];
  v13 = [v6 objectForKeyedSubscript:@"SleepInProgress"];

  id v14 = [v13 state];
  v15 = [v6 objectForKeyedSubscript:@"WakeInProgress"];

  id v16 = [v15 state];
  v17 = [v6 objectForKeyedSubscript:@"OnenessSession"];

  id v18 = [v17 state];
  v19 = [v6 objectForKeyedSubscript:@"SiriAudio"];

  id v20 = [v19 state];
  v21 = [v7 objectForKeyedSubscript:@"kPluggedInContext"];
  unsigned int v35 = [v21 BOOLValue];

  int v22 = 0;
  id v38 = v16;
  if (v16 != (id)1 && v14 != (id)1)
  {
    BOOL v28 = v39 == (id)101 || v36 == (id)1 || v40 == (id)1 || v12 == (id)1 || v18 == (id)1 || v20 == (id)1;
    if ([(RestrictedPerfMode *)self allowOnCharger]) {
      int v22 = !v28;
    }
    else {
      int v22 = (v35 | v28) ^ 1;
    }
  }
  log = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    *(_DWORD *)buf = 138415106;
    unint64_t v42 = (unint64_t)v32;
    __int16 v43 = 1024;
    int v44 = v22;
    __int16 v45 = 1024;
    BOOL v46 = v39 == (id)101;
    __int16 v47 = 1024;
    BOOL v48 = v36 == (id)1;
    __int16 v49 = 1024;
    BOOL v50 = v40 == (id)1;
    __int16 v51 = 1024;
    BOOL v52 = v12 == (id)1;
    __int16 v53 = 1024;
    BOOL v54 = v14 == (id)1;
    __int16 v55 = 1024;
    BOOL v56 = v38 == (id)1;
    __int16 v57 = 1024;
    BOOL v58 = v18 == (id)1;
    __int16 v59 = 1024;
    BOOL v60 = v20 == (id)1;
    __int16 v61 = 1024;
    unsigned int v62 = v35;
    __int16 v63 = 1024;
    unsigned int v64 = [(RestrictedPerfMode *)self allowOnCharger];
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlaySession %d, nFCSession %d, audioSession %d, sleepInProgress %d, wakeInProgress %d, onenessSession %d, siriAudio %d, pluggedIn %d (allowOnCharger: %d)", buf, 0x4Eu);
  }
  [(RestrictedPerfMode *)self setClientResponsible:((4 * (v39 == (id)101)) | (8 * (v36 == (id)1)) | (16 * (v40 == (id)1)) | (32 * (v12 == (id)1)) | (v14 == (id)1) | (2 * (v38 == (id)1)) | ((unint64_t)(v18 == (id)1) << 7))+ ((unint64_t)(v20 == (id)1) << 10)];
  if ((v22 & 1) == 0 && [(PowerModeObjImpl *)self state])
  {
    v33 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v34 = [(RestrictedPerfMode *)self clientResponsible];
      *(_DWORD *)buf = 134217984;
      unint64_t v42 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Client responsible %llu", buf, 0xCu);
    }

    [(PowerModeObjImpl *)self setExitReason:3];
  }
LABEL_31:

  return v22;
}

- (BOOL)allowOnCharger
{
  return self->_allowOnCharger;
}

- (void)setClientResponsible:(unint64_t)a3
{
  self->_clientResponsible = a3;
}

- (RestrictedPerfMode)init
{
  v15.receiver = self;
  v15.super_class = (Class)RestrictedPerfMode;
  v2 = [(RestrictedPerfMode *)&v15 init];
  os_log_t v3 = os_log_create("com.apple.powerexperienced", "RestrictedPerfMode");
  [(PowerModeObjImpl *)v2 setLog:v3];

  [(PowerModeObjImpl *)v2 setState:0];
  [(PowerModeObjImpl *)v2 setEnabled:1];
  [(PowerModeObjImpl *)v2 setEntryDelay:3.0];
  byte_10001BE20 = _os_feature_enabled_impl();
  v4 = +[DeviceContext sharedInstance];
  v5 = [v4 objectForKeyedSubscript:@"kPlatformContext"];
  if ([v5 isEqual:@"iPhone"])
  {
    [(PowerModeObjImpl *)v2 setSupportedPlatform:1];
  }
  else
  {
    id v6 = +[DeviceContext sharedInstance];
    id v7 = [v6 objectForKeyedSubscript:@"kPlatformContext"];
    -[PowerModeObjImpl setSupportedPlatform:](v2, "setSupportedPlatform:", [v7 isEqual:@"Watch"]);
  }
  [(RestrictedPerfMode *)v2 setAllowOnCharger:0];
  if (![(PowerModeObjImpl *)v2 supportedPlatform])
  {
    v9 = [(PowerModeObjImpl *)v2 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restricted perf mode not supported on this platform", buf, 2u);
    }
    goto LABEL_15;
  }
  [(PowerModeObjImpl *)v2 setAppliesPowerTarget:1];
  if (byte_10001BE20 && (MGGetBoolAnswer() & 1) == 0)
  {
    id v13 = 0;
    v8 = +[CLPCPolicyInterface createClient:&v13];
    v9 = v13;
    [(RestrictedPerfMode *)v2 setClpcClient:v8];

    v10 = [(PowerModeObjImpl *)v2 log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initialized CLPC Policy Interface", buf, 2u);
    }

    if (v9)
    {
      v11 = [(PowerModeObjImpl *)v2 log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000CC08((uint64_t)v9, v11);
      }

LABEL_15:
    }
  }
  return v2;
}

+ (id)powerModeInstance
{
  if (qword_10001BE28 != -1) {
    dispatch_once(&qword_10001BE28, &stru_1000144B0);
  }
  v2 = (void *)qword_10001BE30;

  return v2;
}

- (void)restoreState:(id)a3
{
  [(PowerModeObjImpl *)self setState:0];

  [(PowerModeObjImpl *)self updatePowerTarget];
}

- (void)enterPowerMode
{
  if (![(PowerModeObjImpl *)self state])
  {
    v5.receiver = self;
    v5.super_class = (Class)RestrictedPerfMode;
    [(PowerModeObjImpl *)&v5 enterPowerMode];
    os_log_t v3 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [(PowerModeObjImpl *)self state];
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering restricted perf mode. New state %d", buf, 8u);
    }

    [(RestrictedPerfMode *)self logStatusToPowerLog];
  }
}

- (void)exitPowerMode
{
  if ([(PowerModeObjImpl *)self state])
  {
    v5.receiver = self;
    v5.super_class = (Class)RestrictedPerfMode;
    [(PowerModeObjImpl *)&v5 exitPowerMode];
    os_log_t v3 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [(PowerModeObjImpl *)self state];
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting restricted perf mode. New state %d", buf, 8u);
    }

    [(RestrictedPerfMode *)self logStatusToPowerLog];
  }
}

- (void)allowOnCharger:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PowerModeObjImpl *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting allowOnCharger: %d", (uint8_t *)v6, 8u);
  }

  [(RestrictedPerfMode *)self setAllowOnCharger:v3];
}

- (void)logStatusToPowerLog
{
  if (![(PowerModeObjImpl *)self powerlogIdentifier]) {
    [(PowerModeObjImpl *)self setPowerlogIdentifier:PPSCreateTelemetryIdentifier()];
  }
  if ([(PowerModeObjImpl *)self powerlogIdentifier])
  {
    v9[0] = @"status";
    BOOL v3 = +[NSNumber numberWithBool:[(PowerModeObjImpl *)self state]];
    v9[1] = @"client";
    v10[0] = v3;
    unsigned int v4 = +[NSNumber numberWithUnsignedLongLong:[(RestrictedPerfMode *)self clientResponsible]];
    v10[1] = v4;
    objc_super v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

    [(PowerModeObjImpl *)self powerlogIdentifier];
    PPSSendTelemetry();
    id v6 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Logging to powerlog %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    objc_super v5 = [(PowerModeObjImpl *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000CC80(v5);
    }
  }
}

- (CLPCPolicyAccess)clpcClient
{
  return (CLPCPolicyAccess *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClpcClient:(id)a3
{
}

- (void)setAllowOnCharger:(BOOL)a3
{
  self->_allowOnCharger = a3;
}

- (unint64_t)clientResponsible
{
  return self->_clientResponsible;
}

- (void).cxx_destruct
{
}

@end