@interface MSDConfigurationProfileManager
+ (id)sharedInstance;
- (BOOL)installConfigurationProfile:(id)a3;
- (BOOL)installConfigurationProfileWithData:(id)a3;
- (BOOL)installDefaultConfigurationProfile;
- (BOOL)installDemoModeConfigurationProfile;
- (BOOL)installRestrictionsConfigurationProfile:(id)a3;
- (BOOL)isConfigurationProfileInstalled:(id)a3;
- (BOOL)uninstallConfigurationProfile:(id)a3;
- (BOOL)uninstallConfigurationProfileIfNeeded:(id)a3;
- (BOOL)uninstallRestrictionsConfigurationProfile;
- (MSDConfigurationProfileManager)init;
- (NSMutableArray)configurationProfilesSupported;
- (void)setConfigurationProfilesSupported:(id)a3;
- (void)uninstallAllDemoBundleConfigurationProfiles;
@end

@implementation MSDConfigurationProfileManager

+ (id)sharedInstance
{
  if (qword_100189888 != -1) {
    dispatch_once(&qword_100189888, &stru_100151BA8);
  }
  v2 = (void *)qword_100189880;

  return v2;
}

- (MSDConfigurationProfileManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDConfigurationProfileManager;
  v2 = [(MSDConfigurationProfileManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    [(MSDConfigurationProfileManager *)v2 setConfigurationProfilesSupported:v3];

    v4 = [(MSDConfigurationProfileManager *)v2 configurationProfilesSupported];
    [v4 addObject:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"];

    v5 = [(MSDConfigurationProfileManager *)v2 configurationProfilesSupported];
    [v5 addObject:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];
  }
  return v2;
}

- (BOOL)installDefaultConfigurationProfile
{
  id v3 = [[MSDConfigurationProfile alloc] initWithDefaultProfile];
  LOBYTE(self) = [(MSDConfigurationProfileManager *)self installConfigurationProfile:v3];

  return (char)self;
}

- (BOOL)installDemoModeConfigurationProfile
{
  id v3 = [[MSDConfigurationProfile alloc] initWithDemoModeProfile];
  LOBYTE(self) = [(MSDConfigurationProfileManager *)self installConfigurationProfile:v3];

  return (char)self;
}

- (BOOL)installConfigurationProfile:(id)a3
{
  id v4 = a3;
  v5 = [v4 profileIdentifier];
  if (([v5 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"] & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"com.apple.mobilestoredemo.defaultProfile"))
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Installing configuration profile: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    if ([(MSDConfigurationProfileManager *)self uninstallConfigurationProfileIfNeeded:v5])
    {
      objc_super v7 = [v4 getProfileData];
      if (v7)
      {
        if ([(MSDConfigurationProfileManager *)self installConfigurationProfileWithData:v7])
        {
          BOOL v8 = 1;
          goto LABEL_9;
        }
        v12 = sub_100068600();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000C6C18();
        }
      }
      else
      {
        v12 = sub_100068600();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000C6BE4();
        }
      }
    }
    else
    {
      objc_super v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000C6C4C();
      }
    }
LABEL_16:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  unsigned int v10 = [v5 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];
  objc_super v7 = sub_100068600();
  BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v11)
    {
      int v13 = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown profile type: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_16;
  }
  if (v11)
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Installing restrictions configuration profile.", (uint8_t *)&v13, 2u);
  }

  objc_super v7 = [v4 getSupervisedRestrictions];
  BOOL v8 = [(MSDConfigurationProfileManager *)self installRestrictionsConfigurationProfile:v7];
LABEL_9:

  return v8;
}

- (void)uninstallAllDemoBundleConfigurationProfiles
{
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling all existing configuration profiles.", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(MSDConfigurationProfileManager *)self configurationProfilesSupported];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 138543362;
    long long v12 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v10, "isEqualToString:", @"com.apple.mobilestoredemo.demoProfile.standardPreferences", v12))
        {
          if ([v10 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"])
          {
            if ([(MSDConfigurationProfileManager *)self uninstallRestrictionsConfigurationProfile])
            {
              continue;
            }
LABEL_13:
            BOOL v11 = sub_100068600();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v12;
              v18 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to remove profile: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            BOOL v11 = sub_100068600();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v12;
              v18 = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown profile identifier found: %{public}@, Marking as removed.", buf, 0xCu);
            }
          }

          continue;
        }
        if (![(MSDConfigurationProfileManager *)self uninstallConfigurationProfileIfNeeded:v10])goto LABEL_13; {
      }
        }
      id v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (BOOL)uninstallConfigurationProfileIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(MSDConfigurationProfileManager *)self isConfigurationProfileInstalled:v4])
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Uninstalling existing configuration profile.", v8, 2u);
    }

    BOOL v6 = [(MSDConfigurationProfileManager *)self uninstallConfigurationProfile:v4];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)installConfigurationProfileWithData:(id)a3
{
  id v3 = a3;
  id v4 = +[MCProfileConnection sharedConnection];
  id v11 = 0;
  id v5 = [v4 installProfileData:v3 outError:&v11];

  id v6 = v11;
  id v7 = sub_100068600();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully installed configuration profile.", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1000C6C80();
  }

  return v5 != 0;
}

- (BOOL)uninstallConfigurationProfile:(id)a3
{
  id v4 = a3;
  id v5 = +[MCProfileConnection sharedConnection];
  [v5 removeProfileWithIdentifier:v4];

  unsigned int v6 = [(MSDConfigurationProfileManager *)self isConfigurationProfileInstalled:v4];
  if (v6)
  {
    uint64_t v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C6CE8();
    }
  }
  return v6 ^ 1;
}

- (BOOL)isConfigurationProfileInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = +[MCProfileConnection sharedConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AC84;
  v8[3] = &unk_100151BD0;
  unsigned int v10 = &v11;
  unsigned int v6 = v4;
  v9 = v6;
  [v5 isProfileInstalledWithIdentifier:v3 completion:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v5) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

- (BOOL)installRestrictionsConfigurationProfile:(id)a3
{
  BOOL v3 = 1;
  char v10 = 1;
  id v4 = a3;
  id v5 = +[MCProfileConnection sharedConnection];
  id v9 = 0;
  [v5 applyRestrictionDictionary:v4 clientType:@"com.apple.mobilestoredemod" clientUUID:@"com.apple.mobilestoredemod" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:&v10 outEffectiveSettingsChanged:0 outError:&v9];

  id v6 = v9;
  if (!v10)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C6D84();
    }

    BOOL v3 = v10 != 0;
  }

  return v3;
}

- (BOOL)uninstallRestrictionsConfigurationProfile
{
  BOOL v2 = 1;
  char v8 = 1;
  BOOL v3 = +[MCProfileConnection sharedConnection];
  id v7 = 0;
  [v3 applyRestrictionDictionary:0 clientType:@"com.apple.mobilestoredemod" clientUUID:@"com.apple.mobilestoredemod" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:&v8 outEffectiveSettingsChanged:0 outError:&v7];
  id v4 = v7;
  if (!v8)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000C6DEC();
    }

    BOOL v2 = v8 != 0;
  }

  return v2;
}

- (NSMutableArray)configurationProfilesSupported
{
  return self->_configurationProfilesSupported;
}

- (void)setConfigurationProfilesSupported:(id)a3
{
}

- (void).cxx_destruct
{
}

@end