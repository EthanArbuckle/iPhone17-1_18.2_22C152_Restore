@interface SystemConfig
+ (BOOL)isString:(id)a3 equalToCaseInsensitiveString:(id)a4;
+ (id)sharedInstance;
- ($ECBB963D1F6757AE96FAF80058EC9690)batteryStats;
- (BOOL)_BOOLGestaltQueryForKey:(__CFString *)a3;
- (BOOL)canRegisterWithIDSID;
- (BOOL)deviceNameUpToDate;
- (BOOL)forceTouchAvailable;
- (BOOL)hasCellularCapability;
- (BOOL)isBuddyDone;
- (BOOL)isFMFAppRemoved;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isRegionMonitoringAvailable;
- (BOOL)telephonyAvailable;
- (NSNumber)_currentLocationServicesState;
- (NSString)buildVersion;
- (NSString)cellularPlanStatusString;
- (NSString)connectionStatusString;
- (NSString)deviceClassString;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)deviceName;
- (NSString)deviceUDID;
- (NSString)idsDeviceID;
- (NSString)locale;
- (NSString)platform;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (NSString)timezone;
- (NSString)wristStatusString;
- (PreferencesMgr)preferencesMgr;
- (id)_stringGestaltQueryForKey:(__CFString *)a3;
- (id)initSingleton;
- (int)processIdentifier;
- (unint64_t)unlockState;
- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4;
- (void)dealloc;
- (void)deviceNameMayNeedUpdate;
- (void)localeMayNeedUpdate;
- (void)setDeviceNameUpToDate:(BOOL)a3;
- (void)setPreferencesMgr:(id)a3;
- (void)set_currentLocationServicesState:(id)a3;
- (void)updateLocationState;
@end

@implementation SystemConfig

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"DeviceNameMayHaveChangedNotification" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"DeviceLocaleMayHaveChangedNotification" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"LocationServicesStateChangedNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"FMFLocationServicesStateChangedNotification" object:0];

  v7.receiver = self;
  v7.super_class = (Class)SystemConfig;
  [(SystemConfig *)&v7 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10006D478 != -1) {
    dispatch_once(&qword_10006D478, &stru_100059D40);
  }
  v2 = (void *)qword_10006D470;

  return v2;
}

- (id)initSingleton
{
  v10.receiver = self;
  v10.super_class = (Class)SystemConfig;
  v2 = [(SystemConfig *)&v10 init];
  if (v2)
  {
    v3 = +[PreferencesMgr sharedInstance];
    [(SystemConfig *)v2 setPreferencesMgr:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"deviceNameMayNeedUpdate" name:@"DeviceNameMayHaveChangedNotification" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"localeMayNeedUpdate" name:@"DeviceLocaleMayHaveChangedNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"updateLocationState" name:@"LocationServicesStateChangedNotification" object:0];

    objc_super v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"updateLocationState" name:@"FMFLocationServicesStateChangedNotification" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001A1A0, @"com.apple.system.timezone", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)updateLocationState
{
}

- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4
{
  v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003812C((uint64_t)a4, a3, v6);
  }
}

- (id)_stringGestaltQueryForKey:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswerWithError();

  return v3;
}

- (BOOL)_BOOLGestaltQueryForKey:(__CFString *)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (!v3) {
    return 0;
  }
  CFBooleanRef v4 = v3;
  BOOL v5 = CFBooleanGetValue(v3) != 0;
  CFRelease(v4);
  return v5;
}

- (NSString)deviceName
{
  if (qword_10006D490 != -1) {
    dispatch_once(&qword_10006D490, &stru_100059D60);
  }
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A464;
  objc_super v10 = sub_10001A474;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A47C;
  v5[3] = &unk_100059D88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_10006D488, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)deviceNameMayNeedUpdate
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device name may need update", buf, 2u);
  }

  CFBooleanRef v4 = [(SystemConfig *)self deviceName];
  [(SystemConfig *)self setDeviceNameUpToDate:0];
  uint64_t v5 = [(SystemConfig *)self deviceName];
  uint64_t v6 = (void *)v5;
  if (!v4 && v5 || v4 && !v5 || ([v4 isEqualToString:v5] & 1) == 0)
  {
    objc_super v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Post notification for device name need update", v9, 2u);
    }

    uint64_t v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"DeviceNameChangedNotification" object:0];
  }
}

- (NSString)deviceClassString
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A6EC;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4A0 != -1) {
    dispatch_once(&qword_10006D4A0, block);
  }
  return (NSString *)(id)qword_10006D498;
}

- (NSString)deviceUDID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A858;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4B0 != -1) {
    dispatch_once(&qword_10006D4B0, block);
  }
  v2 = +[FMSystemInfo sharedInstance];
  if (![v2 isInternalBuild]) {
    goto LABEL_9;
  }
  unsigned int v3 = +[FMPreferencesUtil BOOLForKey:@"GainsboroughSimulationPhone" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];

  if (v3)
  {
    v2 = +[FMPreferencesUtil stringForKey:@"GainsboroughPhoneUDID" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
    if (v2) {
      CFBooleanRef v4 = v2;
    }
    else {
      CFBooleanRef v4 = (void *)qword_10006D4A8;
    }
    objc_storeStrong((id *)&qword_10006D4A8, v4);
LABEL_9:
  }
  return (NSString *)(id)qword_10006D4A8;
}

- (NSString)idsDeviceID
{
  v2 = (void *)qword_10006D4B8;
  if (!qword_10006D4B8)
  {
    uint64_t v3 = IDSCopyLocalDeviceUniqueID();
    CFBooleanRef v4 = (void *)qword_10006D4B8;
    qword_10006D4B8 = v3;

    v2 = (void *)qword_10006D4B8;
    if (!qword_10006D4B8)
    {
      uint64_t v5 = sub_10001B6D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000381B4(v5);
      }

      v2 = (void *)qword_10006D4B8;
    }
  }

  return (NSString *)v2;
}

- (NSString)productType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A9AC;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4C8 != -1) {
    dispatch_once(&qword_10006D4C8, block);
  }
  return (NSString *)(id)qword_10006D4C0;
}

- (NSString)productName
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA84;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4D8 != -1) {
    dispatch_once(&qword_10006D4D8, block);
  }
  return (NSString *)(id)qword_10006D4D0;
}

- (NSString)productVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AB5C;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4E8 != -1) {
    dispatch_once(&qword_10006D4E8, block);
  }
  return (NSString *)(id)qword_10006D4E0;
}

- (NSString)buildVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AC70;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D4F8 != -1) {
    dispatch_once(&qword_10006D4F8, block);
  }
  return (NSString *)(id)qword_10006D4F0;
}

- (NSString)platform
{
  return (NSString *)@"iphoneos";
}

- (BOOL)isBuddyDone
{
  return BYSetupAssistantNeedsToRun() ^ 1;
}

- (NSString)deviceColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ADAC;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D508 != -1) {
    dispatch_once(&qword_10006D508, block);
  }
  return (NSString *)(id)qword_10006D500;
}

- (NSString)deviceEnclosureColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AE84;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D518 != -1) {
    dispatch_once(&qword_10006D518, block);
  }
  return (NSString *)(id)qword_10006D510;
}

- (NSString)serialNumber
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF5C;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D528 != -1) {
    dispatch_once(&qword_10006D528, block);
  }
  return (NSString *)(id)qword_10006D520;
}

- (NSString)timezone
{
  v2 = +[NSTimeZone systemTimeZone];
  uint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)locale
{
  v2 = (void *)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesCurrentApplication);

  return (NSString *)v2;
}

- (void)localeMayNeedUpdate
{
  CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"LocaleChangedNotification" object:0];
}

- (BOOL)isLocationServicesEnabled
{
  uint64_t v3 = [(SystemConfig *)self _currentLocationServicesState];

  if (!v3)
  {
    CFBooleanRef v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CLLocationManager locationServicesEnabled]);
    [(SystemConfig *)self set_currentLocationServicesState:v4];
  }
  uint64_t v5 = [(SystemConfig *)self _currentLocationServicesState];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isRegionMonitoringAvailable
{
  uint64_t v2 = objc_opt_class();

  return +[CLLocationManager isMonitoringAvailableForClass:v2];
}

- (BOOL)forceTouchAvailable
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B1F8;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D538 != -1) {
    dispatch_once(&qword_10006D538, block);
  }
  return byte_10006D530;
}

- (NSString)connectionStatusString
{
  uint64_t v2 = @"unknown";

  return (NSString *)v2;
}

- (NSString)wristStatusString
{
  return 0;
}

- (BOOL)canRegisterWithIDSID
{
  return MGGetSInt32Answer() - 1 < 3;
}

- (NSString)cellularPlanStatusString
{
  return 0;
}

- (BOOL)telephonyAvailable
{
  return 0;
}

- (BOOL)hasCellularCapability
{
  char v2 = [(SystemConfig *)self _BOOLGestaltQueryForKey:@"cellular-data"];
  char v3 = MAGetActivationState();
  CFBooleanRef v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000381F8(v2, v3, v4);
  }

  return v2 & v3;
}

- (unint64_t)unlockState
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  char v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100038288(v2, v3);
  }

  if (v2 != 1 && (v2 & 0x80000000) == 0) {
    return 1;
  }
  int v5 = MKBGetDeviceLockState();
  if (v5 == 4 || v5 == 1) {
    return 2;
  }
  else {
    return 3;
  }
}

- (int)processIdentifier
{
  int v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 processIdentifier];

  return v3;
}

- ($ECBB963D1F6757AE96FAF80058EC9690)batteryStats
{
  *(void *)&retstr->var0 = 0;
  retstr->var2 = 0;
  *(void *)&retstr->var3 = 0;
  CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
  if (!v5) {
    goto LABEL_40;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService) {
    goto LABEL_40;
  }
  io_registry_entry_t v7 = MatchingService;
  retstr->var0 = 1;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, @"FullyCharged", kCFAllocatorDefault, 0);
  CFBooleanRef v9 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"IsCharging", kCFAllocatorDefault, 0);
  CFBooleanRef v10 = v9;
  if (CFProperty) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFBooleanRef v12 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"ExternalConnected", kCFAllocatorDefault, 0);
    if (v12)
    {
      CFBooleanRef v13 = v12;
      BOOL v14 = CFBooleanGetValue(v12) != 0;
      CFRelease(v13);
    }
    else
    {
      BOOL v14 = 0;
    }
    retstr->var1 = v14;
    int Value = CFBooleanGetValue(CFProperty);
    int v16 = CFBooleanGetValue(v10);
    if (Value) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v16 == 0;
    }
    int64_t v18 = v17;
    retstr->var2 = v18;
    goto LABEL_20;
  }
  retstr->var2 = 2;
  if (CFProperty) {
LABEL_20:
  }
    CFRelease(CFProperty);
  if (v10) {
    CFRelease(v10);
  }
  CFNumberRef v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, @"CurrentCapacity", kCFAllocatorDefault, 0);
  CFNumberRef v20 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, @"MaxCapacity", kCFAllocatorDefault, 0);
  CFNumberRef v21 = v20;
  if (v19) {
    BOOL v22 = v20 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22)
  {
    if (!v19) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v19, kCFNumberFloatType, (char *)&valuePtr + 4);
    CFNumberGetValue(v21, kCFNumberFloatType, &valuePtr);
    float v23 = *((float *)&valuePtr + 1) / *(float *)&valuePtr;
    float v24 = fabsf(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
    BOOL v25 = v24 < INFINITY;
    BOOL v26 = v24 <= INFINITY;
    float v27 = 0.0;
    if (v25) {
      float v27 = *((float *)&valuePtr + 1) / *(float *)&valuePtr;
    }
    if (v26) {
      float v23 = v27;
    }
    retstr->var3 = v23;
  }
  CFRelease(v19);
LABEL_37:
  if (v21) {
    CFRelease(v21);
  }
  IOObjectRelease(v7);
LABEL_40:
  return result;
}

- (BOOL)isFMFAppRemoved
{
  int v2 = +[LSApplicationWorkspace defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.findmy"] ^ 1;

  return v3;
}

+ (BOOL)isString:(id)a3 equalToCaseInsensitiveString:(id)a4
{
  return [a3 compare:a4 options:1] == 0;
}

- (PreferencesMgr)preferencesMgr
{
  return self->_preferencesMgr;
}

- (void)setPreferencesMgr:(id)a3
{
}

- (NSNumber)_currentLocationServicesState
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_currentLocationServicesState:(id)a3
{
}

- (BOOL)deviceNameUpToDate
{
  return self->_deviceNameUpToDate;
}

- (void)setDeviceNameUpToDate:(BOOL)a3
{
  self->_deviceNameUpToDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentLocationServicesState, 0);

  objc_storeStrong((id *)&self->_preferencesMgr, 0);
}

@end