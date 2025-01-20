@interface APPCPolicySettings
+ (id)defaultValues;
+ (id)loadDeviceHeaderInfo;
+ (id)policySettingsURL;
+ (id)storageWithDefaultValues:(id)a3;
- (BOOL)dataFetchedFromServer;
@end

@implementation APPCPolicySettings

- (BOOL)dataFetchedFromServer
{
  return byte_100288938;
}

+ (id)loadDeviceHeaderInfo
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = +[NSISO8601DateFormatter apDefaultSharedFormatter];
  v4 = +[APDeviceInfo current];
  v5 = +[APIDAccountProvider privateUserAccount];
  v6 = [v5 storefront];
  v7 = [v4 userAgentStringForBundleID:@"com.apple.ap.promotedcontentd" storefront:v6];

  v17 = v5;
  v8 = [v5 storefront];
  v9 = [v4 systemVersion];
  v10 = [v4 systemName];
  v16 = [v4 deviceModel];
  v11 = [v4 buildVersion];
  v12 = +[NSDate date];
  v13 = [v3 stringFromDate:v12];

  if ([v7 length]) {
    [v2 setObject:v7 forKey:@"User-Agent"];
  }
  if ([v8 length]) {
    [v2 setObject:v8 forKey:@"storefront"];
  }
  if ([v9 length]) {
    [v2 setObject:v9 forKey:@"osVersion"];
  }
  if ([v10 length]) {
    [v2 setObject:v10 forKey:@"osPlatform"];
  }
  if ([v16 length]) {
    [v2 setObject:v16 forKey:@"device"];
  }
  if ([@"com.apple.ap.promotedcontentd" length]) {
    [v2 setObject:@"com.apple.ap.promotedcontentd" forKey:@"bundleId"];
  }
  if ([v11 length]) {
    [v2 setObject:v11 forKey:@"osBuild"];
  }
  if ([v13 length]) {
    [v2 setObject:v13 forKey:@"timestamp"];
  }
  id v14 = [v2 copy];

  return v14;
}

+ (id)policySettingsURL
{
  id v2 = kAPServerEnvironmentProductionBaseURL;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    id v4 = [v3 initWithSuiteName:APDefaultsBundleID];
    v5 = [v4 stringForKey:kAPServerEnvironmentKey];
    v6 = v5;
    if (!v5 || ([v5 isEqualToString:kAPServerEnvironmentProduction] & 1) != 0) {
      goto LABEL_13;
    }
    if ([v6 isEqualToString:kAPServerEnvironmentQE1])
    {
      v7 = (id *)&kAPDisplayServerQE1Base;
    }
    else if ([v6 isEqualToString:kAPServerEnvironmentQE2])
    {
      v7 = (id *)&kAPDisplayServerQE2Base;
    }
    else if ([v6 isEqualToString:kAPServerEnvironmentQE3])
    {
      v7 = (id *)&kAPDisplayServerQE3Base;
    }
    else
    {
      if (![v6 isEqualToString:kAPServerEnvironmentQE4])
      {
LABEL_13:

        goto LABEL_14;
      }
      v7 = (id *)&kAPDisplayServerQE4Base;
    }
    id v8 = *v7;

    id v2 = v8;
    goto LABEL_13;
  }
LABEL_14:
  v9 = [v2 stringByAppendingString:@"2/policy/display"];
  v10 = +[NSURL URLWithString:v9];

  return v10;
}

+ (id)storageWithDefaultValues:(id)a3
{
  id v4 = a3;
  v5 = [a1 policySettingsURL];
  v6 = [a1 loadDeviceHeaderInfo];
  id v7 = [objc_alloc((Class)APSettingsStorageServer) initWithURL:v5 headers:v6 defaultValues:v4];

  byte_100288938 = [v7 didFetchFromServer];

  return v7;
}

+ (id)defaultValues
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = +[NSMutableDictionary dictionary];
  v12 = +[NSMutableArray array];
  v16[0] = @"value";
  v16[1] = @"adFormatType";
  v17[0] = &off_100248FF0;
  v17[1] = @"carousel";
  v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v12 addObject:v13];
  [v3 setObject:v12 forKey:@"timer"];
  id v4 = +[NSMutableDictionary dictionary];
  v5 = +[NSMutableArray array];
  v14[0] = @"value";
  v14[1] = @"adFormatType";
  v15[0] = &off_100249008;
  v15[1] = @"carousel";
  v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v5 addObject:v6];
  [v4 setObject:v5 forKey:@"timer"];
  id v7 = +[NSMutableArray array];
  [v4 setObject:v7 forKey:@"spacing"];

  [v3 setObject:v4 forKey:@"adSessionBefore"];
  id v8 = +[NSMutableArray array];
  [v3 setObject:v8 forKey:@"spacing"];

  v9 = +[NSMutableArray array];
  [v3 setObject:v9 forKey:@"adsAllowed"];

  v10 = +[NSMutableArray array];
  [v3 setObject:v10 forKey:@"adSessionAfter"];

  [v2 setObject:v3 forKey:@"policy"];

  return v2;
}

@end