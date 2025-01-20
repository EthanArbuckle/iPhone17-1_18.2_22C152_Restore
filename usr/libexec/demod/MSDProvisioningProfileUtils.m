@interface MSDProvisioningProfileUtils
+ (BOOL)installProvisioningProfile:(id)a3;
+ (BOOL)isProvisioningProfileInstalled:(id)a3;
+ (BOOL)uninstallProvisioningProfileByFileName:(id)a3;
+ (BOOL)uninstallProvisioningProfileByUUID:(id)a3;
+ (id)getUUIDFromProvisioningProfileRef:(void *)a3;
+ (id)getUUIDsOfInstalledProvisioningProfiles;
+ (void)loadProvisioningProfileFromFile:(id)a3;
@end

@implementation MSDProvisioningProfileUtils

+ (BOOL)installProvisioningProfile:(id)a3
{
  id v3 = a3;
  v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:v3];
  if (v4)
  {
    v5 = v4;
    int v6 = MISInstallProvisioningProfile();
    BOOL v7 = v6 == 0;
    if (v6)
    {
      v8 = (void *)MISCopyErrorStringForErrorCode();
      v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        id v12 = v3;
        __int16 v13 = 2114;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to install provisioning profile:  %{public}@) with error %{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)uninstallProvisioningProfileByUUID:(id)a3
{
  id v3 = a3;
  int v4 = MISRemoveProvisioningProfile();
  if (v4)
  {
    v5 = (void *)MISCopyErrorStringForErrorCode();
    int v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = v3;
      __int16 v10 = 2114;
      int v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to uninstall provisioning profile with UUID:  %{public}@ - Error:  %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4 == 0;
}

+ (BOOL)uninstallProvisioningProfileByFileName:(id)a3
{
  id v3 = a3;
  int v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:v3];
  if (v4)
  {
    v5 = v4;
    int v6 = MISProvisioningProfileGetUUID();
    if (v6)
    {
      BOOL v7 = +[MSDProvisioningProfileUtils uninstallProvisioningProfileByUUID:v6];
    }
    else
    {
      id v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000C7A28((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
      }

      BOOL v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isProvisioningProfileInstalled:(id)a3
{
  id v3 = a3;
  int v4 = +[MSDProvisioningProfileUtils getUUIDsOfInstalledProvisioningProfiles];
  v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 containsObject:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)getUUIDsOfInstalledProvisioningProfiles
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_10001422C;
  uint64_t v13 = sub_10001423C;
  id v14 = 0;
  uint64_t v2 = +[NSMutableArray array];
  id v3 = (void *)v10[5];
  v10[5] = v2;

  if (MISEnumerateInstalledProvisioningProfiles())
  {
    int v4 = (void *)v10[5];
    v10[5] = 0;

    v5 = (void *)MISCopyErrorStringForErrorCode();
    unsigned __int8 v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to collect UUIDs of installed provisioning profiles - Error:  %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v5 = 0;
  }
  id v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

+ (void)loadProvisioningProfileFromFile:(id)a3
{
  id v3 = a3;
  int v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C7B00((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_8;
  }
  unsigned __int8 v6 = (void *)MISProfileCreateWithFile();
  if (!v6)
  {
    int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C7A94((uint64_t)v3, v8, v15, v16, v17, v18, v19, v20);
    }
LABEL_8:

    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)getUUIDFromProvisioningProfileRef:(void *)a3
{
  Value = (void *)MISProfileGetValue();
  if (Value)
  {
    Value = +[NSString stringWithString:Value];
  }

  return Value;
}

@end