@interface FMDSystemConfig_ios
- (BOOL)_BOOLGestaltQueryForKey:(__CFString *)a3;
- (BOOL)allowsActivationLock;
- (BOOL)canHandleLocates;
- (BOOL)hasCellularCapability;
- (BOOL)hasNFC;
- (BOOL)hasSecureElement;
- (BOOL)isBuddyDone;
- (BOOL)isFMIPLocationServicesEnabled;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isLocationServicesEnabledForShareMyLocation;
- (BOOL)isLocked;
- (BOOL)isLocking;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isPasscodeChangeRestricted;
- (BOOL)isPasscodeSet;
- (BOOL)isRegionMonitoringAvailable;
- (BOOL)isRoseCapable;
- (FMDSystemConfig_ios)init;
- (id)_numberGestaltQueryForKey:(__CFString *)a3;
- (id)_stringGestaltQueryForKey:(__CFString *)a3;
- (id)backOfEnclosureColor;
- (id)btMacAddress;
- (id)buildVersion;
- (id)chipId;
- (id)coverGlassColor;
- (id)currentPasscodeConstraintStr;
- (id)deletablePlans;
- (id)deviceClassString;
- (id)deviceColor;
- (id)deviceEnclosureColor;
- (id)deviceModel;
- (id)deviceName;
- (id)deviceRegion;
- (id)deviceUDID;
- (id)ecid;
- (id)escrowHash;
- (id)housingColor;
- (id)internationalMobileEquipmentIdentity;
- (id)internationalMobileEquipmentIdentityTwo;
- (id)locale;
- (id)mobileEquipmentIdentifier;
- (id)platform;
- (id)productName;
- (id)productType;
- (id)productVersion;
- (id)pscSUIURL;
- (id)serialNumber;
- (id)suinfoLastModifiedTimestamp;
- (id)timezone;
- (id)wifiMacAddress;
- (id)wristStatusString;
- (int)currentPasscodeConstraint;
- (int64_t)connectionStatus;
- (int64_t)deviceClass;
- (unint64_t)alCapability;
- (unint64_t)pairingType;
- (unint64_t)unlockState;
- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4;
- (void)currentPasscodeStateMayNeedUpdate;
- (void)dealloc;
- (void)deviceNameMayNeedUpdate;
- (void)initializeSystemConfig;
@end

@implementation FMDSystemConfig_ios

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"FMDDevicePasscodeMayHaveChangedNotification" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"FMDDeviceNameMayHaveChangedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)FMDSystemConfig_ios;
  [(FMDSystemConfig_ios *)&v5 dealloc];
}

- (FMDSystemConfig_ios)init
{
  +[NSException raise:NSInternalInconsistencyException format:@"*** Trying to explicitly init FMDSystemConfig_iOS. Use '+sharedInstance'"];
  v4.receiver = self;
  v4.super_class = (Class)FMDSystemConfig_ios;

  return 0;
}

- (void)initializeSystemConfig
{
  v6.receiver = self;
  v6.super_class = (Class)FMDSystemConfig_ios;
  [(FMDSystemConfig *)&v6 initializeSystemConfig];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"currentPasscodeStateMayNeedUpdate" name:@"FMDDevicePasscodeMayHaveChangedNotification" object:0];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"deviceNameMayNeedUpdate" name:@"FMDDeviceNameMayHaveChangedNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000754E8, @"com.apple.system.timezone", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4
{
  objc_super v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100240274((uint64_t)a4, a3, v6);
  }
}

- (id)_stringGestaltQueryForKey:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswerWithError();

  return v3;
}

- (id)_numberGestaltQueryForKey:(__CFString *)a3
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

- (id)deviceName
{
  if (qword_10031E9A0 != -1) {
    dispatch_once(&qword_10031E9A0, &stru_1002DBF10);
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100075818;
  v10 = sub_100075828;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100075830;
  v5[3] = &unk_1002DA4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_10031E998, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)deviceNameMayNeedUpdate
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device name may need update", buf, 2u);
  }

  CFBooleanRef v4 = [(FMDSystemConfig_ios *)self deviceName];
  self->_deviceNameUpToDate = 0;
  uint64_t v5 = [(FMDSystemConfig_ios *)self deviceName];
  uint64_t v6 = (void *)v5;
  if (!v4 && v5 || v4 && !v5 || ([v4 isEqualToString:v5] & 1) == 0)
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Post notification for device name need update", v9, 2u);
    }

    uint64_t v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"FMDDeviceNameChangedNotification" object:0];
  }
}

- (id)deviceClassString
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075AA4;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031E9B0 != -1) {
    dispatch_once(&qword_10031E9B0, block);
  }
  return (id)qword_10031E9A8;
}

- (int64_t)deviceClass
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075B78;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031E9C0 != -1) {
    dispatch_once(&qword_10031E9C0, block);
  }
  return qword_10031E9B8;
}

- (id)deviceUDID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075CA0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031E9D0 != -1) {
    dispatch_once(&qword_10031E9D0, block);
  }
  return (id)qword_10031E9C8;
}

- (id)productType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075D78;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031E9E0 != -1) {
    dispatch_once(&qword_10031E9E0, block);
  }
  return (id)qword_10031E9D8;
}

- (id)productName
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075E50;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031E9F0 != -1) {
    dispatch_once(&qword_10031E9F0, block);
  }
  return (id)qword_10031E9E8;
}

- (id)productVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075F28;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA00 != -1) {
    dispatch_once(&qword_10031EA00, block);
  }
  return (id)qword_10031E9F8;
}

- (id)buildVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076020;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA10 != -1) {
    dispatch_once(&qword_10031EA10, block);
  }
  return (id)qword_10031EA08;
}

- (id)deviceModel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076118;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA20 != -1) {
    dispatch_once(&qword_10031EA20, block);
  }
  return (id)qword_10031EA18;
}

- (id)deviceRegion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000761F0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA30 != -1) {
    dispatch_once(&qword_10031EA30, block);
  }
  return (id)qword_10031EA28;
}

- (id)platform
{
  return @"iphoneos";
}

- (BOOL)isBuddyDone
{
  return BYSetupAssistantNeedsToRun() ^ 1;
}

- (BOOL)allowsActivationLock
{
  id v3 = +[MCProfileConnection sharedConnection];
  if ([v3 isActivationLockAllowed]
    && (+[FMPreferencesUtil BOOLForKey:@"StoreDemoMode" inDomain:@"com.apple.demo-settings"] & 1) == 0&& [(FMDSystemConfig_ios *)self isBuddyDone])
  {
    unsigned int v4 = +[FMPreferencesUtil BOOLForKey:@"BlockActivationLock" inDomain:kFMDNotBackedUpPrefDomain] ^ 1;
  }
  else
  {
    unsigned int v4 = 0;
  }

  uint64_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activation lock is allowed - [%@]", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (id)deviceColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076430;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA40 != -1) {
    dispatch_once(&qword_10031EA40, block);
  }
  return (id)qword_10031EA38;
}

- (id)deviceEnclosureColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076508;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA50 != -1) {
    dispatch_once(&qword_10031EA50, block);
  }
  return (id)qword_10031EA48;
}

- (id)coverGlassColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000765E0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA60 != -1) {
    dispatch_once(&qword_10031EA60, block);
  }
  return (id)qword_10031EA58;
}

- (id)housingColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000766D4;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA70 != -1) {
    dispatch_once(&qword_10031EA70, block);
  }
  return (id)qword_10031EA68;
}

- (id)backOfEnclosureColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000767C8;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA80 != -1) {
    dispatch_once(&qword_10031EA80, block);
  }
  return (id)qword_10031EA78;
}

- (BOOL)hasSecureElement
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000768B8;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EA90 != -1) {
    dispatch_once(&qword_10031EA90, block);
  }
  return byte_10031EA88;
}

- (BOOL)hasNFC
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076974;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAA0 != -1) {
    dispatch_once(&qword_10031EAA0, block);
  }
  return byte_10031EA98;
}

- (id)internationalMobileEquipmentIdentity
{
  return [(FMDSystemConfig_ios *)self _stringGestaltQueryForKey:@"InternationalMobileEquipmentIdentity"];
}

- (id)internationalMobileEquipmentIdentityTwo
{
  return [(FMDSystemConfig_ios *)self _stringGestaltQueryForKey:@"xRyzf9zFE/ycr/wJPweZvQ"];
}

- (id)mobileEquipmentIdentifier
{
  return [(FMDSystemConfig_ios *)self _stringGestaltQueryForKey:@"MobileEquipmentIdentifier"];
}

- (id)serialNumber
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076A58;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAB0 != -1) {
    dispatch_once(&qword_10031EAB0, block);
  }
  return (id)qword_10031EAA8;
}

- (id)chipId
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076B30;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAC0 != -1) {
    dispatch_once(&qword_10031EAC0, block);
  }
  return (id)qword_10031EAB8;
}

- (id)ecid
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076C08;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAD0 != -1) {
    dispatch_once(&qword_10031EAD0, block);
  }
  return (id)qword_10031EAC8;
}

- (id)wifiMacAddress
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076CE0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAE0 != -1) {
    dispatch_once(&qword_10031EAE0, block);
  }
  return (id)qword_10031EAD8;
}

- (id)btMacAddress
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076DB8;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EAF0 != -1) {
    dispatch_once(&qword_10031EAF0, block);
  }
  return (id)qword_10031EAE8;
}

- (id)timezone
{
  v2 = +[NSTimeZone systemTimeZone];
  id v3 = [v2 name];

  return v3;
}

- (id)locale
{
  v2 = +[NSLocale autoupdatingCurrentLocale];
  id v3 = [v2 localeIdentifier];

  return v3;
}

- (int)currentPasscodeConstraint
{
  if (qword_10031EB08 != -1) {
    dispatch_once(&qword_10031EB08, &stru_1002DBF30);
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100076FBC;
  v5[3] = &unk_1002DA4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_10031EB00, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLocked
{
  int v2 = MKBGetDeviceLockState();
  int v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1002402FC(v2, v3);
  }

  return v2 == 1 || v2 == 4;
}

- (unint64_t)unlockState
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  int v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100240374(v2, v3);
  }

  if (v2 != 1 && (v2 & 0x80000000) == 0) {
    return 1;
  }
  int v5 = MKBGetDeviceLockState();
  unint64_t v6 = 2;
  if (v5 != 1) {
    unint64_t v6 = 3;
  }
  if (v5 == 2) {
    return 4;
  }
  else {
    return v6;
  }
}

- (BOOL)isLocking
{
  return MKBGetDeviceLockState() == 2;
}

- (BOOL)isPasscodeSet
{
  if (qword_10031EB20 != -1) {
    dispatch_once(&qword_10031EB20, &stru_1002DBF50);
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100077294;
  v5[3] = &unk_1002DA4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_10031EB18, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPasscodeChangeRestricted
{
  int v2 = +[MCProfileConnection sharedConnection];
  char v3 = [v2 isPasscodeModificationAllowed] ^ 1;

  return v3;
}

- (void)currentPasscodeStateMayNeedUpdate
{
  unsigned int v3 = [(FMDSystemConfig_ios *)self currentPasscodeConstraint];
  self->_passcodeConstraintUpToDate = 0;
  unsigned int v4 = [(FMDSystemConfig_ios *)self currentPasscodeConstraint];
  unsigned int v5 = [(FMDSystemConfig_ios *)self isPasscodeSet];
  self->_passcodeStateUpToDate = 0;
  unsigned int v6 = [(FMDSystemConfig_ios *)self isPasscodeSet];
  if (v3 != v4 || v5 != v6)
  {
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"FMDPasscodeStateChangedNotification" object:0];
  }
}

- (id)currentPasscodeConstraintStr
{
  if (qword_10031EB38 != -1) {
    dispatch_once(&qword_10031EB38, &stru_1002DBF70);
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100075818;
  v10 = sub_100075828;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007759C;
  v5[3] = &unk_1002DA4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_10031EB30, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isLocationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled];
}

- (BOOL)isRegionMonitoringAvailable
{
  uint64_t v2 = objc_opt_class();

  return +[CLLocationManager isMonitoringAvailableForClass:v2];
}

- (BOOL)hasCellularCapability
{
  if ([(FMDSystemConfig_ios *)self _BOOLGestaltQueryForKey:@"CellularTelephonyCapability"])
  {
    return 1;
  }

  return [(FMDSystemConfig_ios *)self _BOOLGestaltQueryForKey:@"cellular-data"];
}

- (id)deletablePlans
{
  return &off_1002F2038;
}

- (id)escrowHash
{
  uint64_t v2 = +[MCProfileConnection sharedConnection];
  id v3 = [v2 activationLockBypassHash];

  return v3;
}

- (BOOL)isLowPowerModeEnabled
{
  uint64_t v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  uint64_t v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FMF.framework"];
  unsigned int v3 = +[CLLocationManager authorizationStatusForBundle:v2];

  return v3 == 3;
}

- (BOOL)isFMIPLocationServicesEnabled
{
  uint64_t v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  unsigned int v3 = +[CLLocationManager authorizationStatusForBundle:v2];

  return v3 == 3;
}

- (BOOL)canHandleLocates
{
  unsigned __int8 v3 = [(FMDSystemConfig_ios *)self isFMIPLocationServicesEnabled];
  return v3 & [(FMDSystemConfig_ios *)self isLocationServicesEnabled];
}

- (BOOL)isRoseCapable
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077970;
  block[3] = &unk_1002D9378;
  block[4] = self;
  if (qword_10031EB48 != -1) {
    dispatch_once(&qword_10031EB48, block);
  }
  return qword_10031EB40 != 0;
}

- (int64_t)connectionStatus
{
  uint64_t v2 = +[FMNetworkMonitor sharedInstance];
  if ([v2 isMonitoring])
  {
    if ([v2 isNetworkUp]) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = 1;
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)wristStatusString
{
  return 0;
}

- (unint64_t)pairingType
{
  return 1;
}

- (id)suinfoLastModifiedTimestamp
{
  uint64_t v2 = [(FMDSystemConfig_ios *)self pscSUIURL];
  id v11 = 0;
  id v10 = 0;
  [v2 getResourceValue:&v11 forKey:NSURLContentModificationDateKey error:&v10];
  id v3 = v11;
  id v4 = v10;
  unsigned int v5 = v4;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (v6)
  {
    if (v4)
    {
      id v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1002403EC((uint64_t)v2, (uint64_t)v5, v7);
      }
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v3 fm_epochObject];
  }

  return v8;
}

- (id)pscSUIURL
{
  uint64_t v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      char v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System group container path is %s", (uint8_t *)&v8, 0xCu);
    }

    unsigned int v5 = +[NSURL fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    free(v3);
  }
  else
  {
    unsigned int v5 = 0;
  }
  BOOL v6 = [v5 URLByAppendingPathComponent:@"Library/ProvenanceV2/psc.sui" isDirectory:0];

  return v6;
}

- (unint64_t)alCapability
{
  return 5;
}

@end