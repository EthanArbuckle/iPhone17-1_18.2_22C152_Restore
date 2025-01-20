@interface MSDProfilesManager
+ (id)fetchInstalledMediaSetupProfilesManagedDefaults;
- (MSDProfilesManager)init;
- (MSDProfilesManagerDelegate)delegate;
- (void)dealloc;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)syncStatusOfInstalledProfiles;
@end

@implementation MSDProfilesManager

- (MSDProfilesManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDProfilesManager;
  v2 = [(MSDProfilesManager *)&v5 init];
  if (v2)
  {
    v3 = +[MCProfileConnection sharedConnection];
    [v3 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[MCProfileConnection sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MSDProfilesManager;
  [(MSDProfilesManager *)&v4 dealloc];
}

- (void)syncStatusOfInstalledProfiles
{
  v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching Installed Profiles", (uint8_t *)&v20, 2u);
  }

  objc_super v4 = [(id)objc_opt_class() fetchInstalledMediaSetupProfilesManagedDefaults];
  id v5 = [v4 count];
  v6 = +[MSDDefaultsManager sharedManager];
  id v7 = [v6 developerProfilesCount];

  v8 = +[MSDDefaultsManager sharedManager];
  [v8 setDeveloperProfilesCount:v5];

  if (v5)
  {
    v9 = +[MSDDefaultsManager sharedManager];
    unsigned int v10 = [v9 profilesEverInstalled];

    v11 = sub_100031A80();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v10 || v5 >= v7)
    {
      if (v12)
      {
        id v19 = [v4 count];
        int v20 = 134217984;
        id v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found %lu matching profiles installed on device", (uint8_t *)&v20, 0xCu);
      }

      v17 = [(MSDProfilesManager *)self delegate];
      id v18 = [v4 copy];
      [v17 profilesManager:self didAddProfiles:v18];
      goto LABEL_18;
    }
    if (v12)
    {
      LOWORD(v20) = 0;
      v13 = "A profile was removed from the device";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v14 = sub_100031A80();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No Profiles matching com.apple.mediasetup.developer domain", (uint8_t *)&v20, 2u);
  }

  v15 = +[MSDDefaultsManager sharedManager];
  unsigned int v16 = [v15 profilesEverInstalled];

  if (v16)
  {
    v11 = sub_100031A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v13 = "Profile was installed on device, and we received a state change";
      goto LABEL_13;
    }
LABEL_14:

    v17 = [(MSDProfilesManager *)self delegate];
    id v18 = [v4 copy];
    [v17 profilesManager:self didUpdateProfiles:v18];
LABEL_18:
  }
}

+ (id)fetchInstalledMediaSetupProfilesManagedDefaults
{
  v2 = objc_opt_new();
  v3 = +[MCProfileConnection sharedConnection];
  objc_super v4 = [v3 installedProfilesWithFilterFlags:3];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  id v26 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v39;
    uint64_t v5 = kMediaSetupTestingProfileDefaultsIdentifier;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        id v7 = *(void **)(*((void *)&v38 + 1) + 8 * v6);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v28 = [v7 payloads];
        id v8 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v29 = *(void *)v35;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v35 != v29) {
                objc_enumerationMutation(v28);
              }
              v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              id v12 = v11;
              if (objc_opt_isKindOfClass()) {
                v13 = v12;
              }
              else {
                v13 = 0;
              }
              id v14 = v13;

              long long v32 = 0u;
              long long v33 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              v15 = [v14 domains];
              id v16 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v31;
                do
                {
                  for (j = 0; j != v17; j = (char *)j + 1)
                  {
                    if (*(void *)v31 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    int v20 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                    if ([v20 containsString:v5])
                    {
                      id v21 = [v14 defaultsForDomain:v20];
                      [v2 na_safeAddObject:v21];
                    }
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
                }
                while (v17);
              }
            }
            id v9 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v26);
  }

  id v22 = [v2 copy];

  return v22;
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Profile List changed notification received for profileconnection..%@ with userinfo..%@", (uint8_t *)&v9, 0x16u);
  }

  [(MSDProfilesManager *)self syncStatusOfInstalledProfiles];
}

- (MSDProfilesManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSDProfilesManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end