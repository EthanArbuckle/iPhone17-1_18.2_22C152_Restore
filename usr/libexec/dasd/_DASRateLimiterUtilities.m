@interface _DASRateLimiterUtilities
+ (BOOL)consideredInLPMWithState:(id)a3;
+ (BOOL)isAggregateClient:(id)a3;
+ (id)assetsRateLimitConfiguration;
+ (id)ckRateLimitConfiguration;
+ (id)defaultRateLimiterConfiguration;
+ (id)getCurrentBootSessionUUID;
+ (id)pecRateLimitConfiguration;
+ (id)rateLimitIdentifierForActivity:(id)a3;
+ (void)adjustStartAfterDate:(id)a3 forActivity:(id)a4;
@end

@implementation _DASRateLimiterUtilities

+ (id)defaultRateLimiterConfiguration
{
  v2 = +[NSMutableArray array];
  v3 = +[_DASActivityRateLimit rateLimitWithMaximum:25 perWindow:300.0];
  [v2 addObject:v3];
  v4 = +[_DASActivityRateLimit rateLimitWithMaximum:60 perWindow:3600.0];

  [v2 addObject:v4];
  v5 = +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:_DASDefaultConfigurationName andLimits:v2];

  return v5;
}

+ (id)rateLimitIdentifierForActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 rateLimitConfigurationName];
  if (v5)
  {
    v6 = +[NSMutableString stringWithString:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v4 widgetID];

  if (v7) {
    goto LABEL_5;
  }
  if (v5)
  {
    if (![v5 isEqualToString:_DASCKRateLimitConfigurationName]
      || ([v4 relatedApplications],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
LABEL_5:
      id v8 = v6;
LABEL_6:
      v9 = v8;
      goto LABEL_7;
    }
    v12 = [v4 relatedApplications];
    v13 = [v12 firstObject];

    [v6 appendFormat:@"-%@", v13];
    id v14 = v6;
    goto LABEL_24;
  }
  v15 = [v4 identifier];
  unsigned int v16 = [v15 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

  if (v16)
  {
    id v8 = _DASAssetsRateLimitConfigurationName;
    goto LABEL_6;
  }
  if ([a1 isAggregateClient:v4])
  {
    v17 = [v4 relatedApplications];
    id v18 = [v17 count];

    if (v18) {
      goto LABEL_18;
    }
  }
  v20 = [v4 serviceName];

  if (v20)
  {
    id v8 = [v4 serviceName];
    goto LABEL_6;
  }
  v21 = [v4 involvedProcesses];
  id v22 = [v21 count];

  if (v22)
  {
    v19 = [v4 involvedProcesses];
    goto LABEL_23;
  }
  v23 = [v4 relatedApplications];
  id v24 = [v23 count];

  if (v24)
  {
LABEL_18:
    v19 = [v4 relatedApplications];
LABEL_23:
    v13 = v19;
    id v14 = [v19 objectAtIndexedSubscript:0];
LABEL_24:
    v9 = v14;

    goto LABEL_7;
  }
  v9 = [v4 bundleId];

  if (v9)
  {
    id v8 = [v4 bundleId];
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

+ (BOOL)isAggregateClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 groupName];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v3 groupName];
    unsigned __int8 v7 = [v6 isEqualToString:@"NSURLSessionBackgroundPoolName"];

    if (v7) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = [v3 groupName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v3 groupName];
    unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.ckdiscretionaryd"];

    if (v11) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = [v3 groupName];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [v3 groupName];
    unsigned __int8 v15 = [v14 containsString:@"com.apple.mlhost"];

    if (v15) {
      goto LABEL_8;
    }
  }
  unsigned int v16 = [v3 widgetID];

  if (v16)
  {
LABEL_8:
    LOBYTE(v17) = 1;
  }
  else
  {
    v19 = [v3 rateLimitConfigurationName];
    uint64_t v17 = [v19 isEqualToString:_DASCKRateLimitConfigurationName];
  }
  return v17;
}

+ (id)ckRateLimitConfiguration
{
  v2 = +[NSMutableArray array];
  id v3 = +[_DASActivityRateLimit rateLimitWithMaximum:60 perWindow:60.0];
  [v2 addObject:v3];
  uint64_t v4 = +[_DASActivityRateLimit rateLimitWithMaximum:120 perWindow:300.0];

  [v2 addObject:v4];
  v5 = +[_DASActivityRateLimit rateLimitWithMaximum:360 perWindow:3600.0];

  [v2 addObject:v5];
  v6 = +[_DASActivityRateLimit rateLimitWithMaximum:480 perWindow:14400.0];

  [v2 addObject:v6];
  unsigned __int8 v7 = +[_DASActivityRateLimit rateLimitWithMaximum:1080 perWindow:86400.0];

  [v2 addObject:v7];
  uint64_t v8 = +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:_DASCKRateLimitConfigurationName andLimits:v2];

  return v8;
}

+ (id)pecRateLimitConfiguration
{
  v2 = +[NSMutableArray array];
  id v3 = +[_DASActivityRateLimit rateLimitWithMaximum:100 perWindow:86400.0];
  [v2 addObject:v3];
  uint64_t v4 = +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:_DASPECRateLimitConfigurationName andLimits:v2];

  return v4;
}

+ (id)assetsRateLimitConfiguration
{
  v2 = +[NSMutableArray array];
  id v3 = +[_DASActivityRateLimit rateLimitWithMaximum:1 perWindow:1800.0];
  [v2 addObject:v3];
  uint64_t v4 = +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:_DASAssetsRateLimitConfigurationName andLimits:v2];

  return v4;
}

+ (BOOL)consideredInLPMWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_CDContextQueries keyPathForPluginStatus];
  v5 = [v3 objectForKeyedSubscript:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  unsigned __int8 v7 = +[_CDContextQueries keyPathForLowPowerModeStatus];
  uint64_t v8 = [v3 objectForKeyedSubscript:v7];

  LOBYTE(v3) = [v8 BOOLValue];
  return v3 & ~v6;
}

+ (void)adjustStartAfterDate:(id)a3 forActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 startAfter];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v6 startAfter],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 timeIntervalSinceDate:v5],
        double v11 = v10,
        v9,
        v8,
        v11 >= 0.0))
  {
    uint64_t v12 = +[_DASDaemonLogger logForCategory:@"processRateLimiter"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 identifier];
      id v14 = [v6 startAfter];
      int v15 = 138412802;
      unsigned int v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activity %@ already has same or later start date %@ than proposed start date %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    [v6 setStartAfter:v5];
  }
}

+ (id)getCurrentBootSessionUUID
{
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x9BDD93B3uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  id v3 = +[NSString stringWithUTF8String:v2];
  free(v2);

  return v3;
}

@end