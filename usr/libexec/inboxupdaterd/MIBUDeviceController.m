@interface MIBUDeviceController
+ (id)sharedInstance;
- (BOOL)_isD5x;
- (BOOL)_isN104;
- (BOOL)isActivated:(id *)a3;
- (BOOL)isIPad;
- (BOOL)isInBoxUpdateMode;
- (BOOL)isInDiagnosticMode;
- (BOOL)isInitialBuddySetupComplete;
- (BOOL)isOnLockScreen;
- (BOOL)removePowerLog;
- (BOOL)setSystemTime:(int64_t)a3;
- (MIBUDeviceController)init;
- (__CFString)batteryLimitToken;
- (id)_batteryVirtualTemperature;
- (id)_dataFromInt32:(unsigned int)a3;
- (id)_dataFromInt8:(unsigned __int8)a3;
- (id)_dictFromSMCKeyMapping:(id)a3;
- (id)_dictFromTmpSensorKeyMapping:(id)a3;
- (id)_smcHelper;
- (id)batteryDetails;
- (id)buildVersion;
- (id)getBatteryLevel;
- (id)osVersion;
- (id)thermalDetails;
- (int64_t)_thermalPressureLevel;
- (void)_writeSMCKey:(id)a3 withData:(id)a4 usingHelper:(id)a5 andReadInterval:(id)a6 andReadbackData:(id)a7 error:(id *)a8;
- (void)disableCarrierMode;
- (void)enableCarrierMode;
- (void)setBatteryLimitToken:(__CFString *)a3;
- (void)setShelfLifeMode;
- (void)shutdown;
@end

@implementation MIBUDeviceController

- (MIBUDeviceController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceController;
  v2 = [(MIBUDeviceController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUDeviceController *)v2 setBatteryLimitToken:0];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_10006C8E8 != -1) {
    dispatch_once(&qword_10006C8E8, &stru_10005AE40);
  }
  v2 = (void *)qword_10006C8E0;

  return v2;
}

- (BOOL)isIPad
{
  return MGGetSInt32Answer() == 3;
}

- (BOOL)isInBoxUpdateMode
{
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 inBoxUpdateMode],
        v3,
        v4))
  {
    objc_super v5 = +[MIBUTestPreferences sharedInstance];
    unsigned int v6 = [v5 inBoxUpdateMode];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AE60);
    }
    v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Overriding InBoxUpdateMode = %d", (uint8_t *)v13, 8u);
    }
  }
  else
  {
    unsigned int v8 = +[MIBUCertHelper SUCertPresent];
    unsigned __int8 v9 = [(MIBUDeviceController *)self isActivated:0];
    if ([(MIBUDeviceController *)self isOnLockScreen]) {
      unsigned int v10 = ![(MIBUDeviceController *)self isInitialBuddySetupComplete];
    }
    else {
      LOBYTE(v10) = 0;
    }
    char v11 = v10 & (v9 ^ 1);
    if (v8) {
      LOBYTE(v6) = v11;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)isInDiagnosticMode
{
  v2 = +[MIBUDefaultPreferences objectForKey:@"CurrentOperation"];
  BOOL v3 = [v2 integerValue] == (id)2;

  return v3;
}

- (BOOL)isActivated:(id *)a3
{
  if (os_variant_has_internal_content())
  {
    unsigned int v4 = +[MIBUTestPreferences sharedInstance];
    objc_super v5 = [v4 isActivated];

    if (v5)
    {
      unsigned int v6 = +[MIBUTestPreferences sharedInstance];
      v7 = [v6 isActivated];
      unsigned int v8 = [v7 BOOLValue];

      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005AE80);
      }
      unsigned __int8 v9 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overrding isActivated = %d", buf, 8u);
      }
      unsigned int v10 = 0;
      id v11 = 0;
      if (!a3) {
        goto LABEL_12;
      }
LABEL_11:
      *a3 = v11;
      goto LABEL_12;
    }
  }
  unsigned int v10 = (void *)MAEGetActivationStateWithError();
  id v11 = 0;
  if (!v11)
  {
    LOBYTE(v8) = [v10 isEqualToString:kMAActivationStateActivated];
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AEA0);
  }
  v13 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003FEB8((uint64_t)v11, v13);
  }
  LOBYTE(v8) = 0;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (BOOL)isInitialBuddySetupComplete
{
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 initialBuddySetupComplete],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    unsigned int v4 = +[MIBUTestPreferences sharedInstance];
    objc_super v5 = [v4 initialBuddySetupComplete];
    byte_10006C8F0 = [v5 BOOLValue];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AEC0);
    }
    unsigned int v6 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = byte_10006C8F0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Overrding InitialBuddySetupComplete = %d", (uint8_t *)v8, 8u);
    }
    return byte_10006C8F0 != 0;
  }
  else
  {
    BOOL result = BYSetupAssistantHasCompletedInitialRun();
    byte_10006C8F0 = result;
  }
  return result;
}

- (BOOL)isOnLockScreen
{
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 isOnLockScreen],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_super v5 = +[MIBUTestPreferences sharedInstance];
    unsigned int v6 = [v5 isOnLockScreen];
    unsigned int v7 = [v6 BOOLValue];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AEE0);
    }
    unsigned int v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Overrding OnLockScreen = %d", buf, 8u);
    }
  }
  else if ([(MIBUDeviceController *)self isInDiagnosticMode])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AF00);
    }
    unsigned __int8 v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Diagnostic mode detected. Skipping lock screen check", buf, 2u);
    }
    LOBYTE(v7) = 1;
  }
  else
  {
    SBSSpringBoardBlockableServerPort();
    SBGetScreenLockStatus();
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)setSystemTime:(int64_t)a3
{
  *(void *)&v6.tv_usec = 0;
  time_t v7 = 0;
  v6.tv_sec = a3;
  time(&v7);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AF20);
  }
  unsigned int v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    time_t v9 = v7;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current system time is %lu; setting system time to %lu",
      buf,
      0x16u);
  }
  return settimeofday(&v6, 0) == 0;
}

- (BOOL)removePowerLog
{
  uint64_t v22 = 1;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AF40);
  }
  v2 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing power log from device ...", buf, 2u);
  }
  BOOL v3 = +[NSString stringWithUTF8String:container_system_group_path_for_identifier()];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned int v4 = +[NSFileManager defaultManager];
  objc_super v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      __int16 v10 = 0;
      int64_t v11 = v8;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v12 = [v3 stringByAppendingPathComponent:*(void *)(*((void *)&v18 + 1) + 8 * (void)v10)];
        v13 = +[NSFileManager defaultManager];
        id v17 = v11;
        unsigned int v14 = [v13 removeItemAtPath:v12 error:&v17];
        id v8 = v17;

        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005AF80);
        }
        unsigned int v15 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v24 = v12;
          __int16 v25 = 1024;
          unsigned int v26 = v14;
          __int16 v27 = 2114;
          id v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Power log: %{public}@ removed: %{BOOL}d with error: %{public}@", buf, 0x1Cu);
        }

        __int16 v10 = (char *)v10 + 1;
        int64_t v11 = v8;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v7);
  }
  return 1;
}

- (id)getBatteryLevel
{
  if (IOPSGetPercentRemaining())
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AFA0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FF30();
    }
    double v2 = -1.0;
  }
  else
  {
    double v2 = (double)100;
  }
  BOOL v3 = +[NSNumber numberWithDouble:v2];

  return v3;
}

- (void)setShelfLifeMode
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AFC0);
  }
  BOOL v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting Device to Shelf Life Mode ...", buf, 2u);
  }
  unsigned int v4 = [(MIBUDeviceController *)self _smcHelper];
  if (v4)
  {
    if ([(MIBUDeviceController *)self _isD5x])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B000);
      }
      id v8 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v9 = (uint8_t *)&v12;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not enabling SLM; hardware supports older variant",
          v9,
          2u);
      }
    }
    else
    {
      if (![(MIBUDeviceController *)self _isN104])
      {
        objc_super v5 = [(MIBUDeviceController *)self _dataFromInt8:1];
        id v6 = [(MIBUDeviceController *)self _dataFromInt8:2];
        id v10 = 0;
        [(MIBUDeviceController *)self _writeSMCKey:@"BCSL" withData:v5 usingHelper:v4 andReadInterval:0 andReadbackData:v6 error:&v10];
        id v7 = v10;

        goto LABEL_9;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B020);
      }
      id v8 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v11 = 0;
        uint64_t v9 = v11;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AFE0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FF98();
    }
  }
LABEL_9:
}

- (void)enableCarrierMode
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B040);
  }
  BOOL v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Limiting battery charge levels...", buf, 2u);
  }
  if (IOPSLimitBatteryLevelRegister())
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B060);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040034();
    }
  }
  else
  {
    [(MIBUDeviceController *)self setBatteryLimitToken:0];
    if (IOPSLimitBatteryLevel())
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B080);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003FFCC();
      }
    }
  }
}

- (void)disableCarrierMode
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B0A0);
  }
  BOOL v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling Battery charge levels ...", v4, 2u);
  }
  if ([(MIBUDeviceController *)self batteryLimitToken])
  {
    [(MIBUDeviceController *)self batteryLimitToken];
    if (IOPSLimitBatteryLevelCancel())
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B0C0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000400D0();
      }
    }
    else
    {
      [(MIBUDeviceController *)self setBatteryLimitToken:0];
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B0E0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004009C();
    }
  }
}

- (void)shutdown
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B100);
  }
  double v2 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down...", v5, 2u);
  }
  BOOL v3 = +[FBSSystemService sharedService];
  id v4 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"Shutting down device from inboxupdaterd."];
  [v3 shutdownWithOptions:v4];
}

- (id)thermalDetails
{
  BOOL v3 = objc_opt_new();
  int64_t v4 = [(MIBUDeviceController *)self _thermalPressureLevel];
  objc_super v5 = [(MIBUDeviceController *)self _batteryVirtualTemperature];
  if ([(MIBUDeviceController *)self _isD5x] || [(MIBUDeviceController *)self _isN104])
  {
    v11[0] = @"TSRM/TVRM";
    v11[1] = @"TSRR/TVRR";
    v12[0] = &off_100060378;
    v12[1] = &off_100060390;
    uint8_t v11[2] = @"TSBE/TVBE";
    v11[3] = @"TSBQ/TVBQ";
    v12[2] = &off_1000603A8;
    v12[3] = &off_1000603C0;
    v11[4] = @"TSBR/TVBR";
    v11[5] = @"TSLR/TVRH";
    v12[4] = &off_1000603D8;
    v12[5] = &off_1000603F0;
    id v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
    uint64_t v7 = [(MIBUDeviceController *)self _dictFromTmpSensorKeyMapping:v6];
  }
  else
  {
    v13[0] = @"TSRM/TVRM";
    v13[1] = @"TSRR/TVRR";
    v14[0] = @"TVRM";
    v14[1] = @"TVRR";
    _DWORD v13[2] = @"TVRQ";
    v13[3] = @"TSBE/TVBE";
    v14[2] = @"TVRQ";
    v14[3] = @"TVBE";
    v13[4] = @"TSBQ/TVBQ";
    v13[5] = @"TSBR/TVBR";
    v14[4] = @"TVBQ";
    v14[5] = @"TVBR";
    v13[6] = @"TSLR/TVRH";
    v13[7] = @"TG0V";
    v14[6] = @"TVRH";
    v14[7] = @"TG0V";
    id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];
    uint64_t v7 = [(MIBUDeviceController *)self _dictFromSMCKeyMapping:v6];
  }
  id v8 = (void *)v7;

  if (v5) {
    [v8 setObject:v5 forKey:@"TG0V"];
  }
  if (v8)
  {
    uint64_t v9 = +[NSNumber numberWithInteger:v4];
    [v8 setObject:v9 forKey:@"ThermalPressure"];
  }

  return v8;
}

- (id)batteryDetails
{
  v6[0] = @"WARP";
  v6[1] = @"WAVR";
  v7[0] = @"WARP";
  v7[1] = @"WAVR";
  BOOL v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  int64_t v4 = [(MIBUDeviceController *)self _dictFromSMCKeyMapping:v3];

  return v4;
}

- (id)osVersion
{
  double v2 = (void *)_CFCopySupplementalVersionDictionary();
  BOOL v3 = [v2 objectForKey:_kCFSystemVersionShortVersionStringKey];

  return v3;
}

- (id)buildVersion
{
  double v2 = (void *)_CFCopySupplementalVersionDictionary();
  BOOL v3 = [v2 objectForKey:_kCFSystemVersionBuildVersionKey];

  return v3;
}

- (id)_smcHelper
{
  double v2 = self;
  objc_sync_enter(v2);
  if (!qword_10006C8F8)
  {
    BOOL v3 = objc_alloc_init(MIBUSMCHelper);
    int64_t v4 = (void *)qword_10006C8F8;
    qword_10006C8F8 = (uint64_t)v3;

    id v10 = 0;
    [(id)qword_10006C8F8 openAppleSMC:&v10];
    id v5 = v10;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B120);
    }
    id v6 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SMC Helper opened with error: %{public}@", buf, 0xCu);
    }
    if (v5)
    {
      uint64_t v7 = (void *)qword_10006C8F8;
      qword_10006C8F8 = 0;
    }
  }
  objc_sync_exit(v2);

  id v8 = (void *)qword_10006C8F8;

  return v8;
}

- (BOOL)_isD5x
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 3885279869)
  {
    if (v3 == 3885279870) {
      return v2;
    }
    uint64_t v4 = 4201643249;
  }
  else
  {
    if (v3 == 1169082144) {
      return v2;
    }
    uint64_t v4 = 3001488778;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (BOOL)_isN104
{
  return MGGetProductType() == 2080700391;
}

- (id)_dataFromInt32:(unsigned int)a3
{
  unsigned int v5 = a3;
  uint64_t v3 = +[NSData dataWithBytes:&v5 length:4];

  return v3;
}

- (id)_dataFromInt8:(unsigned __int8)a3
{
  unsigned __int8 v5 = a3;
  uint64_t v3 = +[NSData dataWithBytes:&v5 length:1];

  return v3;
}

- (void)_writeSMCKey:(id)a3 withData:(id)a4 usingHelper:(id)a5 andReadInterval:(id)a6 andReadbackData:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v15 isKeySupported:v13])
  {
    id v42 = 0;
    long long v18 = [v15 readSMCKey:v13 error:&v42];
    id v19 = v42;
    id v20 = v19;
    if (v18 && !v19)
    {
      int v21 = 1;
      while (1)
      {

        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005B160);
        }
        uint64_t v22 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v44 = v14;
          __int16 v45 = 2114;
          id v46 = v13;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Writing %{public}@ to SMC key %{public}@", buf, 0x16u);
        }
        id v41 = 0;
        [v15 writeSMCKey:v13 data:v14 error:&v41];
        id v23 = v41;
        if (v23)
        {
          id v20 = v23;
          int v28 = v21;
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B180);
          }
          v35 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v44 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to write to SMC key %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (!v17)
          {
            id v20 = 0;
            goto LABEL_45;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B1A0);
          }
          v24 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reading back SMC key value to verify...", buf, 2u);
          }
          if (v16)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005B1C0);
            }
            __int16 v25 = (void *)qword_10006C950;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v26 = v25;
              unsigned int v27 = [v16 unsignedIntValue];
              *(_DWORD *)buf = 67109120;
              LODWORD(v44) = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Waiting for %ds before reading back the value to verify...", buf, 8u);
            }
            sleep([v16 unsignedIntValue]);
          }
          int v28 = v21;
          id v40 = 0;
          v29 = [v15 readSMCKey:v13 error:&v40];
          id v20 = v40;

          if (!v29 || v20)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005B1E0);
            }
            v36 = qword_10006C950;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v44 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to write to SMC key %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if ([v29 isEqualToData:v17])
            {
              id v20 = 0;
              long long v18 = v29;
              goto LABEL_45;
            }
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005B200);
            }
            v30 = qword_10006C950;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              id v44 = v13;
              __int16 v45 = 2114;
              id v46 = v29;
              __int16 v47 = 2114;
              v48[0] = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SMC key %{public}@ : %{public}@ does not have expected val: %{public}@", buf, 0x20u);
            }
            id v39 = 0;
            sub_1000102B8(&v39, 2684354564, 0, @"SMC key %@ : %@ does not have expected val: %@", v31, v32, v33, v34, (uint64_t)v13);
            id v20 = v39;
          }
          long long v18 = v29;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005B220);
        }
        v37 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          id v44 = v13;
          __int16 v45 = 2114;
          id v46 = v20;
          __int16 v47 = 1024;
          LODWORD(v48[0]) = v28;
          WORD2(v48[0]) = 1024;
          *(_DWORD *)((char *)v48 + 6) = 3;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to write SMC key %{public}@ with error: %{public}@, attempt %d/%d; retrying...",
            buf,
            0x22u);
        }
        int v21 = v28 + 1;
        if (v28 == 3) {
          goto LABEL_45;
        }
      }
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B140);
    }
    v38 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040138((uint64_t)v13, (uint64_t)v20, v38);
    }
  }
  else
  {
    id v20 = 0;
    long long v18 = 0;
  }
LABEL_45:
  if (a8) {
    *a8 = v20;
  }
}

- (int64_t)_thermalPressureLevel
{
  int out_token = 0;
  uint64_t v3 = 0;
  if (notify_register_check(kOSThermalNotificationPressureLevelName, &out_token))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B240);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040290();
    }
  }
  else if (notify_get_state(out_token, &v3))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B260);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040228();
    }
  }
  else
  {
    if (!notify_cancel(out_token)) {
      return v3;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B280);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000401C0();
    }
  }
  return -1;
}

- (id)_batteryVirtualTemperature
{
  BOOL v2 = [(MIBUDeviceController *)self _smcHelper];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 readSMCKey:@"TG0V" error:0];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B2A0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FF98();
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_dictFromSMCKeyMapping:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_opt_new();
  id v6 = [(MIBUDeviceController *)self _smcHelper];
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v17 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [v7 objectForKey:v12, v17];
          if ([v6 isKeySupported:v13])
          {
            id v18 = 0;
            id v14 = [v6 readSMCKey:v13 error:&v18];
            id v15 = v18;
            if (v14) {
              [v5 setObject:v14 forKey:v12];
            }
          }
          else
          {
            id v14 = 0;
            id v15 = 0;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v4 = v17;
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B2C0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FF98();
    }
  }

  return v5;
}

- (id)_dictFromTmpSensorKeyMapping:(id)a3
{
  id v3 = a3;
  id v18 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        id v11 = [v10 unsignedIntValue];

        id v20 = 0;
        uint64_t v12 = +[MIBUTempSensorHelper readKey:v11 error:&v20];
        id v13 = v20;
        if (v12)
        {
          int v19 = 0;
          [v12 floatValue];
          int v19 = v14;
          uint64_t v15 = +[NSData dataWithBytes:&v19 length:4];
          if (v15)
          {
            id v16 = (void *)v15;
            [v18 setObject:v15 forKey:v9];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return v18;
}

- (__CFString)batteryLimitToken
{
  return self->_batteryLimitToken;
}

- (void)setBatteryLimitToken:(__CFString *)a3
{
  self->_batteryLimitToken = a3;
}

@end