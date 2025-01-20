@interface RMCloudConfigController
+ (id)_enrollmentURLFromCloudConfig:(id)a3;
+ (id)_enrollmentURLFromUpdatedCloudConfig;
+ (id)_updatedCloudConfig;
+ (id)cloudConfigEnrollmentURL;
+ (id)cloudConfigEnrollmentURLWithUpdateFromServer;
@end

@implementation RMCloudConfigController

+ (id)cloudConfigEnrollmentURL
{
  return 0;
}

+ (id)cloudConfigEnrollmentURLWithUpdateFromServer
{
  v3 = +[RMManagementSettings sharedSettings];
  [v3 removeValueForKey:@"HasCloudConfigBeenChecked"];
  [v3 removeValueForKey:@"CloudConfigEnrollmentURL"];
  v4 = [a1 _enrollmentURLFromUpdatedCloudConfig];

  return v4;
}

+ (id)_enrollmentURLFromUpdatedCloudConfig
{
  v3 = [a1 _updatedCloudConfig];
  v4 = [a1 _enrollmentURLFromCloudConfig:v3];

  return v4;
}

+ (id)_enrollmentURLFromCloudConfig:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[RMManagementSettings sharedSettings];
    [v4 setValue:&__kCFBooleanTrue forKey:@"HasCloudConfigBeenChecked"];
    v5 = [v3 objectForKeyedSubscript:@"MDMProtocolVersion"];
    v6 = v5;
    if (v5 && [v5 intValue] == 2)
    {
      v7 = [v3 objectForKeyedSubscript:@"ConfigurationURL"];
      if ([v7 length])
      {
        v8 = +[NSURL URLWithString:v7];
        v9 = v8;
        if (v8)
        {
          v10 = [v8 absoluteString];
          [v4 setValue:v10 forKey:@"CloudConfigEnrollmentURL"];

          v11 = +[RMLog cloudConfigController];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_10001E7F4();
          }

          v9 = v9;
          v12 = v9;
        }
        else
        {
          v13 = +[RMLog cloudConfigController];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_10001E78C();
          }

          v12 = 0;
        }
      }
      else
      {
        v9 = +[RMLog cloudConfigController];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10001E748(v9);
        }
        v12 = 0;
      }
    }
    else
    {
      v7 = +[RMLog cloudConfigController];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10001E6E0();
      }
      v12 = 0;
    }
  }
  else
  {
    v4 = +[RMLog cloudConfigController];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10001E69C(v4);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)_updatedCloudConfig
{
  if (+[RMFeatureOverrides overrideCloudConfig])
  {
    v2 = +[RMLog cloudConfigController];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Using OverrideCloudConfig", buf, 2u);
    }

    id v3 = +[RMLocations baseDirectoryURLCreateIfNeeded:1];
    v4 = [v3 URLByAppendingPathComponent:@"DEP.plist"];

    v5 = +[NSDictionary dictionaryWithContentsOfURL:v4];
  }
  else
  {
    *(void *)buf = 0;
    v15 = buf;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10001E430;
    v18 = sub_10001E440;
    id v19 = 0;
    v6 = +[MCProfileConnection sharedConnection];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001E448;
    v10[3] = &unk_1000C5608;
    v13 = buf;
    id v7 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
    id v11 = v7;
    id v8 = v6;
    id v12 = v8;
    [v8 retrieveCloudConfigurationDetailsCompletionBlock:v10];
    [v7 lockWhenCondition:1];
    [v7 unlock];
    if (*((void *)v15 + 5))
    {
      v5 = 0;
    }
    else
    {
      v5 = [v8 cloudConfigurationDetails];
    }

    _Block_object_dispose(buf, 8);
  }

  return v5;
}

@end