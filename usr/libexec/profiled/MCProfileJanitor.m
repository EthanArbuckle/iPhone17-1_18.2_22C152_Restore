@interface MCProfileJanitor
- (id)earliestExpiryDate;
- (void)_removeExpiredProvisioningProfiles;
- (void)removeExpiredProfiles;
@end

@implementation MCProfileJanitor

- (void)removeExpiredProfiles
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Checking for configuration profiles to remove due to expired removal date.", buf, 2u);
  }
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[MCManifest sharedManifest];
  v5 = [v4 allInstalledProfileIdentifiers];
  v35 = +[NSDate date];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v12 = [v4 installedProfileWithIdentifier:v10];
        v13 = v12;
        if (v12)
        {
          v14 = [v12 removalDate];
          v15 = v14;
          if (v14)
          {
            v16 = [v14 earlierDate:v35];

            if (v16 == v15)
            {
              v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = v10;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” has expired and will be removed.", buf, 0xCu);
              }
              if ([v13 isInstalledForUser]) {
                uint64_t v18 = 2;
              }
              else {
                uint64_t v18 = 1;
              }
              v19 = +[NSNumber numberWithInteger:v18];
              [v3 setObject:v19 forKey:v10];
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    os_log_t v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      unsigned int v22 = [v3 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing %d configuration profiles.", buf, 8u);
    }
    v23 = +[MCInstaller sharedInstaller];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v34 = v3;
    id v24 = v3;
    id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v38;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
          v31 = [v24 objectForKey:v29];
          [v23 removeProfileWithIdentifier:v29 installationType:(int)[v31 intValue] source:@"Expired Profile Removal"];
        }
        id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v26);
    }

    v3 = v34;
  }
  [(MCProfileJanitor *)self _removeExpiredProvisioningProfiles];
  v32 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Finished checking for profiles to remove.", buf, 2u);
  }
}

- (void)_removeExpiredProvisioningProfiles
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Checking for provisioning profiles to remove due to expiry.", buf, 2u);
  }
  v3 = +[NSDate date];
  v4 = MCGestaltGetDeviceUUID();
  v5 = +[NSMutableArray array];
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_1000880B4;
  v32 = &unk_1000EC3B8;
  id v6 = v3;
  id v33 = v6;
  id v7 = v5;
  id v34 = v7;
  id v8 = v4;
  id v35 = v8;
  unsigned int v9 = MISEnumerateInstalledProvisioningProfiles();
  if (v9)
  {
    unsigned int v10 = v9;
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v38 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Cannot retrieve list of provisioning profiles with MIS error: %d", buf, 8u);
    }
  }
  else if ([v7 count])
  {
    id v24 = v8;
    os_log_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      unsigned int v14 = [v7 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing %d provisioning profiles.", buf, 8u);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          unsigned int v22 = +[MCInstaller sharedInstaller];
          id v23 = [v22 removeProvisioningProfileUUID:v20 sender:@"MCProfileJanitor._removeExpiredProvisioningProfiles"];
        }
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v17);
    }

    id v8 = v24;
  }
}

- (id)earliestExpiryDate
{
  uint64_t v26 = 0;
  long long v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100088584;
  uint64_t v30 = sub_100088594;
  id v31 = 0;
  v2 = +[MCManifest sharedManifest];
  [v2 allInstalledProfileIdentifiers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v9 = [v2 installedProfileWithIdentifier:v7];
        unsigned int v10 = v9;
        if (v9)
        {
          v11 = [v9 removalDate];
          os_log_t v12 = v11;
          v13 = v27;
          if (!v27[5]) {
            goto LABEL_11;
          }
          if (v11)
          {
            unsigned int v14 = [v11 earlierDate:];
            BOOL v15 = v14 == v12;

            if (v15)
            {
              v13 = v27;
LABEL_11:
              objc_storeStrong(v13 + 5, v12);
            }
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v4);
  }

  int v16 = MISEnumerateInstalledProvisioningProfiles();
  if (v16)
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot retrieve list of provisioning profiles. Status: %d", buf, 8u);
    }
  }
  uint64_t v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    id v19 = v27[5];
    *(_DWORD *)buf = 138543362;
    id v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Checking profiles for expiry. Earliest expiry date: %{public}@", buf, 0xCu);
  }
  id v20 = v27[5];

  _Block_object_dispose(&v26, 8);

  return v20;
}

@end