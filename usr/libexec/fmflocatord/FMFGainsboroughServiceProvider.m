@interface FMFGainsboroughServiceProvider
+ (BOOL)isSimulationActive;
- (FMFGainsboroughServiceProvider)init;
- (NSDate)lastOnWristDate;
- (id)_constructLocationDeviceInfo;
- (id)_constructNonVolatileFullDeviceInfo;
- (id)_constructPairedDevicesInfo;
- (id)_constructVolatileFullDeviceInfo;
- (id)companionUDID;
- (id)connectionStatusString;
- (id)deviceName;
- (id)lastActiveDate;
- (id)lastOnWristTime;
- (id)substituteStandardURLPlaceholders:(id)a3;
- (id)udid;
- (id)wristStatusString;
- (void)logState;
- (void)setLastOnWristDate:(id)a3;
@end

@implementation FMFGainsboroughServiceProvider

+ (BOOL)isSimulationActive
{
  v2 = +[FMSystemInfo sharedInstance];
  unsigned int v3 = [v2 isInternalBuild];

  if (!v3) {
    return 0;
  }

  return +[FMPreferencesUtil BOOLForKey:@"GainsboroughSimulationWatch" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (FMFGainsboroughServiceProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMFGainsboroughServiceProvider;
  v2 = [(FMFServiceProvider *)&v5 init];
  unsigned int v3 = v2;
  if (v2) {
    [(FMFGainsboroughServiceProvider *)v2 logState];
  }
  return v3;
}

- (id)udid
{
  return +[FMPreferencesUtil stringForKey:@"GainsboroughWatchUDID" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (id)deviceName
{
  v2 = +[SystemConfig sharedInstance];
  unsigned int v3 = [v2 deviceName];
  v4 = [v3 stringByAppendingString:@"_gainsborough"];

  return v4;
}

- (id)connectionStatusString
{
  v2 = @"unknown";
  unint64_t v3 = (unint64_t)+[FMPreferencesUtil integerForKey:@"GainsboroughConnectionStatus" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (v3 <= 3)
  {
    v4 = *(&off_1000590E0)[v3];

    v2 = v4;
  }

  return v2;
}

- (id)wristStatusString
{
  v2 = @"Unknown";
  id v3 = +[FMPreferencesUtil integerForKey:@"GainsboroughWristStatus" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (v3)
  {
    if (v3 != (id)1) {
      goto LABEL_6;
    }
    v4 = &off_10005A2A0;
  }
  else
  {
    v4 = &off_10005A2A8;
  }
  objc_super v5 = *v4;

  v2 = v5;
LABEL_6:

  return v2;
}

- (id)lastOnWristTime
{
  id v3 = +[NSDate date];
  v4 = [(FMFGainsboroughServiceProvider *)self wristStatusString];
  unsigned __int8 v5 = [v4 isEqualToString:@"on"];

  if (v5)
  {
    [(FMFGainsboroughServiceProvider *)self setLastOnWristDate:v3];
  }
  else
  {
    v6 = [(FMFGainsboroughServiceProvider *)self lastOnWristDate];

    if (!v6)
    {
      v7 = [v3 dateByAddingTimeInterval:-300.0];
      [(FMFGainsboroughServiceProvider *)self setLastOnWristDate:v7];
    }
    uint64_t v8 = [(FMFGainsboroughServiceProvider *)self lastOnWristDate];

    id v3 = (void *)v8;
  }

  return v3;
}

- (id)lastActiveDate
{
  v2 = (char *)+[FMPreferencesUtil integerForKey:@"GainsboroughLastActiveTime" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if ((unint64_t)(v2 - 1) > 3) {
    double v3 = -0.0;
  }
  else {
    double v3 = dbl_10004DAD0[(void)(v2 - 1)];
  }

  return +[NSDate dateWithTimeIntervalSinceNow:v3];
}

- (id)companionUDID
{
  return +[FMPreferencesUtil stringForKey:@"GainsboroughPhoneUDID" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)logState
{
  double v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulation active", (uint8_t *)&v18, 2u);
  }

  v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = [(FMFGainsboroughServiceProvider *)self udid];
    int v18 = 138412290;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider udid %@", (uint8_t *)&v18, 0xCu);
  }
  v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(FMFGainsboroughServiceProvider *)self deviceName];
    int v18 = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider deviceName %@", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(FMFGainsboroughServiceProvider *)self connectionStatusString];
    int v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider connectionStatusString %@", (uint8_t *)&v18, 0xCu);
  }
  v10 = sub_10001B6D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(FMFGainsboroughServiceProvider *)self wristStatusString];
    int v18 = 138412290;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider wristStatusString %@", (uint8_t *)&v18, 0xCu);
  }
  v12 = sub_10001B6D4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(FMFGainsboroughServiceProvider *)self lastActiveDate];
    int v18 = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider lastActiveDate %@", (uint8_t *)&v18, 0xCu);
  }
  v14 = sub_10001B6D4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(FMFGainsboroughServiceProvider *)self companionUDID];
    int v18 = 138412290;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider companionUDID %@", (uint8_t *)&v18, 0xCu);
  }
  v16 = sub_10001B6D4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(FMFGainsboroughServiceProvider *)self companionUDID];
    int v18 = 138412290;
    v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider pairingId %@", (uint8_t *)&v18, 0xCu);
  }
}

- (id)substituteStandardURLPlaceholders:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[PreferencesMgr sharedInstance];
  v6 = [v5 hostportOverride];

  if ([v6 length])
  {
    uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v6];
  }
  else
  {
    uint64_t v8 = [(ServiceProvider *)self account];
    v9 = [v8 serverHost];

    if (!v9) {
      goto LABEL_6;
    }
    v10 = [(ServiceProvider *)self account];
    v11 = [v10 serverHost];
    uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v11];

    id v4 = v10;
  }

  id v4 = (id)v7;
LABEL_6:
  v12 = +[PreferencesMgr sharedInstance];
  v13 = [v12 protocolSchemeOverride];

  if ([v13 length])
  {
    uint64_t v14 = [v4 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v13];
  }
  else
  {
    v15 = [(ServiceProvider *)self account];
    v16 = [v15 serverProtocolScheme];

    if (!v16) {
      goto LABEL_11;
    }
    v17 = [(ServiceProvider *)self account];
    int v18 = [v17 serverProtocolScheme];
    uint64_t v14 = [v4 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v18];

    id v4 = v17;
  }

  id v4 = (id)v14;
LABEL_11:
  v19 = [(FMFServiceProvider *)self serviceIdentifierInURL];

  if (v19)
  {
    v20 = [(FMFServiceProvider *)self serviceIdentifierInURL];
    uint64_t v21 = [v4 stringByReplacingOccurrencesOfString:@"${service}" withString:v20];

    id v4 = (id)v21;
  }
  v22 = [(ServiceProvider *)self account];
  v23 = [v22 authId];

  if (v23)
  {
    v24 = [(ServiceProvider *)self account];
    v25 = [v24 authId];
    uint64_t v26 = [v4 stringByReplacingOccurrencesOfString:@"${dsid}" withString:v25];

    id v4 = (id)v26;
  }
  v27 = [(FMFGainsboroughServiceProvider *)self udid];
  if (v27)
  {
    uint64_t v28 = [v4 stringByReplacingOccurrencesOfString:@"${udid}" withString:v27];

    id v4 = (id)v28;
  }

  return v4;
}

- (id)_constructVolatileFullDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(FindBaseServiceProvider *)self apsToken];
  [v3 fm_safelyMapKey:@"aps-token" toObject:v4];
  unsigned __int8 v5 = +[FMFConfig sharedInstance];
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isLocationServicesEnabled]);
  [v3 setObject:v6 forKeyedSubscript:@"locationServicesEnabled"];

  uint64_t v7 = +[FMFConfig sharedInstance];
  uint64_t v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isLocationServicesEnabledForShareMyLocation]);
  [v3 setObject:v8 forKeyedSubscript:@"smlLS"];

  v9 = [(FMFGainsboroughServiceProvider *)self deviceName];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v9];

  v10 = +[SystemConfig sharedInstance];
  v11 = [v10 timezone];
  [v3 fm_safelyMapKey:@"timezone" toObject:v11];

  v12 = +[SystemConfig sharedInstance];
  v13 = [v12 locale];
  [v3 fm_safelyMapKey:@"locale" toObject:v13];

  uint64_t v14 = +[SystemConfig sharedInstance];
  v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 processIdentifier]);
  v16 = [v15 stringValue];
  [v3 fm_safelyMapKey:@"processId" toObject:v16];

  v17 = +[SystemConfig sharedInstance];
  int v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 unlockState]);
  [v3 setObject:v18 forKeyedSubscript:@"unlockState"];

  v19 = [(FMFGainsboroughServiceProvider *)self connectionStatusString];
  [v3 fm_safelyMapKey:@"connectionStatus" toObject:v19];

  v20 = [(FMFGainsboroughServiceProvider *)self wristStatusString];
  [v3 fm_safelyMapKey:@"wristStatus" toObject:v20];

  uint64_t v21 = [(FMFGainsboroughServiceProvider *)self lastOnWristTime];
  v22 = [NSNumber numberWithLongLong:objc_msgSend(v21, "fm_epoch")];
  [v3 fm_safelyMapKey:@"lastOnWristTime" toObject:v22];

  v23 = +[SystemConfig sharedInstance];
  v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 hasCellularCapability]);
  [v3 fm_safelyMapKey:@"hasGainsborough" toObject:v24];

  v25 = +[FMFFencesMgr sharedInstance];
  uint64_t v26 = [v25 fenceVersion];
  [v3 fm_safelyMapKey:@"fenceVersion" toObject:v26];

  v27 = [(FMFGainsboroughServiceProvider *)self _constructPairedDevicesInfo];
  [v3 setObject:v27 forKeyedSubscript:@"otherDevices"];
  uint64_t v28 = sub_10001B6D4();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    id v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", (uint8_t *)&v30, 0xCu);
  }

  return v3;
}

- (id)_constructNonVolatileFullDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 fm_safelyMapKey:@"productType" toObject:@"Watch3,1"];
  [v3 fm_safelyMapKey:@"productVersion" toObject:@"4.0"];
  id v4 = [(FMFGainsboroughServiceProvider *)self udid];
  [v3 fm_safelyMapKey:@"udid" toObject:v4];

  [v3 fm_safelyMapKey:@"deviceClass" toObject:@"watch"];
  unsigned __int8 v5 = +[SystemConfig sharedInstance];
  v6 = [v5 buildVersion];
  [v3 fm_safelyMapKey:@"buildVersion" toObject:v6];

  [v3 fm_safelyMapKey:@"platform" toObject:@"watchos"];
  uint64_t v7 = +[FMSystemInfo sharedInstance];
  uint64_t v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isInternalBuild]);
  [v3 fm_safelyMapKey:@"isInternal" toObject:v8];

  v9 = +[SystemConfig sharedInstance];
  v10 = [v9 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v10];

  v11 = [(ServiceProvider *)self account];
  v12 = [v11 versionHistory];
  v13 = [v12 componentsJoinedByString:@","];
  [v3 fm_safelyMapKey:@"versionHistory" toObject:v13];

  uint64_t v14 = +[SystemConfig sharedInstance];
  v15 = [v14 deviceColor];
  [v3 fm_safelyMapKey:@"deviceColor" toObject:v15];

  v16 = +[SystemConfig sharedInstance];
  v17 = [v16 deviceEnclosureColor];
  [v3 fm_safelyMapKey:@"enclosureColor" toObject:v17];

  int v18 = +[SystemConfig sharedInstance];
  v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 forceTouchAvailable]);
  [v3 fm_safelyMapKey:@"supportsForceTouch" toObject:v19];

  v20 = +[SystemConfig sharedInstance];
  uint64_t v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 isRegionMonitoringAvailable]);
  [v3 setObject:v21 forKeyedSubscript:@"fenceMonitoringCapable"];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"supportsNotifyV2"];
  v22 = sub_10001B6D4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", (uint8_t *)&v24, 0xCu);
  }

  return v3;
}

- (id)_constructLocationDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(FMFGainsboroughServiceProvider *)self udid];
  [v3 fm_safelyMapKey:@"udid" toObject:v4];

  unsigned __int8 v5 = +[SystemConfig sharedInstance];
  v6 = v5;
  if (v5) {
    [v5 batteryStats];
  }

  uint64_t v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", buf, 0xCu);
  }

  return v3;
}

- (id)_constructPairedDevicesInfo
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableDictionary dictionary];
  unsigned __int8 v5 = [(FMFGainsboroughServiceProvider *)self lastActiveDate];
  v6 = v5;
  if (v5)
  {
    +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 fm_epoch]);
    uint64_t v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &off_10005EEA0;
  }
  [v4 fm_safelyMapKey:@"lastActiveTime" toObject:v7];
  uint64_t v8 = [(FMFGainsboroughServiceProvider *)self companionUDID];
  [v4 fm_safelyMapKey:@"udid" toObject:v8];

  v9 = [(FMFGainsboroughServiceProvider *)self companionUDID];
  [v4 fm_safelyMapKey:@"pairingId" toObject:v9];

  [v4 fm_safelyMapKey:@"productType" toObject:@"iPhone6,1"];
  [v4 fm_safelyMapKey:@"deviceClass" toObject:@"iPhone"];
  [v4 fm_safelyMapKey:@"platform" toObject:@"iphoneos"];
  [v4 fm_safelyMapKey:@"deviceName" toObject:@"Gainsborough's iPhone"];
  [v3 addObject:v4];
  id v10 = sub_10001B6D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated paired device info %@", (uint8_t *)&v12, 0xCu);
  }

  return v3;
}

- (NSDate)lastOnWristDate
{
  return self->_lastOnWristDate;
}

- (void)setLastOnWristDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end