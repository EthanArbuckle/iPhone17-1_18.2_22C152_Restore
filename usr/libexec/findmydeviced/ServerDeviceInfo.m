@interface ServerDeviceInfo
+ (id)sharedInstance;
- (id)_accessoryConfigurationDeviceInfo;
- (id)_constructPairedDevicesInfo;
- (id)_nonCriticalDeviceInfoForAccount:(id)a3;
- (id)_nonVolatileDeviceInfoForAccount:(id)a3;
- (id)_volatileDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4;
- (id)completeDeviceInfoForAccount:(id)a3 accessory:(id)a4;
- (id)deviceInfoForAccount:(id)a3;
- (id)deviceInfoForAccount:(id)a3 accessory:(id)a4;
- (id)identityDeviceInfoForAccount:(id)a3;
- (id)lastKnownLocationDeviceInfoForAccount:(id)a3 accessory:(id)a4;
- (id)locationDeviceInfoForAccount:(id)a3;
- (id)locationDeviceInfoForAccount:(id)a3 accessory:(id)a4;
- (id)registrationDigestDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4;
- (void)_addOctagonStatusToDict:(id)a3;
@end

@implementation ServerDeviceInfo

+ (id)sharedInstance
{
  if (qword_10031E820 != -1) {
    dispatch_once(&qword_10031E820, &stru_1002DAD40);
  }
  v2 = (void *)qword_10031E818;

  return v2;
}

- (id)deviceInfoForAccount:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = [(ServerDeviceInfo *)self _nonVolatileDeviceInfoForAccount:v4];
    [v5 addEntriesFromDictionary:v6];

    v7 = [(ServerDeviceInfo *)self _volatileDeviceInfoForAccount:v4 completedFirstRegister:1];
    [v5 addEntriesFromDictionary:v7];

    v8 = [(ServerDeviceInfo *)self _nonCriticalDeviceInfoForAccount:v4];

    [v5 addEntriesFromDictionary:v8];
    v9 = [(ServerDeviceInfo *)self _accessoryConfigurationDeviceInfo];
    [v5 addEntriesFromDictionary:v9];

    v10 = +[FMDPreferencesMgr deviceInfoOverrides];
    if (v10) {
      [v5 addEntriesFromDictionary:v10];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)registrationDigestDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4
{
  id v4 = [(ServerDeviceInfo *)self _volatileDeviceInfoForAccount:a3 completedFirstRegister:a4];
  [v4 removeObjectForKey:@"bioLock"];
  [v4 removeObjectForKey:@"unlockState"];
  [v4 removeObjectForKey:@"wristStatus"];
  [v4 removeObjectForKey:@"lowPowerMode"];
  [v4 removeObjectForKey:@"connectionStatus"];

  return v4;
}

- (id)locationDeviceInfoForAccount:(id)a3
{
  v3 = [(ServerDeviceInfo *)self deviceInfoForAccount:a3];
  id v4 = +[FMDPreferencesMgr locationDeviceInfoOverrides];
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }

  return v3;
}

- (id)identityDeviceInfoForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[FMDSystemConfig sharedInstance];
  v6 = [v5 deviceUDID];
  [v4 fm_safelyMapKey:@"udid" toObject:v6];

  v7 = +[FMDDaemon sharedInstance];
  v8 = [v3 apsEnvironmentConstant];

  v9 = [v7 apsHandlerForEnvironment:v8];

  v10 = [v9 apsToken];
  [v4 fm_safelyMapKey:@"aps-token" toObject:v10];

  v11 = +[FMDSystemConfig sharedInstance];
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 alCapability]);
  [v4 fm_safelyMapKey:@"alCapability" toObject:v12];

  v13 = +[FMDSystemConfig sharedInstance];
  v14 = [v13 suinfoLastModifiedTimestamp];
  [v4 fm_safelyMapKey:@"pscSUILastModified" toObject:v14];

  return v4;
}

- (id)deviceInfoForAccount:(id)a3 accessory:(id)a4
{
  if (a4)
  {
    id v5 = [a4 deviceInfo:a3];
    id v6 = [v5 mutableCopy];

    [v6 fm_safelyMapKey:@"aps-token" toObject:@"TOKEN"];
    v7 = [(ServerDeviceInfo *)self _accessoryConfigurationDeviceInfo];
    [v6 addEntriesFromDictionary:v7];
  }
  else
  {
    id v6 = [(ServerDeviceInfo *)self deviceInfoForAccount:a3];
  }

  return v6;
}

- (id)locationDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  id v4 = [a4 locationDeviceInfo:a3];
  id v5 = [v4 mutableCopy];

  return v5;
}

- (id)lastKnownLocationDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  id v4 = [a4 lastKnownLocationDeviceInfo:a3];
  id v5 = [v4 mutableCopy];

  return v5;
}

- (id)completeDeviceInfoForAccount:(id)a3 accessory:(id)a4
{
  id v4 = [a4 completeDeviceInfo:a3];
  id v5 = [v4 mutableCopy];

  [v5 fm_safelyMapKey:@"aps-token" toObject:@"TOKEN"];

  return v5;
}

- (id)_volatileDeviceInfoForAccount:(id)a3 completedFirstRegister:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = +[FMDSystemConfig sharedInstance];
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isLocationServicesEnabled]);
  [v6 setObject:v8 forKeyedSubscript:@"locationServicesEnabled"];

  v9 = +[FMDSystemConfig sharedInstance];
  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isFMIPLocationServicesEnabled]);
  [v6 setObject:v10 forKeyedSubscript:@"fmipLS"];

  v11 = +[FMDSystemConfig sharedInstance];
  v12 = [v11 deviceName];
  [v6 fm_safelyMapKey:@"deviceName" toObject:v12];

  v13 = +[FMDSystemConfig sharedInstance];
  v14 = [v13 timezone];
  [v6 fm_safelyMapKey:@"timezone" toObject:v14];

  v15 = +[FMDSystemConfig sharedInstance];
  v16 = [v15 locale];
  [v6 fm_safelyMapKey:@"locale" toObject:v16];

  v17 = objc_alloc_init(EmbeddedOSSupport);
  v18 = [(EmbeddedOSSupport *)v17 bioLockState];
  [v6 fm_safelyMapKey:@"bioLock" toObject:v18];

  v19 = +[FMDDaemon sharedInstance];
  unsigned int v20 = [v19 isFirstRunAfterBoot];
  if (v20 && v4)
  {
    v21 = +[FMDSystemConfig sharedInstance];
    id v22 = [v21 unlockState];

    if (v22 != (id)1)
    {
LABEL_4:
      v23 = +[FMDSystemConfig sharedInstance];
      uint64_t v24 = [v23 baUUID];
      goto LABEL_7;
    }
  }
  else
  {

    if (!v20) {
      goto LABEL_4;
    }
  }
  v23 = +[FMDSystemConfig sharedInstance];
  uint64_t v24 = [v23 fetchBaUUIDBeforeFirstRegister];
LABEL_7:
  v25 = (void *)v24;
  [v6 fm_safelyMapKey:@"baUUID" toObject:v24];

  v26 = +[FMDSystemConfig sharedInstance];
  v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 baRegistrationStatus]);
  [v6 fm_safelyMapKey:@"baStatus" toObject:v27];

  v28 = +[FMDLocalActivationLockInfoManager sharedInstance];
  uint64_t v29 = [v28 maskedAppleIDValue];

  v91 = (void *)v29;
  [v6 fm_safelyMapKey:@"maskedAppleID" toObject:v29];
  v30 = +[FMDLostModeManager sharedInstance];
  id v31 = [v30 lostModeEnabled];

  v32 = +[NSNumber numberWithBool:v31];
  [v6 setObject:v32 forKeyedSubscript:@"lostModeEnabled"];

  v33 = +[FMDServiceProvider activeServiceProvider];
  v34 = [v33 locationTracker];

  v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v34 trackingStatus]);
  [v6 setObject:v35 forKeyedSubscript:@"trackingStatus"];

  if ([v34 isTrackingOn])
  {
    v36 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v34 trackNotifyEnabled]);
    [v6 setObject:v36 forKeyedSubscript:@"trackNotifyEnabled"];
  }
  v37 = +[FMDSystemConfig sharedInstance];
  v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v37 isFMIPLocationServicesEnabled]);
  [v6 setObject:v38 forKeyedSubscript:@"fmipLS"];

  v39 = +[FMDSystemConfig sharedInstance];
  v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v39 isLocationServicesEnabledForShareMyLocation]);
  [v6 setObject:v40 forKeyedSubscript:@"smlLS"];

  [v6 fm_safelyMapKey:@"fmipVersion" toObject:@"517"];
  [v6 fm_safelyMapKey:@"fmipBuildVersion" toObject:@"5.0"];
  v41 = [v5 username];
  [v6 fm_safelyMapKey:@"appleId" toObject:v41];

  v42 = [v5 accountAddTime];

  if (v42)
  {
    v43 = [v5 accountAddTime];
    [v43 timeIntervalSince1970];
    v45 = +[NSNumber numberWithDouble:floor(v44)];
    [v6 fm_safelyMapKey:@"enableTS" toObject:v45];
  }
  v46 = +[FMDSystemConfig sharedInstance];
  id v47 = [v46 allowsActivationLock];

  v48 = +[NSNumber numberWithBool:v47];
  [v6 fm_safelyMapKey:@"activationLock" toObject:v48];

  v49 = +[FMDSystemConfig sharedInstance];
  v50 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v49 hasCellularCapability]);
  [v6 setObject:v50 forKeyedSubscript:@"hasCellularCapability"];

  v51 = +[FMDSystemConfig sharedInstance];
  id v52 = [v51 isPasscodeSet];

  v53 = +[NSNumber numberWithBool:v52];
  [v6 setObject:v53 forKeyedSubscript:@"passcodeIsSet"];

  v54 = +[FMDSystemConfig sharedInstance];
  v55 = [v54 currentPasscodeConstraintStr];
  [v6 fm_safelyMapKey:@"passcodeConstraint" toObject:v55];

  if (v52)
  {
    v56 = +[FMDSystemConfig sharedInstance];
    v57 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v56 unlockState]);
    [v6 setObject:v57 forKeyedSubscript:@"unlockState"];
  }
  v58 = +[FMDSystemConfig sharedInstance];
  unsigned int v59 = [v58 isPasscodeChangeRestricted];

  if (v59) {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"passcodeRestricted"];
  }
  v60 = [v90 _constructPairedDevicesInfo];
  [v6 setObject:v60 forKeyedSubscript:@"otherDevices"];
  v61 = +[FMSystemInfo sharedInstance];
  if (![v61 isInternalBuild])
  {

    goto LABEL_19;
  }
  unsigned __int8 v62 = +[FMPreferencesUtil BOOLForKey:@"DisableRemoteAccessoryConfig" inDomain:kFMDNotBackedUpPrefDomain];

  if ((v62 & 1) == 0)
  {
LABEL_19:
    v63 = +[FMDServiceProvider activeServiceProvider];
    v64 = [v63 supportedAccessoryRegistry];
    v65 = [v64 supportedAccessoriesVersion];

    [v6 fm_safelyMapKey:@"accConfigVersion" toObject:v65];
  }
  v66 = +[FMDSystemConfig sharedInstance];
  v67 = [v66 suinfoLastModifiedTimestamp];
  [v6 fm_safelyMapKey:@"pscSUILastModified" toObject:v67];

  v68 = +[FMDSystemConfig sharedInstance];
  v69 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v68 alCapability]);
  [v6 fm_safelyMapKey:@"alCapability" toObject:v69];

  v70 = +[FMDSystemConfig sharedInstance];
  v71 = [v70 ecid];
  [v6 fm_safelyMapKey:@"ecid" toObject:v71];

  v72 = +[FMDSystemConfig sharedInstance];
  v73 = [v72 chipId];
  [v6 fm_safelyMapKey:@"chipId" toObject:v73];

  id v74 = v5;
  v75 = [v74 lastIdentityTime];
  v76 = v75;
  if (v75)
  {
    [v75 timeIntervalSince1970];
    v78 = +[NSNumber numberWithDouble:v77 * 1000.0];
    [v6 setObject:v78 forKeyedSubscript:@"lastIdentityTime"];
  }
  v79 = [v74 lastUnregisterFailedTime];
  v80 = v79;
  if (v79)
  {
    [v79 timeIntervalSince1970];
    v82 = +[NSNumber numberWithDouble:v81 * 1000.0];
    [v6 setObject:v82 forKeyedSubscript:@"lastUnlockActivationFailedTime"];
  }
  id v83 = [v74 fmipEnableContext];
  if (v83)
  {
    v84 = +[NSNumber numberWithUnsignedInteger:v83];
    [v6 setObject:v84 forKeyedSubscript:@"fmipEnableReason"];
  }
  v85 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v74 lowBatteryLocateEnabled]);
  [v6 setObject:v85 forKeyedSubscript:@"lowBatteryLocate"];

  v86 = +[FMDSystemConfig sharedInstance];
  v87 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v86 isLowPowerModeEnabled]);
  [v6 setObject:v87 forKeyedSubscript:@"lowPowerMode"];

  return v6;
}

- (id)_nonVolatileDeviceInfoForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[FMDSystemConfig sharedInstance];
  id v6 = [v5 idsDeviceID];
  [v4 fm_safelyMapKey:@"deviceDiscoveryId" toObject:v6];

  v7 = +[FMDSystemConfig sharedInstance];
  v8 = [v7 deviceUDID];
  [v4 fm_safelyMapKey:@"udid" toObject:v8];

  v9 = +[FMDSystemConfig sharedInstance];
  v10 = [v9 deviceClassString];
  [v4 fm_safelyMapKey:@"deviceClass" toObject:v10];

  v11 = +[FMDSystemConfig sharedInstance];
  v12 = [v11 productType];
  [v4 fm_safelyMapKey:@"productType" toObject:v12];

  v13 = +[FMDSystemConfig sharedInstance];
  v14 = [v13 buildVersion];
  [v4 fm_safelyMapKey:@"buildVersion" toObject:v14];

  v15 = +[FMDSystemConfig sharedInstance];
  v16 = [v15 productVersion];
  [v4 fm_safelyMapKey:@"productVersion" toObject:v16];

  v17 = +[FMDSystemConfig sharedInstance];
  v18 = [v17 platform];
  [v4 fm_safelyMapKey:@"platform" toObject:v18];

  v19 = +[FMSystemInfo sharedInstance];
  unsigned int v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 isInternalBuild]);
  [v4 fm_safelyMapKey:@"isInternal" toObject:v20];

  v21 = +[FMDSystemConfig sharedInstance];
  id v22 = [v21 serialNumber];
  [v4 fm_safelyMapKey:@"serialNumber" toObject:v22];

  v23 = +[FMDSystemConfig sharedInstance];
  uint64_t v24 = [v23 mlbSerialNumber];
  [v4 fm_safelyMapKey:@"mlbSerialNumber" toObject:v24];

  v25 = [v3 versionHistory];
  v26 = [v25 componentsJoinedByString:@","];
  [v4 fm_safelyMapKey:@"versionHistory" toObject:v26];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"supportsLostModeV2"];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"findMyiPhone"];
  v27 = +[FMSystemInfo sharedInstance];
  if ([v27 isInternalBuild])
  {
    unsigned int v28 = +[FMPreferencesUtil BOOLForKey:@"SendSEID" inDomain:kFMDNotBackedUpPrefDomain];

    if (!v28) {
      goto LABEL_5;
    }
    v27 = +[FMDSystemConfig sharedInstance];
    uint64_t v29 = [v27 secureElementId];
    [v4 fm_safelyMapKey:@"seid" toObject:v29];
  }
LABEL_5:
  v30 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v31 = [v30 isRunningInRecovery];

  if ((v31 & 1) == 0)
  {
    v32 = +[FMDSystemConfig sharedInstance];
    v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v32 hasSecureElement]);
    [v4 fm_safelyMapKey:@"secureElement" toObject:v33];
  }
  v34 = +[FMDDaemon sharedInstance];
  v35 = [v3 apsEnvironmentConstant];
  v36 = [v34 apsHandlerForEnvironment:v35];

  v37 = [v36 apsToken];
  [v4 fm_safelyMapKey:@"aps-token" toObject:v37];

  v38 = +[FMDSystemConfig sharedInstance];
  LODWORD(v37) = [v38 hasSecureElement];

  if (v37) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"hasSM1"];
  }
  v39 = +[FMDSystemConfig sharedInstance];
  unsigned int v40 = [v39 hasNFC];

  if (v40) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"hasSM2"];
  }
  v41 = +[FMDSystemConfig sharedInstance];
  v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v41 hasNFC]);
  [v4 fm_safelyMapKey:@"nfc" toObject:v42];

  v43 = +[FMDSystemConfig sharedInstance];
  double v44 = [v43 deviceModel];
  [v4 fm_safelyMapKey:@"model" toObject:v44];

  v45 = +[FMDSystemConfig sharedInstance];
  v46 = [v45 deviceRegion];
  [v4 fm_safelyMapKey:@"region" toObject:v46];

  id v47 = +[FMDSystemConfig sharedInstance];
  v48 = [v47 housingColor];

  v49 = +[FMDSystemConfig sharedInstance];
  v50 = [v49 backOfEnclosureColor];

  v51 = +[FMDSystemConfig sharedInstance];
  id v52 = [v51 coverGlassColor];

  if ([v48 isEqualToString:@"0"]
    && [v50 isEqualToString:@"0"]
    && ([v52 isEqualToString:@"0"] & 1) != 0)
  {
    v53 = +[FMDSystemConfig sharedInstance];
    v54 = [v53 deviceColor];
    [v4 fm_safelyMapKey:@"deviceColor" toObject:v54];

    v55 = +[FMDSystemConfig sharedInstance];
    v56 = [v55 deviceEnclosureColor];
    [v4 fm_safelyMapKey:@"enclosureColor" toObject:v56];
  }
  else
  {
    [v4 fm_safelyMapKey:@"coverGlassColor" toObject:v52];
    [v4 fm_safelyMapKey:@"housingColor" toObject:v48];
    [v4 fm_safelyMapKey:@"backingColor" toObject:v50];
  }
  v57 = [v3 dsid];
  v58 = sub_10002F240((uint64_t)v57);

  unsigned int v59 = [v58 base64EncodedStringWithOptions:0];
  [v4 fm_safelyMapKey:@"mid" toObject:v59];

  v60 = +[FMDSystemConfig sharedInstance];
  v61 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v60 isRoseCapable]);
  [v4 setObject:v61 forKeyedSubscript:@"roseCapable"];

  return v4;
}

- (id)_nonCriticalDeviceInfoForAccount:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init(FMDBatteryInfo);
  id v6 = [(FMDBatteryInfo *)v5 dictionaryValue];
  [v4 setValuesForKeysWithDictionary:v6];

  v7 = +[FMDSystemConfig sharedInstance];
  v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 processIdentifier]);
  v9 = [v8 stringValue];
  [v4 fm_safelyMapKey:@"processId" toObject:v9];

  v10 = +[FMDBLEStateOwner sharedInstance];
  v11 = [v10 blePowerStatus];
  [v4 setObject:v11 forKeyedSubscript:@"bleStatus"];

  [(ServerDeviceInfo *)self _addOctagonStatusToDict:v4];

  return v4;
}

- (id)_constructPairedDevicesInfo
{
  v2 = +[NSMutableArray array];
  id v3 = +[FMDServiceProvider activeServiceProvider];
  id v4 = [v3 accessoryRegistry];
  id v5 = [v4 allAccessories];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) deviceInfoForHostRegister:v13];
        [v2 fm_safeAddObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v2;
}

- (void)_addOctagonStatusToDict:(id)a3
{
  id v3 = a3;
  id v4 = +[FMDSPStatusUtil sharedInstance];
  id v20 = [v4 beaconZoneCreationDate];

  [v20 timeIntervalSince1970];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 fm_safelyMapKey:@"bcnZoneTime" toObject:v5];
  if (v20) {
    CFStringRef v6 = @"created";
  }
  else {
    CFStringRef v6 = @"notCreated";
  }
  [v3 setObject:v6 forKeyedSubscript:@"bcnZoneStatus"];
  id v7 = +[FMDSPStatusUtil sharedInstance];
  id v8 = [v7 beaconZoneCreationErrorCode];
  [v3 fm_safelyMapKey:@"bcnZoneErrorCode" toObject:v8];

  uint64_t v9 = +[FMDSPStatusUtil sharedInstance];
  v10 = [v9 beaconLastKeyRollDate];
  [v10 timeIntervalSince1970];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  [v3 fm_safelyMapKey:@"bcnKeyLastGenTime" toObject:v11];
  v12 = +[FMDSPStatusUtil sharedInstance];
  long long v13 = [v12 octStatus];
  [v3 fm_safelyMapKey:@"octStatus" toObject:v13];

  long long v14 = +[FMDSPStatusUtil sharedInstance];
  long long v15 = [v14 octStatusError];
  [v3 fm_safelyMapKey:@"octStatusError" toObject:v15];

  long long v16 = +[FMDSPStatusUtil sharedInstance];
  v17 = [v16 mteStatus];
  [v3 fm_safelyMapKey:@"mteStatus" toObject:v17];

  v18 = +[FMDSPStatusUtil sharedInstance];
  v19 = [v18 mteStatusError];
  [v3 fm_safelyMapKey:@"mteStatusError" toObject:v19];
}

- (id)_accessoryConfigurationDeviceInfo
{
  v2 = +[FMDExtConfigurationRegistry sharedInstance];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [v2 version];
  [v3 fm_safeSetObject:v4 forKey:@"accessoryTypeListVersion"];

  [v3 fm_safeSetObject:@"true" forKey:@"supportsDataUpdate"];
  id v5 = +[FMDServiceProvider activeServiceProvider];
  CFStringRef v6 = [v5 detachNotificationManager];
  id v7 = [v6 notifWhenDetachedListVersion];

  [v3 fm_safeSetObject:v7 forKey:@"nwdListVersion"];
  id v8 = +[FMDMagSafeDataStore sharedInstance];
  uint64_t v9 = [v8 readLostModeAccessoriesListVersion];

  [v3 fm_safeSetObject:v9 forKey:@"lostModeInfoVersion"];

  return v3;
}

@end