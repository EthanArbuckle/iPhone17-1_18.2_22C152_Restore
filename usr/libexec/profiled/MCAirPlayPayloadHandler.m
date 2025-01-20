@interface MCAirPlayPayloadHandler
+ (void)recomputeAirPlaySettings;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_addDependency;
- (void)_removeDependency;
- (void)remove;
@end

@implementation MCAirPlayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v7 = [(MCNewPayloadHandler *)self payload];
  v33 = self;
  [(MCAirPlayPayloadHandler *)self _addDependency];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v30 = v7;
  v8 = [v7 destinationsWithPasswords];
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    uint64_t v31 = kMCAppleKeychainGroup;
    uint64_t v32 = kMCAirPlayPasswordServiceKey;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = [v13 deviceName];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [v13 password];

          if (v16)
          {
            os_log_t v17 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              v19 = [v13 deviceName];
              *(_DWORD *)buf = 138543362;
              v40 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting AirPlay password for device name %{public}@", buf, 0xCu);
            }
            v20 = [v13 password];
            v21 = [v13 deviceName];
            v22 = [(MCNewPayloadHandler *)v33 profileHandler];
            v23 = [v22 profile];
            unsigned __int8 v24 = [v23 isInstalledForSystem];
            id v34 = 0;
            LOBYTE(v28) = v24;
            +[MCKeychain setString:v20 forService:v32 account:v21 label:0 description:0 group:v31 useSystemKeychain:v28 outError:&v34];
            id v25 = v34;

            if (v25)
            {

              [(MCAirPlayPayloadHandler *)v33 _removeDependency];
              BOOL v26 = 0;
              if (a6) {
                *a6 = [v25 MCCopyAsPrimaryError];
              }
              goto LABEL_16;
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v25 = 0;
  BOOL v26 = 1;
LABEL_16:

  return v26;
}

- (void)_addDependency
{
  v2 = [(MCNewPayloadHandler *)self payload];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v3 = [v2 allowListDestinations];
  id v4 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    uint64_t v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    uint64_t v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    uint64_t v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v11 = [v10 deviceName:v31, v32];

        v12 = +[MCDependencyManager sharedManager];
        if (v11)
        {
          v13 = [v10 deviceName];
          uint64_t v14 = [v2 UUID];
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v18 = v7;
          uint64_t v19 = v8;
        }
        else
        {
          v13 = [v10 deviceID];
          uint64_t v14 = [v2 UUID];
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v19 = v31;
          uint64_t v18 = v32;
        }
        [v15 addDependent:v16 ofParent:v17 inDomain:v18 reciprocalDomain:v19];
      }
      id v5 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v20 = [v2 destinationsWithPasswords];
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    uint64_t v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    uint64_t v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        uint64_t v28 = +[MCDependencyManager sharedManager];
        v29 = [v27 deviceName];
        v30 = [v2 UUID];
        [v28 addDependent:v29 ofParent:v30 inDomain:v24 reciprocalDomain:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)_removeDependency
{
  v2 = [(MCNewPayloadHandler *)self payload];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v3 = [v2 allowListDestinations];
  id v4 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    uint64_t v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    uint64_t v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    uint64_t v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v11 = [v10 deviceName:v31, v32];

        v12 = +[MCDependencyManager sharedManager];
        if (v11)
        {
          v13 = [v10 deviceName];
          uint64_t v14 = [v2 UUID];
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v18 = v7;
          uint64_t v19 = v8;
        }
        else
        {
          v13 = [v10 deviceID];
          uint64_t v14 = [v2 UUID];
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v19 = v31;
          uint64_t v18 = v32;
        }
        [v15 removeDependent:v16 fromParent:v17 inDomain:v18 reciprocalDomain:v19];
      }
      id v5 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v20 = [v2 destinationsWithPasswords];
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    uint64_t v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    uint64_t v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        uint64_t v28 = +[MCDependencyManager sharedManager];
        v29 = [v27 deviceName];
        v30 = [v2 UUID];
        [v28 removeDependent:v29 fromParent:v30 inDomain:v24 reciprocalDomain:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCAirPlayPayloadHandler *)self _removeDependency];
  }
}

+ (void)recomputeAirPlaySettings
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Recomputing AirPlay settings.", buf, 2u);
  }
  v3 = +[MCDependencyManager sharedManager];
  uint64_t v4 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
  id v5 = [v3 parentsInDomain:kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [v3 dependentsOfParent:*(void *)(*((void *)&v42 + 1) + 8 * i) inDomain:v4];
        if ([v11 count])
        {
          if (v8)
          {
            v12 = +[NSSet setWithArray:v11];
            [(id)v8 intersectSet:v12];
          }
          else
          {
            uint64_t v8 = +[NSMutableSet setWithArray:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(id)v8 count])
  {
    os_log_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v13;
      id v15 = [(id)v8 count];
      *(_DWORD *)buf = 134217984;
      id v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting AirPlay allowlist to %lu devices.", buf, 0xCu);
    }
  }
  else
  {

    uint64_t v8 = 0;
  }
  long long v37 = v5;
  uint64_t v16 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
  os_log_t v17 = [v3 parentsInDomain:kMCDMPayloadUUIDToDeviceNameDependencyKey];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = [v3 dependentsOfParent:*(void *)(*((void *)&v38 + 1) + 8 * (void)j) inDomain:v16];
        if ([v23 count])
        {
          if (v20)
          {
            uint64_t v24 = +[NSSet setWithArray:v23];
            [(id)v20 intersectSet:v24];
          }
          else
          {
            uint64_t v20 = +[NSMutableSet setWithArray:v23];
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }
  if ([(id)v20 count])
  {
    os_log_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      BOOL v26 = v25;
      id v27 = [(id)v8 count];
      *(_DWORD *)buf = 134217984;
      id v48 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Setting AirPlay allowlist to %lu devices.", buf, 0xCu);
    }
  }
  else
  {

    uint64_t v20 = 0;
  }
  unint64_t v28 = (unint64_t)CFPreferencesCopyAppValue(@"deviceFilter", @"com.apple.airplay");
  if (v28 | v8
    && ([(id)v8 allObjects],
        v29 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v30 = [(id)v28 isEqualToArray:v29],
        v29,
        (v30 & 1) == 0))
  {
    uint64_t v32 = [(id)v8 allObjects];
    CFPreferencesSetAppValue(@"deviceFilter", v32, @"com.apple.airplay");

    int v31 = 1;
  }
  else
  {
    int v31 = 0;
  }
  unint64_t v33 = (unint64_t)CFPreferencesCopyAppValue(@"deviceNameFilter", @"com.apple.airplay");
  if (v33 | v20
    && ([(id)v20 allObjects],
        long long v34 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v35 = [(id)v33 isEqualToArray:v34],
        v34,
        (v35 & 1) == 0))
  {
    long long v36 = [(id)v20 allObjects];
    CFPreferencesSetAppValue(@"deviceNameFilter", v36, @"com.apple.airplay");
  }
  else if (!v31)
  {
    goto LABEL_47;
  }
  CFPreferencesAppSynchronize(@"com.apple.airplay");
  MCSendAirPlayPreferencesChangedNotification();
LABEL_47:
}

@end