@interface FMDGainsboroughPairedDeviceSimulation
- (BOOL)isPairedDeviceSimulationActive;
- (id)connectionStatusString:(id)a3;
- (id)deviceName:(id)a3;
- (id)lastActiveDate:(id)a3;
- (id)pairedDeviceInfo;
- (id)udid:(id)a3;
- (id)wristStatusString:(id)a3;
@end

@implementation FMDGainsboroughPairedDeviceSimulation

- (BOOL)isPairedDeviceSimulationActive
{
  v2 = +[FMSystemInfo sharedInstance];
  unsigned int v3 = [v2 isInternalBuild];

  if (!v3) {
    return 0;
  }

  return +[FMPreferencesUtil BOOLForKey:@"GainsboroughSimulationPhone" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (id)udid:(id)a3
{
  unsigned int v3 = [@"GainsboroughWatchUDID" stringByAppendingString:a3];
  v4 = +[FMPreferencesUtil stringForKey:v3 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];

  return v4;
}

- (id)deviceName:(id)a3
{
  return [@"Watch" stringByAppendingString:a3];
}

- (id)connectionStatusString:(id)a3
{
  unsigned int v3 = [@"GainsboroughConnectionStatus" stringByAppendingString:a3];
  v4 = @"unknown";
  unint64_t v5 = (unint64_t)+[FMPreferencesUtil integerForKey:v3 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (v5 <= 3)
  {
    v6 = *(&off_10005A548)[v5];

    v4 = v6;
  }

  return v4;
}

- (id)wristStatusString:(id)a3
{
  unsigned int v3 = [@"GainsboroughWristStatus" stringByAppendingString:a3];
  v4 = @"Unknown";
  id v5 = +[FMPreferencesUtil integerForKey:v3 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (v5)
  {
    if (v5 != (id)1) {
      goto LABEL_6;
    }
    v6 = &off_10005A2A0;
  }
  else
  {
    v6 = &off_10005A2A8;
  }
  v7 = *v6;

  v4 = v7;
LABEL_6:

  return v4;
}

- (id)lastActiveDate:(id)a3
{
  unsigned int v3 = [@"GainsboroughLastActiveTime" stringByAppendingString:a3];
  v4 = (char *)+[FMPreferencesUtil integerForKey:v3 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if ((unint64_t)(v4 - 1) > 3) {
    double v5 = -0.0;
  }
  else {
    double v5 = dbl_10004DC68[(void)(v4 - 1)];
  }
  v6 = +[NSDate dateWithTimeIntervalSinceNow:v5];

  return v6;
}

- (id)pairedDeviceInfo
{
  unsigned int v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDGainsboroughPairedDeviceSimulation simulation active", buf, 2u);
  }

  id v19 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [&off_10005F150 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(&off_10005F150);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v9 = [(FMDGainsboroughPairedDeviceSimulation *)self udid:v8];
        v10 = v9;
        if (v9 && [v9 length])
        {
          v11 = +[NSMutableDictionary dictionary];
          v12 = [(FMDGainsboroughPairedDeviceSimulation *)self lastActiveDate:v8];
          v13 = v12;
          if (v12)
          {
            +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 fm_epoch]);
            v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = &off_10005EF30;
          }
          [v11 fm_safelyMapKey:@"lastActiveTime" toObject:v14];
          [v11 fm_safelyMapKey:@"udid" toObject:v10];
          [v11 fm_safelyMapKey:@"pairingId" toObject:v10];
          [v11 fm_safelyMapKey:@"productType" toObject:@"Watch3,1"];
          [v11 fm_safelyMapKey:@"deviceClass" toObject:@"Watch"];
          [v11 fm_safelyMapKey:@"platform" toObject:@"watchos"];
          v15 = +[NSString stringWithFormat:@"Watch%@", v8];
          [v11 fm_safelyMapKey:@"deviceName" toObject:v15];

          v16 = [(FMDGainsboroughPairedDeviceSimulation *)self connectionStatusString:v8];
          [v11 fm_safelyMapKey:@"connectionStatus" toObject:v16];

          [v19 addObject:v11];
        }
      }
      id v5 = [&off_10005F150 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }
  v17 = sub_10001B6D4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDGainsboroughPairedDeviceSimulation simulated paired devices %@", buf, 0xCu);
  }

  return v19;
}

@end