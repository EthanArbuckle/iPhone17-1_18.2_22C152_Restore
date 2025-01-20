@interface FMDSystemConfig
+ (id)sharedInstance;
- (BOOL)allowsActivationLock;
- (BOOL)canHandleLocates;
- (BOOL)hasCellularCapability;
- (BOOL)hasNFC;
- (BOOL)hasSecureElement;
- (BOOL)isBuddyDone;
- (BOOL)isFMIPLocationServicesEnabled;
- (BOOL)isInAirplaneMode;
- (BOOL)isLocationServicesCapable;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isLocationServicesEnabledForShareMyLocation;
- (BOOL)isLocked;
- (BOOL)isLocking;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isPasscodeChangeRestricted;
- (BOOL)isPasscodeSet;
- (BOOL)isRegionMonitoringAvailable;
- (BOOL)isRoseCapable;
- (BOOL)isRunningInLocked;
- (BOOL)isRunningInRecovery;
- (NSData)escrowHash;
- (NSNumber)chipId;
- (NSNumber)deletablePlans;
- (NSNumber)ecid;
- (NSNumber)secureElementId;
- (NSNumber)suinfoLastModifiedTimestamp;
- (NSString)baUUID;
- (NSString)backOfEnclosureColor;
- (NSString)btMacAddress;
- (NSString)buildVersion;
- (NSString)coverGlassColor;
- (NSString)currentPasscodeConstraintStr;
- (NSString)deviceClassString;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)deviceRegion;
- (NSString)deviceUDID;
- (NSString)housingColor;
- (NSString)idsDeviceID;
- (NSString)internalBAUUID;
- (NSString)internationalMobileEquipmentIdentity;
- (NSString)internationalMobileEquipmentIdentityTwo;
- (NSString)locale;
- (NSString)mlbSerialNumber;
- (NSString)mobileEquipmentIdentifier;
- (NSString)platform;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)recoveryBootState;
- (NSString)recoveryBuildVersion;
- (NSString)recoveryProductVersion;
- (NSString)rootVolumeUUID;
- (NSString)serialNumber;
- (NSString)timezone;
- (NSString)wifiMacAddress;
- (NSString)wristStatusString;
- (OS_dispatch_queue)systemInfoQueue;
- (id)fetchBaUUIDBeforeFirstRegister;
- (id)fetchBaUUIDWithTimeout:(double)a3;
- (id)initSingleton;
- (id)stringForConnectionStatus:(int64_t)a3;
- (int)processIdentifier;
- (int64_t)connectionStatus;
- (int64_t)deviceClass;
- (unint64_t)activationLockAllowedState;
- (unint64_t)alCapability;
- (unint64_t)baRegistrationStatus;
- (unint64_t)fileVaultStatus;
- (unint64_t)internalBAStatus;
- (unint64_t)pairingType;
- (unint64_t)unlockState;
- (void)baUUIDMayHaveChanged;
- (void)initializeSystemConfig;
- (void)setInternalBAStatus:(unint64_t)a3;
- (void)setInternalBAUUID:(id)a3;
- (void)setSystemInfoQueue:(id)a3;
@end

@implementation FMDSystemConfig

+ (id)sharedInstance
{
  if (qword_10031E7E8 != -1) {
    dispatch_once(&qword_10031E7E8, &stru_1002DA430);
  }
  v2 = (void *)qword_10031E7E0;

  return v2;
}

- (id)initSingleton
{
  v7.receiver = self;
  v7.super_class = (Class)FMDSystemConfig;
  v2 = [(FMDSystemConfig *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(FMDSystemConfig *)v2 initializeSystemConfig];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.findmydevice-system-info", 0);
    [(FMDSystemConfig *)v3 setSystemInfoQueue:v4];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"baUUIDMayHaveChanged" name:@"kFMDDeviceSPSelfBeaconChangeNotification" object:0];
  }
  return v3;
}

- (void)baUUIDMayHaveChanged
{
  v3 = [(FMDSystemConfig *)self systemInfoQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F9C0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)initializeSystemConfig
{
  self->_internalBAStatus = 1;
}

- (NSString)deviceName
{
  return 0;
}

- (NSString)deviceClassString
{
  return 0;
}

- (int64_t)deviceClass
{
  return 0;
}

- (NSString)deviceUDID
{
  return 0;
}

- (NSString)idsDeviceID
{
  v2 = (void *)qword_10031E7F0;
  if (!qword_10031E7F0)
  {
    uint64_t v3 = IDSCopyLocalDeviceUniqueID();
    dispatch_queue_t v4 = (void *)qword_10031E7F0;
    qword_10031E7F0 = v3;

    v2 = (void *)qword_10031E7F0;
    if (!qword_10031E7F0)
    {
      v5 = sub_100004238();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10023CDEC(v5);
      }

      v2 = (void *)qword_10031E7F0;
    }
  }

  return (NSString *)v2;
}

- (NSString)productType
{
  return 0;
}

- (NSString)productName
{
  return 0;
}

- (NSString)productVersion
{
  return 0;
}

- (NSString)buildVersion
{
  return 0;
}

- (NSString)platform
{
  return 0;
}

- (BOOL)isLocationServicesEnabled
{
  return 0;
}

- (BOOL)isLocationServicesCapable
{
  return 1;
}

- (BOOL)isBuddyDone
{
  return 0;
}

- (NSString)recoveryBuildVersion
{
  return 0;
}

- (NSString)recoveryProductVersion
{
  return 0;
}

- (BOOL)isRunningInRecovery
{
  return 0;
}

- (BOOL)isRunningInLocked
{
  return 0;
}

- (NSString)recoveryBootState
{
  return 0;
}

- (NSString)deviceColor
{
  return 0;
}

- (NSString)deviceEnclosureColor
{
  return 0;
}

- (NSString)coverGlassColor
{
  return 0;
}

- (NSString)housingColor
{
  return 0;
}

- (NSString)backOfEnclosureColor
{
  return 0;
}

- (BOOL)hasSecureElement
{
  return 0;
}

- (BOOL)hasNFC
{
  return 0;
}

- (NSString)internationalMobileEquipmentIdentity
{
  return 0;
}

- (NSString)internationalMobileEquipmentIdentityTwo
{
  return 0;
}

- (NSString)mobileEquipmentIdentifier
{
  return 0;
}

- (NSString)serialNumber
{
  return 0;
}

- (NSString)mlbSerialNumber
{
  return 0;
}

- (id)fetchBaUUIDWithTimeout:(double)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10002FCA0;
  v13 = sub_10002FCB0;
  v14 = &stru_1002E7428;
  v5 = [(FMDSystemConfig *)self systemInfoQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FCB8;
  block[3] = &unk_1002DA480;
  block[4] = self;
  void block[5] = &v9;
  *(double *)&block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)fetchBaUUIDBeforeFirstRegister
{
  return [(FMDSystemConfig *)self fetchBaUUIDWithTimeout:60.0];
}

- (NSString)baUUID
{
  return (NSString *)[(FMDSystemConfig *)self fetchBaUUIDWithTimeout:5.0];
}

- (unint64_t)baRegistrationStatus
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 1;
  uint64_t v3 = [(FMDSystemConfig *)self systemInfoQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FF80;
  v6[3] = &unk_1002DA4D0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_sync(v3, v6);

  unint64_t internalBAStatus = self->_internalBAStatus;
  _Block_object_dispose(v7, 8);
  return internalBAStatus;
}

- (BOOL)isInAirplaneMode
{
  return 0;
}

- (BOOL)isPasscodeSet
{
  return 0;
}

- (BOOL)isPasscodeChangeRestricted
{
  return 0;
}

- (BOOL)isLocked
{
  return 0;
}

- (unint64_t)unlockState
{
  return 0;
}

- (BOOL)isLocking
{
  return 0;
}

- (NSString)currentPasscodeConstraintStr
{
  return (NSString *)@"simple";
}

- (BOOL)isRegionMonitoringAvailable
{
  return 0;
}

- (NSString)timezone
{
  return 0;
}

- (NSString)locale
{
  return 0;
}

- (BOOL)hasCellularCapability
{
  return 0;
}

- (BOOL)isRoseCapable
{
  return 0;
}

- (NSNumber)deletablePlans
{
  return (NSNumber *)&off_1002F1E88;
}

- (BOOL)allowsActivationLock
{
  return 1;
}

- (NSData)escrowHash
{
  return 0;
}

- (NSString)deviceModel
{
  return 0;
}

- (NSString)deviceRegion
{
  return 0;
}

- (BOOL)isLowPowerModeEnabled
{
  return 0;
}

- (int64_t)connectionStatus
{
  return 0;
}

- (NSNumber)suinfoLastModifiedTimestamp
{
  return 0;
}

- (id)stringForConnectionStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return *(&off_1002DA4F0 + a3 - 1);
  }
}

- (NSString)wristStatusString
{
  return 0;
}

- (unint64_t)pairingType
{
  return 1;
}

- (int)processIdentifier
{
  v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)canHandleLocates
{
  return self->_canHandleLocates;
}

- (unint64_t)fileVaultStatus
{
  return self->_fileVaultStatus;
}

- (NSString)rootVolumeUUID
{
  return self->_rootVolumeUUID;
}

- (NSNumber)secureElementId
{
  return self->_secureElementId;
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (NSNumber)chipId
{
  return self->_chipId;
}

- (NSString)wifiMacAddress
{
  return self->_wifiMacAddress;
}

- (NSString)btMacAddress
{
  return self->_btMacAddress;
}

- (unint64_t)activationLockAllowedState
{
  return self->_activationLockAllowedState;
}

- (unint64_t)alCapability
{
  return self->_alCapability;
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  return self->_isLocationServicesEnabledForShareMyLocation;
}

- (BOOL)isFMIPLocationServicesEnabled
{
  return self->_isFMIPLocationServicesEnabled;
}

- (OS_dispatch_queue)systemInfoQueue
{
  return self->_systemInfoQueue;
}

- (void)setSystemInfoQueue:(id)a3
{
}

- (NSString)internalBAUUID
{
  return self->_internalBAUUID;
}

- (void)setInternalBAUUID:(id)a3
{
}

- (unint64_t)internalBAStatus
{
  return self->_internalBAStatus;
}

- (void)setInternalBAStatus:(unint64_t)a3
{
  self->_unint64_t internalBAStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalBAUUID, 0);
  objc_storeStrong((id *)&self->_systemInfoQueue, 0);
  objc_storeStrong((id *)&self->_btMacAddress, 0);
  objc_storeStrong((id *)&self->_wifiMacAddress, 0);
  objc_storeStrong((id *)&self->_chipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_secureElementId, 0);

  objc_storeStrong((id *)&self->_rootVolumeUUID, 0);
}

@end