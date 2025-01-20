@interface MSDProvisioningProfileInstallOperation
- (BOOL)_installProvisioningProfiles;
- (BOOL)_installProvisioningProfilesInBackup;
- (BOOL)_installStandaloneProvisioningProfile;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDProvisioningProfileInstallOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_installProvisioningProfiles"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_installProvisioningProfiles
{
  v3 = [(MSDOperation *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    return [(MSDProvisioningProfileInstallOperation *)self _installProvisioningProfilesInBackup];
  }
  else
  {
    v5 = [(MSDOperation *)self context];
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    if (v6)
    {
      return [(MSDProvisioningProfileInstallOperation *)self _installStandaloneProvisioningProfile];
    }
    else
    {
      v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unrecognized operation context.", v9, 2u);
      }

      return 0;
    }
  }
}

- (BOOL)_installProvisioningProfilesInBackup
{
  v2 = [(MSDOperation *)self context];
  v3 = +[NSFileManager defaultManager];
  v4 = [v2 secondaryStagingRootPath];
  v5 = [v4 stringByAppendingPathComponent:@"/var/MobileDevice/ProvisioningProfiles"];
  char v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provisioning profile directory: %{public}@", buf, 0xCu);
  }

  id v36 = 0;
  v7 = [v3 contentsOfDirectoryAtPath:v5 error:&v36];
  id v8 = v36;
  v9 = v8;
  if (v7)
  {
    id v25 = v8;
    v26 = v7;
    v27 = v4;
    v28 = v3;
    v29 = v2;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v7;
    id v10 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      char v30 = 1;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (([v14 hasPrefix:@"."] & 1) == 0)
          {
            v15 = v5;
            v16 = [v5 stringByAppendingPathComponent:v14];
            v17 = sub_100068600();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v38 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Installing provisioning profile: %{public}@", buf, 0xCu);
            }

            uint64_t v18 = MISProfileCreateWithFile();
            if (v18)
            {
              v19 = (const void *)v18;
              if (MISInstallProvisioningProfile())
              {
                v20 = MISCopyErrorStringForErrorCode();
                v21 = sub_100068600();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v38 = v16;
                  __int16 v39 = 2114;
                  v40 = v20;
                  _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to install %{public}@ with error %{public}@", buf, 0x16u);
                }

                char v30 = 0;
              }
              else
              {
                v20 = sub_100068600();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v38 = v16;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Install success for %{public}@", buf, 0xCu);
                }
              }

              CFRelease(v19);
            }

            v5 = v15;
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v11);
    }
    else
    {
      char v30 = 1;
    }

    BOOL v23 = v30 & 1;
    v3 = v28;
    v2 = v29;
    v7 = v26;
    v4 = v27;
    v9 = v25;
  }
  else
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D712C(v9);
    }

    BOOL v23 = 1;
  }

  return v23;
}

- (BOOL)_installStandaloneProvisioningProfile
{
  v2 = [(MSDOperation *)self context];
  v3 = +[NSFileManager defaultManager];
  v4 = [v2 stagingRootPath];
  v5 = [v2 fileHash];
  char v6 = [v4 stringByAppendingPathComponent:v5];
  v7 = [v2 identifier];
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "INFO - Installing provisioning profile: %{public}@", buf, 0xCu);
  }

  v9 = +[MSDContentCacheManager sharedInstance];
  unsigned __int8 v10 = [v9 copyFileIfPresentInCache:v5 toLocation:v6 verifyHash:[v2 verifyFileHash]];

  if (v10)
  {
    BOOL v11 = +[MSDProvisioningProfileUtils installProvisioningProfile:v6];
  }
  else
  {
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000C6B6C((uint64_t)v5, v16);
    }

    BOOL v11 = 0;
  }
  if ([v3 fileExistsAtPath:v6])
  {
    id v17 = 0;
    unsigned __int8 v12 = [v3 removeItemAtPath:v6 error:&v17];
    id v13 = v17;
    if ((v12 & 1) == 0)
    {
      v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000D71B4(v13);
      }
    }
  }

  return v11;
}

@end