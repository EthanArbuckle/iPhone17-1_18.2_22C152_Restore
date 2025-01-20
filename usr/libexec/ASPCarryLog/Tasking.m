@interface Tasking
+ (void)startDpTaskingMonitorOnDispatchQ:(id)a3 andWorkDir:(id)a4;
- (BOOL)LoadTasking;
- (BOOL)evaluateTaskingCriteria:(id)a3 doWhiteListCheck:(BOOL)a4;
- (BOOL)isDeviceTasked;
- (BOOL)validate;
- (NSDate)dpTaskingExpireTime;
- (NSDictionary)myTaskingDict;
- (NSString)workDir;
- (StatsProvider)myStatsProvider;
- (Tasking)initWithWorkDir:(id)a3;
- (id)LoadFromPlist:(id)a3 forKey:(id)a4;
- (id)getTaskingCriteria;
- (id)getTaskingID;
- (int64_t)getTaskingDurationInSeconds;
- (int64_t)getTaskingSizeLimitInBytes;
- (void)setDpTaskingExpireTime:(id)a3;
- (void)setMyStatsProvider:(id)a3;
- (void)setMyTaskingDict:(id)a3;
- (void)setWorkDir:(id)a3;
- (void)tryLoadDPTasking;
@end

@implementation Tasking

- (Tasking)initWithWorkDir:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Tasking;
  v6 = [(Tasking *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workDir, a3);
    myTaskingDict = v7->_myTaskingDict;
    v7->_myTaskingDict = 0;

    v9 = v7;
  }

  return v7;
}

+ (void)startDpTaskingMonitorOnDispatchQ:(id)a3 andWorkDir:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011734;
  v8[3] = &unk_100090AB0;
  id v9 = a3;
  id v10 = a4;
  uint64_t v5 = qword_1000C88D0;
  id v6 = v10;
  id v7 = v9;
  if (v5 != -1) {
    dispatch_once(&qword_1000C88D0, v8);
  }
}

- (void)tryLoadDPTasking
{
  v4 = [(Tasking *)self workDir];
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"dp_tasking_payload.plist"];

  id v6 = +[NSURL fileURLWithPath:v5];
  id v7 = +[NSFileManager defaultManager];
  if ([v7 fileExistsAtPath:v5])
  {
    v8 = +[NSDictionary dictionaryWithContentsOfURL:v6 error:0];
    id v9 = [v8 objectForKeyedSubscript:@"expire_time"];
    if (v9
      && (+[NSDate now],
          id v2 = (id)objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 compare:v2],
          v2,
          v10 == (id)1))
    {
      objc_super v11 = [(Tasking *)self myTaskingDict];

      if (!v11)
      {
        v12 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading tasking payload from DP", (uint8_t *)&v16, 2u);
        }
        v13 = [v8 objectForKeyedSubscript:@"payload"];
        [(Tasking *)self setMyTaskingDict:v13];
      }
    }
    else
    {
      v14 = (id)oslog;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v9)
        {
          DateTimeToStr(v9);
          id v2 = objc_claimAutoreleasedReturnValue();
          v15 = (const char *)[v2 UTF8String];
        }
        else
        {
          v15 = "N/A";
        }
        int v16 = 136315138;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting expired payload with expire date %s", (uint8_t *)&v16, 0xCu);
        if (v9) {
      }
        }
      [v7 removeItemAtPath:v5 error:0];
    }
  }
  else
  {
    id v9 = 0;
    v8 = 0;
  }
}

- (BOOL)LoadTasking
{
  v4 = [(Tasking *)self LoadFromPlist:@"com.apple.da" forKey:@"ASPCarryLog_tasking"];
  if (v4) {
    [(Tasking *)self LoadTaskingFromDict:v4];
  }
  [(Tasking *)self tryLoadDPTasking];
  uint64_t v5 = (id)oslog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(Tasking *)self isDeviceTasked];
    if (v6)
    {
      id v2 = [(Tasking *)self getTaskingID];
      id v7 = (const char *)[v2 UTF8String];
    }
    else
    {
      id v7 = "None";
    }
    int v10 = 136315138;
    objc_super v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DA tasking info loaded. Tasking id: %s", (uint8_t *)&v10, 0xCu);
    if (v6) {
  }
    }
  v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100046FF8(v8, self);
  }

  return 1;
}

- (id)LoadFromPlist:(id)a3 forKey:(id)a4
{
  v4 = (void *)CFPreferencesCopyValue((CFStringRef)a4, (CFStringRef)a3, @"mobile", kCFPreferencesCurrentHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isDeviceTasked
{
  id v2 = [(Tasking *)self getTaskingID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)getTaskingID
{
  BOOL v3 = [(Tasking *)self myTaskingDict];
  v4 = [v3 valueForKey:@"TASKING_ID"];

  if (!v4
    || ([v4 isEqualToString:&stru_100091D90] & 1) != 0
    || [(Tasking *)self getTaskingDurationInSeconds] < 0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (int64_t)getTaskingDurationInSeconds
{
  id v2 = [(Tasking *)self myTaskingDict];
  BOOL v3 = [v2 objectForKeyedSubscript:@"TASKING_DURATION_SECONDS"];
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (int64_t)getTaskingSizeLimitInBytes
{
  id v2 = [(Tasking *)self myTaskingDict];
  BOOL v3 = [v2 objectForKeyedSubscript:@"TASKING_SIZE_LIMIT_BYTES"];
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (id)getTaskingCriteria
{
  id v2 = [(Tasking *)self myTaskingDict];
  BOOL v3 = [v2 objectForKeyedSubscript:@"TASKING_CRITERIA"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    id v4 = +[NSArray arrayWithObjects:&v7 count:1];
    v8 = v4;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)validate
{
  BOOL v3 = [(Tasking *)self myTaskingDict];
  id v4 = [v3 objectForKeyedSubscript:@"TASKING_CRITERIA_VERSION"];

  id v5 = [(Tasking *)self myTaskingDict];
  unsigned int v6 = [v5 objectForKeyedSubscript:@"TASKING_SIZE_LIMIT_BYTES"];

  id v7 = [(Tasking *)self myTaskingDict];
  v8 = [v7 objectForKeyedSubscript:@"TASKING_ID"];

  id v9 = [(Tasking *)self getTaskingCriteria];

  objc_opt_class();
  BOOL v10 = (objc_opt_isKindOfClass() & 1) != 0 && (int)[v4 intValue] < 3;
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && (uint64_t)[v6 longLongValue] > 0;
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12 && v10;
  BOOL v14 = v13 && v11;

  return v14;
}

- (BOOL)evaluateTaskingCriteria:(id)a3 doWhiteListCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(Tasking *)self validate])
  {
    id v7 = [(Tasking *)self getTaskingCriteria];
    id v8 = [[TaskingCriteriaRange alloc] initFromTaskingCrit:v7];
    unsigned __int8 v9 = [v8 evaluateCriteriaUsingStatsProvider:v6 doWhiteListCheck:v4];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (StatsProvider)myStatsProvider
{
  return self->_myStatsProvider;
}

- (void)setMyStatsProvider:(id)a3
{
}

- (NSDictionary)myTaskingDict
{
  return self->_myTaskingDict;
}

- (void)setMyTaskingDict:(id)a3
{
}

- (NSDate)dpTaskingExpireTime
{
  return self->_dpTaskingExpireTime;
}

- (void)setDpTaskingExpireTime:(id)a3
{
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workDir, 0);
  objc_storeStrong((id *)&self->_dpTaskingExpireTime, 0);
  objc_storeStrong((id *)&self->_myTaskingDict, 0);

  objc_storeStrong((id *)&self->_myStatsProvider, 0);
}

@end