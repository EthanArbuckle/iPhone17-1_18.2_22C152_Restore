@interface MSDAppPrivacyPermissionsHelper
+ (id)sharedInstance;
- (BOOL)grantNetworkPermission:(BOOL)a3 toBundleID:(id)a4;
- (BOOL)grantTCCPermission:(BOOL)a3 forResource:(id)a4 toBundleID:(id)a5;
- (BOOL)isCoreLocationOwnedResource:(id)a3;
- (BOOL)isNetworkOwnedResource:(id)a3;
- (BOOL)isTccOwnedResource:(id)a3;
- (BOOL)saveNetworkPrivacyConfiguration:(id)a3;
- (MSDAppPrivacyPermissionsHelper)init;
- (NSSet)coreLocationOwnedResources;
- (NSSet)networkOwnedResources;
- (NSSet)tccOwnedResources;
- (id)getCLPermissionForBundleID:(id)a3;
- (id)getCoreLocationOwnedResources;
- (id)getNetworkAccessPermissionForBundleID:(id)a3;
- (id)getNetworkOwnedResources;
- (id)getNetworkPrivacyConfiguration;
- (id)getPrivacyPermissionsForAppBundleID:(id)a3;
- (id)getTCCPermissionsForBundleID:(id)a3;
- (id)getTccOwnedResources;
- (void)grantCLPermission:(id)a3 toBundleID:(id)a4;
- (void)grantPrivacyPermissions:(id)a3 forAppBundleID:(id)a4;
- (void)grantPrivacyPermissionsForAllApps;
- (void)revokeCLPermissionForBundleID:(id)a3;
- (void)revokeNetworkPermissionForBundleID:(id)a3;
- (void)revokePrivacyPermissions:(id)a3 forAppBundleID:(id)a4;
- (void)revokePrivacyPermissionsForAllApps;
- (void)revokeTCCPermissionForResource:(id)a3 toBundleID:(id)a4;
- (void)savePrivacyPermissionsForAllApps:(id)a3;
- (void)setCoreLocationOwnedResources:(id)a3;
- (void)setNetworkOwnedResources:(id)a3;
- (void)setTccOwnedResources:(id)a3;
@end

@implementation MSDAppPrivacyPermissionsHelper

+ (id)sharedInstance
{
  if (qword_1001898B8 != -1) {
    dispatch_once(&qword_1001898B8, &stru_100151FA0);
  }
  v2 = (void *)qword_1001898B0;

  return v2;
}

- (MSDAppPrivacyPermissionsHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDAppPrivacyPermissionsHelper;
  v2 = [(MSDAppPrivacyPermissionsHelper *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MSDAppPrivacyPermissionsHelper *)v2 getTccOwnedResources];
    [(MSDAppPrivacyPermissionsHelper *)v3 setTccOwnedResources:v4];

    v5 = [(MSDAppPrivacyPermissionsHelper *)v3 getCoreLocationOwnedResources];
    [(MSDAppPrivacyPermissionsHelper *)v3 setCoreLocationOwnedResources:v5];

    v6 = [(MSDAppPrivacyPermissionsHelper *)v3 getNetworkOwnedResources];
    [(MSDAppPrivacyPermissionsHelper *)v3 setNetworkOwnedResources:v6];
  }
  return v3;
}

- (void)grantPrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v11);
        v13 = sub_100068600();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          __int16 v29 = 2114;
          uint64_t v30 = v12;
          __int16 v31 = 2114;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s - Granting privacy permission for resource: %{public}@ to app: %{public}@", buf, 0x20u);
        }

        if ([(MSDAppPrivacyPermissionsHelper *)self isTccOwnedResource:v12])
        {
          v14 = [v6 objectForKey:v12];
          id v15 = [v14 BOOLValue];

          if ([(MSDAppPrivacyPermissionsHelper *)self grantTCCPermission:v15 forResource:v12 toBundleID:v7])
          {
            goto LABEL_21;
          }
          v16 = sub_100068600();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315906;
          v28 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          __int16 v29 = 2114;
          uint64_t v30 = v12;
          __int16 v31 = 2114;
          id v32 = v7;
          __int16 v33 = 1024;
          int v34 = (int)v15;
          v17 = v16;
          v18 = "%s - Failed to grant TCC resource:  %{public}@ to bundle:  %{public}@ isGranted:  %{BOOL}d";
LABEL_12:
          uint32_t v19 = 38;
LABEL_24:
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
          goto LABEL_20;
        }
        if ([(MSDAppPrivacyPermissionsHelper *)self isCoreLocationOwnedResource:v12])
        {
          v16 = [v6 objectForKey:v12];
          [(MSDAppPrivacyPermissionsHelper *)self grantCLPermission:v16 toBundleID:v7];
        }
        else if ([(MSDAppPrivacyPermissionsHelper *)self isNetworkOwnedResource:v12])
        {
          v20 = [v6 objectForKey:v12];
          id v21 = [v20 BOOLValue];

          if ([(MSDAppPrivacyPermissionsHelper *)self grantNetworkPermission:v21 toBundleID:v7])
          {
            goto LABEL_21;
          }
          v16 = sub_100068600();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v28 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            __int16 v29 = 2114;
            uint64_t v30 = v12;
            __int16 v31 = 2114;
            id v32 = v7;
            __int16 v33 = 1024;
            int v34 = (int)v21;
            v17 = v16;
            v18 = "%s - Failed to grant network permission:  %{public}@ to bundle:  %{public}@ allow:  %{BOOL}d";
            goto LABEL_12;
          }
        }
        else
        {
          v16 = sub_100068600();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v28 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            __int16 v29 = 2114;
            uint64_t v30 = v12;
            __int16 v31 = 2114;
            id v32 = v7;
            v17 = v16;
            v18 = "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@";
            uint32_t v19 = 32;
            goto LABEL_24;
          }
        }
LABEL_20:

LABEL_21:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v22 = [v6 countByEnumeratingWithState:&v23 objects:v35 count:16];
      id v9 = v22;
    }
    while (v22);
  }
}

- (void)revokePrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(const char **)(*((void *)&v15 + 1) + 8 * (void)v11);
        v13 = sub_100068600();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Revoking privacy permission for resource: %{public}@ to app: %{public}@", buf, 0x16u);
        }

        if ([(MSDAppPrivacyPermissionsHelper *)self isTccOwnedResource:v12])
        {
          [(MSDAppPrivacyPermissionsHelper *)self revokeTCCPermissionForResource:v12 toBundleID:v7];
        }
        else if ([(MSDAppPrivacyPermissionsHelper *)self isCoreLocationOwnedResource:v12])
        {
          [(MSDAppPrivacyPermissionsHelper *)self revokeCLPermissionForBundleID:v7];
        }
        else if ([(MSDAppPrivacyPermissionsHelper *)self isNetworkOwnedResource:v12])
        {
          [(MSDAppPrivacyPermissionsHelper *)self revokeNetworkPermissionForBundleID:v7];
        }
        else
        {
          v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "-[MSDAppPrivacyPermissionsHelper revokePrivacyPermissions:forAppBundleID:]";
            __int16 v21 = 2114;
            id v22 = v12;
            __int16 v23 = 2114;
            long long v24 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@", buf, 0x20u);
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v9);
  }
}

- (id)getPrivacyPermissionsForAppBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(MSDAppPrivacyPermissionsHelper *)self getTCCPermissionsForBundleID:v4];
  if (v6) {
    [v5 addEntriesFromDictionary:v6];
  }
  id v7 = [(MSDAppPrivacyPermissionsHelper *)self getCLPermissionForBundleID:v4];
  if (v7) {
    [v5 addEntriesFromDictionary:v7];
  }
  id v8 = [(MSDAppPrivacyPermissionsHelper *)self getNetworkAccessPermissionForBundleID:v4];
  if (v8) {
    [v5 addEntriesFromDictionary:v8];
  }

  return v5;
}

- (id)getTccOwnedResources
{
  return +[NSSet setWithObjects:@"kTCCServiceAddressBook", @"kTCCServiceCalendar", @"kTCCServiceMediaLibrary", @"kTCCServicePhotos", @"kTCCServicePhotosAdd", @"kTCCServiceReminders", @"kTCCServiceBluetoothAlways", @"kTCCServiceBluetoothPeripheral", @"kTCCServiceMotion", @"kTCCServiceLiverpool", @"kTCCServiceUbiquity", 0];
}

- (id)getCoreLocationOwnedResources
{
  return +[NSSet setWithObjects:@"kCLServiceLocationService", 0];
}

- (id)getNetworkOwnedResources
{
  return +[NSSet setWithObjects:@"kNetworkServiceNetworkAccess", 0];
}

- (BOOL)grantTCCPermission:(BOOL)a3 forResource:(id)a4 toBundleID:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    v14 = "-[MSDAppPrivacyPermissionsHelper grantTCCPermission:forResource:toBundleID:]";
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - isGranted:  %{BOOL}d - resources:  %{public}@ - bundleID:  %{public}@", (uint8_t *)&v13, 0x26u);
  }

  int v10 = TCCAccessSetForBundleId();
  if (!v10)
  {
    uint64_t v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000C965C((uint64_t)v7, (uint64_t)v8, v12);
    }
  }
  return v10 != 0;
}

- (void)grantCLPermission:(id)a3 toBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:]";
    __int16 v10 = 1024;
    unsigned int v11 = [v5 BOOLValue];
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - status:  %{BOOL}d - bundleID:  %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:](CLLocationManager, "setAuthorizationStatusByType:forBundleIdentifier:", [v5 integerValue], v6);
}

- (BOOL)grantNetworkPermission:(BOOL)a3 toBundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:]";
    __int16 v38 = 1024;
    BOOL v39 = v4;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - allow:  %{BOOL}d - bundleID:  %{public}@", buf, 0x1Cu);
  }

  int v8 = [(MSDAppPrivacyPermissionsHelper *)self getNetworkPrivacyConfiguration];
  id v9 = v8;
  if (!v8)
  {
    __int16 v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C96E4(v19, v22, v23, v24, v25, v26, v27, v28);
    }
    __int16 v10 = 0;
LABEL_14:

LABEL_15:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  BOOL v29 = v4;
  uint64_t v30 = self;
  __int16 v10 = [v8 pathController];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unsigned int v11 = [v10 pathRules];
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v12)
  {
LABEL_12:

    __int16 v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C971C(v19);
    }
    goto LABEL_14;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v32;
LABEL_6:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v32 != v14) {
      objc_enumerationMutation(v11);
    }
    BOOL v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
    __int16 v17 = [v16 matchSigningIdentifier];
    unsigned int v18 = [v17 isEqualToString:v6];

    if (v18) {
      break;
    }
    if (v13 == (id)++v15)
    {
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  [v16 setDenyMulticast:!v29];
  BOOL v20 = 1;
  [v16 setMulticastPreferenceSet:1];

  if (![(MSDAppPrivacyPermissionsHelper *)v30 saveNetworkPrivacyConfiguration:v9]) {
    goto LABEL_15;
  }
LABEL_17:

  return v20;
}

- (id)getTCCPermissionsForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = (char *)TCCAccessCopyInformationForBundleId();
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TCC info list: %{public}@", buf, 0xCu);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
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
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 objectForKey:kTCCInfoService];
        uint64_t v14 = [v12 objectForKey:kTCCInfoGranted];
        [v4 setObject:v14 forKey:v13];
        uint64_t v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v16 = [v14 BOOLValue];
          *(_DWORD *)buf = 136315650;
          uint64_t v24 = "-[MSDAppPrivacyPermissionsHelper getTCCPermissionsForBundleID:]";
          __int16 v25 = 2114;
          uint64_t v26 = v13;
          __int16 v27 = 1024;
          unsigned int v28 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s - resource:  %{public}@ - isGranted:  %{BOOL}d", buf, 0x1Cu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v9);
  }

  __int16 v17 = +[NSDictionary dictionaryWithDictionary:v4];

  return v17;
}

- (id)getCLPermissionForBundleID:(id)a3
{
  signed int v3 = +[CLLocationManager authorizationStatusForBundleIdentifier:a3];
  id v4 = objc_alloc((Class)NSDictionary);
  id v5 = +[NSNumber numberWithInteger:v3];
  id v6 = [v4 initWithObjectsAndKeys:v5, @"kCLServiceLocationService", 0];

  return v6;
}

- (id)getNetworkAccessPermissionForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDAppPrivacyPermissionsHelper *)self getNetworkPrivacyConfiguration];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 pathController];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [v7 pathRules];
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v14 = [v13 matchSigningIdentifier];
          unsigned int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            __int16 v17 = sub_100068600();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v18 = [v13 denyMulticast];
              *(_DWORD *)buf = 67109378;
              int v35 = v18 ^ 1;
              __int16 v36 = 2114;
              id v37 = v4;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found network access permission: %d for bundleID: %{public}@", buf, 0x12u);
            }

            id v19 = objc_alloc((Class)NSDictionary);
            long long v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 denyMulticast] ^ 1);
            id v16 = [v19 initWithObjectsAndKeys:v20, @"kNetworkServiceNetworkAccess", 0];

            goto LABEL_14;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C96E4(v8, v23, v24, v25, v26, v27, v28, v29);
    }
    id v7 = 0;
  }
  id v16 = 0;
LABEL_14:

  id v21 = v16;
  return v21;
}

- (void)revokeTCCPermissionForResource:(id)a3 toBundleID:(id)a4
{
}

- (void)revokeCLPermissionForBundleID:(id)a3
{
  id v5 = a3;
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:"))
  {
    id v4 = +[NSNumber numberWithInteger:0];
    [(MSDAppPrivacyPermissionsHelper *)self grantCLPermission:v4 toBundleID:v5];
  }
}

- (void)revokeNetworkPermissionForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDAppPrivacyPermissionsHelper *)self getNetworkPrivacyConfiguration];
  id v6 = v5;
  if (v5)
  {
    [v5 pathController];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v24 = v29 = 0u;
    id v7 = [v24 pathRules];
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v13 = [v12 matchSigningIdentifier];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            [v12 setDenyMulticast:1];
            [v12 setMulticastPreferenceSet:0];

            [(MSDAppPrivacyPermissionsHelper *)self saveNetworkPrivacyConfiguration:v6];
            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    unsigned int v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to find the appropriate privacy rule.", buf, 2u);
    }

LABEL_14:
    id v16 = v24;
  }
  else
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000C96E4(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (id)getNetworkPrivacyConfiguration
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10001E7E0;
  uint64_t v19 = sub_10001E7F0;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10001E7E0;
  id v13 = sub_10001E7F0;
  id v14 = 0;
  v2 = +[NEConfigurationManager sharedManagerForAllUsers];
  signed int v3 = dispatch_get_global_queue(33, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E7F8;
  v8[3] = &unk_100151FC8;
  v8[4] = &v9;
  v8[5] = &v15;
  [v2 loadConfigurationsWithCompletionQueue:v3 handler:v8];

  id v4 = v16[5];
  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v6;
}

- (BOOL)saveNetworkPrivacyConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10001E7E0;
  id v14 = sub_10001E7F0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  id v4 = +[NEConfigurationManager sharedManagerForAllUsers];
  dispatch_time_t v5 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001EBD4;
  v9[3] = &unk_100151CB8;
  v9[4] = &v16;
  v9[5] = &v10;
  [v4 saveConfiguration:v3 withCompletionQueue:v5 handler:v9];

  id v6 = v11[5];
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v6, v7);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return (char)v6;
}

- (BOOL)isTccOwnedResource:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(MSDAppPrivacyPermissionsHelper *)self tccOwnedResources];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isCoreLocationOwnedResource:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(MSDAppPrivacyPermissionsHelper *)self coreLocationOwnedResources];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isNetworkOwnedResource:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(MSDAppPrivacyPermissionsHelper *)self networkOwnedResources];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)tccOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTccOwnedResources:(id)a3
{
}

- (NSSet)coreLocationOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoreLocationOwnedResources:(id)a3
{
}

- (NSSet)networkOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNetworkOwnedResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOwnedResources, 0);
  objc_storeStrong((id *)&self->_coreLocationOwnedResources, 0);

  objc_storeStrong((id *)&self->_tccOwnedResources, 0);
}

- (void)grantPrivacyPermissionsForAllApps
{
  id v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [v3 objectForKey:@"AppPrivacyPermissions"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        [(MSDAppPrivacyPermissionsHelper *)self grantPrivacyPermissions:v11 forAppBundleID:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)revokePrivacyPermissionsForAllApps
{
  id v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [v3 objectForKey:@"AppPrivacyPermissions"];

  id v5 = +[MSDPreferencesFile sharedInstance];
  [v5 removeObjectForKey:@"AppPrivacyPermissions"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 136315650;
    long long v15 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v6 objectForKeyedSubscript:v12, v15, v16];
        long long v14 = sub_100068600();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          uint64_t v21 = "-[MSDAppPrivacyPermissionsHelper(manager) revokePrivacyPermissionsForAllApps]";
          __int16 v22 = 2114;
          uint64_t v23 = v12;
          __int16 v24 = 2114;
          uint64_t v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s - Revoking appId:  %{public}@ permissions:  %{public}@", buf, 0x20u);
        }

        [(MSDAppPrivacyPermissionsHelper *)self revokePrivacyPermissions:v13 forAppBundleID:v12];
      }
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)savePrivacyPermissionsForAllApps:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 getSystemAppDataList];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v3 getSystemAppPrivacyPermissions:v10];
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }
  uint64_t v12 = [v3 getAppList];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
        long long v18 = [v3 getAppPrivacyPermissions:v17];
        if (v18) {
          [v4 setObject:v18 forKey:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v14);
  }
  if ([v4 count])
  {
    long long v19 = +[MSDPreferencesFile sharedInstance];
    [v19 setObject:v4 forKey:@"AppPrivacyPermissions"];
  }
  dispatch_semaphore_t v20 = sub_100068600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "AppPrivacyPermissions:  %{public}@", buf, 0xCu);
  }
}

@end