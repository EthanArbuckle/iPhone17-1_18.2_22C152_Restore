@interface PPSClientPermissions
+ (BOOL)checkWritePermissionForSubsystem:(id)a3 category:(id)a4;
+ (BOOL)hasWriteEntitlements;
+ (BOOL)overridePermissionForSubsystem:(id)a3 category:(id)a4;
+ (id)getClientPermissions;
+ (id)getPrivacyClientPermissions;
+ (id)getTestClientPermissions;
+ (id)userDefaults;
@end

@implementation PPSClientPermissions

+ (BOOL)checkWritePermissionForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (+[PPSClientPermissions hasWriteEntitlements])
    {
      if (+[PPSClientPermissions overridePermissionForSubsystem:v5 category:v7])
      {
        v9 = sub_10000266C();
        BOOL v8 = 1;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          id v16 = v5;
          __int16 v17 = 2112;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "overridePermissionForSubsystem %@ category %@", (uint8_t *)&v15, 0x16u);
        }
        goto LABEL_17;
      }
      v9 = +[PPSClientPermissions getClientPermissions];
      v10 = [v9 objectForKeyedSubscript:v5];

      if (v10)
      {
        v11 = +[PPSClientInterface getMetadataForSubsystem:v5 category:v7];
        id v12 = [v11 count];
        BOOL v8 = v12 != 0;
        if (v12)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        v13 = sub_10000266C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          id v16 = v5;
          __int16 v17 = 2112;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Missing metric definition for subsystem: %@ category: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      else
      {
        v11 = sub_10000266C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          id v16 = v5;
          __int16 v17 = 2112;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Subsystem/Category: %@::%@ is not registered", (uint8_t *)&v15, 0x16u);
        }
      }
      BOOL v8 = 0;
      goto LABEL_16;
    }
    BOOL v8 = 0;
  }
LABEL_18:

  return v8;
}

+ (BOOL)hasWriteEntitlements
{
  v2 = +[NSXPCConnection currentConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.PerfPowerServices.data-donation"];
  v4 = [v2 valueForEntitlement:@"com.apple.PerfPowerTelemetry.data-donation"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v3 BOOLValue] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0 && ([v4 BOOLValue] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = sub_10000266C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002D04(v2, v6);
    }

    BOOL v5 = 0;
  }

  return v5;
}

+ (id)userDefaults
{
  if (qword_1000087A8 != -1) {
    dispatch_once(&qword_1000087A8, &stru_100004188);
  }
  v2 = (void *)qword_1000087B0;
  return v2;
}

+ (BOOL)overridePermissionForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v8 = [a1 userDefaults];
    v9 = [v8 stringForKey:@"OverridePermissions"];

    if (v9)
    {
      v10 = +[NSString stringWithFormat:@"%@::%@", v6, v7];
      v11 = sub_10000266C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100002D90((uint64_t)v10, (uint64_t)v9, v11);
      }

      unsigned __int8 v12 = [v9 isEqualToString:v10];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

+ (id)getClientPermissions
{
  if (os_variant_has_internal_diagnostics())
  {
    v3 = +[NSMutableDictionary dictionary];
    v4 = [a1 getPrivacyClientPermissions];
    [v3 addEntriesFromDictionary:v4];

    BOOL v5 = [a1 getTestClientPermissions];
    [v3 addEntriesFromDictionary:v5];
  }
  else
  {
    v3 = [a1 getPrivacyClientPermissions];
  }
  return v3;
}

+ (id)getPrivacyClientPermissions
{
  if (qword_1000087B8 != -1) {
    dispatch_once(&qword_1000087B8, &stru_1000041A8);
  }
  v2 = (void *)qword_1000087C0;
  return v2;
}

+ (id)getTestClientPermissions
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[PPSFileUtilities containerPath];
  v4 = [v3 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  BOOL v5 = [v4 stringByAppendingString:@"Test/"];
  id v6 = [v5 stringByAppendingString:@"testAllowlist.plist"];
  unsigned int v7 = [v2 fileExistsAtPath:v6];

  if (v7)
  {
    BOOL v8 = +[PPSFileUtilities containerPath];
    v9 = [v8 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
    v10 = [v9 stringByAppendingString:@"Test/"];
    v11 = [v10 stringByAppendingString:@"testAllowlist.plist"];
    unsigned __int8 v12 = +[NSURL fileURLWithPath:v11 isDirectory:0];

    id v19 = 0;
    id v13 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v12 error:&v19];
    id v14 = v19;
    int v15 = sub_10000266C();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100002E18((uint64_t)v14, v16);
      }

      id v17 = &__NSDictionary0__struct;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Test allowlist: %@", buf, 0xCu);
      }

      id v17 = v13;
    }
  }
  else
  {
    id v17 = &__NSDictionary0__struct;
  }
  return v17;
}

@end