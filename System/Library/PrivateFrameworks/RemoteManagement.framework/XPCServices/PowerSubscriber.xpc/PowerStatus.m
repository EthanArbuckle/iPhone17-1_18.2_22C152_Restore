@interface PowerStatus
+ (id)supportedStatusKeys;
- (BOOL)isSupportedPlatform;
- (id)batteryHealthState;
- (int)rawBatteryHealthServiceState;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation PowerStatus

+ (id)supportedStatusKeys
{
  uint64_t v5 = RMModelStatusItemDeviceBatteryHealth;
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v20 = (void (**)(id, id, void))a5;
  v8 = +[RMLog batteryHealthLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000033A8((uint64_t)v7, v8);
  }

  v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = RMModelStatusItemDeviceBatteryHealth;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v15);
        v17 = +[RMLog batteryHealthLog];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Fetching status for key path: %{public}@", buf, 0xCu);
        }

        if ([v16 isEqualToString:v14])
        {
          v18 = [(PowerStatus *)self batteryHealthState];
          [v9 setObject:v18 forKeyedSubscript:v16];
        }
        v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v12);
  }

  id v19 = [v9 copy];
  v20[2](v20, v19, 0);
}

- (int)rawBatteryHealthServiceState
{
  int v2 = IOPSGetBatteryHealthState();
  if (v2)
  {
    int v3 = v2;
    v4 = +[RMLog batteryHealthLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100003464(v3, v4);
    }
LABEL_9:
    uint64_t v5 = -1;
    goto LABEL_10;
  }
  v4 = [0 objectForKeyedSubscript:@"IOPSBatteryHealthState"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = +[RMLog batteryHealthLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100003420(v6);
    }

    goto LABEL_9;
  }
  uint64_t v5 = (int)[v4 intValue];
LABEL_10:

  return +[RMFeatureOverrides batteryHealthServiceStateWithDefaultValue:v5];
}

- (BOOL)isSupportedPlatform
{
  if (+[DMCMobileGestalt hasBattery])
  {
    if ((+[DMCMobileGestalt isPhone] & 1) != 0
      || (unsigned int v2 = +[DMCMobileGestalt isAppleSiliconMac]) != 0)
    {
      LOBYTE(v2) = 1;
    }
  }
  else
  {
    int v3 = +[RMLog batteryHealthLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000034DC(v3);
    }

    LOBYTE(v2) = 0;
  }
  return v2;
}

- (id)batteryHealthState
{
  if ([(PowerStatus *)self isSupportedPlatform])
  {
    unsigned int v3 = [(PowerStatus *)self rawBatteryHealthServiceState];
    if (v3 > 4) {
      v4 = (void **)&RMModelStatusDeviceBatteryHealth_DevicePowerBatteryHealth_unknown;
    }
    else {
      v4 = (void **)*(&off_100004160 + (int)v3);
    }
  }
  else
  {
    v4 = (void **)&RMModelStatusDeviceBatteryHealth_DevicePowerBatteryHealth_unsupported;
  }
  uint64_t v5 = *v4;

  return v5;
}

@end