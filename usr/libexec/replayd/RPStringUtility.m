@interface RPStringUtility
+ (BOOL)isInvalidBundleId:(id)a3;
+ (id)numberFromString:(id)a3;
+ (unint64_t)rotatingDeviceUniqueID;
@end

@implementation RPStringUtility

+ (id)numberFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSNumberFormatter);
  v5 = [v4 numberFromString:v3];

  return v5;
}

+ (unint64_t)rotatingDeviceUniqueID
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"kSCDeviceUniqueID"];
    if (!v4)
    {
      v5 = +[NSUUID UUID];
      id v4 = [v5 UUIDString];

      [v3 setObject:v4 forKey:@"kSCDeviceUniqueID"];
      [v3 synchronize];
    }
    v6 = +[NSCalendar currentCalendar];
    v7 = +[NSDate date];
    v8 = [v6 components:8196 fromDate:v7];

    v9 = +[NSString stringWithFormat:](NSString, @"%@%lu%lu", v4, [v8 yearForWeekOfYear], objc_msgSend(v8, "weekOfYear"));
    id v10 = [v9 hash];
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000543FC();
    }
    id v10 = 0;
  }

  return (unint64_t)v10;
}

+ (BOOL)isInvalidBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && [v3 caseInsensitiveCompare:@"(null)"]
    && [v3 caseInsensitiveCompare:@"Unknown"])
  {
    BOOL v4 = 0;
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054494((uint64_t)v3);
    }
    BOOL v4 = 1;
  }

  return v4;
}

@end