@interface JSADevice
+ (BOOL)isInternalBuild;
+ (BOOL)wapiCapability;
+ (JSAScreen)mainScreen;
+ (NSArray)preferredLanguages;
+ (NSArray)preferredLocalizations;
+ (NSDictionary)diskUsage;
+ (NSString)guid;
+ (NSString)localeIdentifier;
+ (NSString)model;
+ (NSString)platform;
+ (NSString)productType;
+ (NSString)systemVersion;
+ (NSString)userAgent;
+ (void)diskUsageAsync:(id)a3;
@end

@implementation JSADevice

+ (JSAScreen)mainScreen
{
  v2 = objc_alloc_init(JSAScreen);

  return v2;
}

+ (NSDictionary)diskUsage
{
  v2 = (void *)MGCopyAnswer();
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v12[0] = @"totalSystemCapacity";
  v12[1] = @"totalSystemAvailable";
  v13[0] = kMGQDiskUsageTotalSystemCapacity;
  v13[1] = kMGQDiskUsageTotalSystemAvailable;
  v12[2] = @"totalDataCapacity";
  v12[3] = @"totalDataAvailable";
  v13[2] = kMGQDiskUsageTotalDataCapacity;
  v13[3] = kMGQDiskUsageTotalDataAvailable;
  v12[4] = @"totalDiskCapacity";
  v13[4] = kMGQDiskUsageTotalDiskCapacity;
  v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C42C;
  v9[3] = &unk_B25D8;
  id v10 = v2;
  id v11 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = [v5 copy];

  return (NSDictionary *)v7;
}

+ (void)diskUsageAsync:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(17, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C598;
  v7[3] = &unk_B2600;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (NSString)systemVersion
{
  return (NSString *)+[AMSDevice productVersion];
}

+ (NSString)userAgent
{
  v2 = +[AMSProcessInfo currentProcess];
  id v3 = +[AMSUserAgent userAgentForProcessInfo:v2];

  return (NSString *)v3;
}

+ (NSString)guid
{
  return (NSString *)+[AMSDevice deviceGUID];
}

+ (NSString)model
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 model];

  return (NSString *)v3;
}

+ (NSString)platform
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 model];
  id v4 = [v3 lowercaseString];

  if (([(__CFString *)v4 isEqualToString:@"ipad"] & 1) == 0
    && ([(__CFString *)v4 isEqualToString:@"iphone"] & 1) == 0)
  {

    id v4 = @"iphone";
  }

  return (NSString *)v4;
}

+ (NSString)productType
{
  return (NSString *)sub_C7E4();
}

+ (NSArray)preferredLanguages
{
  return +[NSLocale preferredLanguages];
}

+ (NSArray)preferredLocalizations
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 preferredLocalizations];

  return (NSArray *)v3;
}

+ (NSString)localeIdentifier
{
  v2 = +[NSLocale currentLocale];
  id v3 = [v2 localeIdentifier];

  return (NSString *)v3;
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer();
}

@end