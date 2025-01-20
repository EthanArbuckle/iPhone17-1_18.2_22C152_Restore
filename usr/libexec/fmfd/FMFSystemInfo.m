@interface FMFSystemInfo
+ (id)sharedInstance;
- (BOOL)e928760c5fbc1719e59c427e2be01ce6;
- (BOOL)isAudioAccessory;
- (BOOL)isBuddyDone;
- (BOOL)isFMFAppRemoved;
- (BOOL)isInMultiUserMode;
- (BOOL)isLocked;
- (id)appName;
- (id)appVersion;
- (id)buildVersion;
- (id)bundleIdentifier;
- (id)clientInfoVersionTagString;
- (id)deviceClass;
- (id)deviceModelName;
- (id)deviceName;
- (id)deviceUDID;
- (id)iCloudAccountName;
- (id)longVersionString;
- (id)osBuildVersion;
- (id)osName;
- (id)osVersion;
- (id)productType;
- (id)regionCode;
- (id)sourceVersion;
- (id)sourceVersionFromVersionFile;
- (int)processId;
- (int64_t)bundleVersion;
- (unint64_t)unlockState;
@end

@implementation FMFSystemInfo

+ (id)sharedInstance
{
  if (qword_1000BB748 != -1) {
    dispatch_once(&qword_1000BB748, &stru_1000A2248);
  }
  v2 = (void *)qword_1000BB740;

  return v2;
}

- (id)productType
{
  return 0;
}

- (id)deviceClass
{
  return 0;
}

- (id)appVersion
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  return v3;
}

- (int64_t)bundleVersion
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleVersion"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)bundleIdentifier
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleIdentifier"];

  return v3;
}

- (id)sourceVersion
{
  return 0;
}

- (id)buildVersion
{
  v2 = self;
  objc_sync_enter(v2);
  if (!qword_1000BB750)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 pathForResource:@"version" ofType:@"plist"];

    if (v4)
    {
      v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
      v6 = [v5 objectForKey:@"ProductBuildVersion"];
      id v7 = [v6 copy];
      v8 = (void *)qword_1000BB750;
      qword_1000BB750 = (uint64_t)v7;

      if (!qword_1000BB750)
      {
        qword_1000BB750 = @"unknown";
      }
    }
  }
  objc_sync_exit(v2);

  v9 = (void *)qword_1000BB750;

  return v9;
}

- (id)sourceVersionFromVersionFile
{
  v2 = self;
  objc_sync_enter(v2);
  if (!qword_1000BB758)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 pathForResource:@"version" ofType:@"plist"];

    if (v4)
    {
      v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
      v6 = [v5 objectForKey:@"SourceVersion"];
      id v7 = [v6 copy];
      v8 = (void *)qword_1000BB758;
      qword_1000BB758 = (uint64_t)v7;

      uint64_t v9 = [qword_1000BB758 substringWithRange:0, 3];
      v10 = (void *)qword_1000BB758;
      qword_1000BB758 = v9;
    }
  }
  objc_sync_exit(v2);

  v11 = (void *)qword_1000BB758;

  return v11;
}

- (id)clientInfoVersionTagString
{
  uint64_t v3 = [(FMFSystemInfo *)self sourceVersionFromVersionFile];
  id v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"dev";
  }
  v6 = v5;

  id v7 = [(FMFSystemInfo *)self appVersion];
  if ([(__CFString *)v6 isEqualToString:@"dev"])
  {
    v8 = @"100.000000";
  }
  else
  {
    uint64_t v9 = (char *)[(__CFString *)v6 length] - 1;
    if ((unint64_t)v9 <= 2)
    {
      uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", *(&off_1000A2288 + (void)v9), v6);

      v6 = (__CFString *)v10;
    }
    v11 = [v7 rangeOfString:@"."];
    v12 = [v7 substringWithRange:v11, [v7 length] - v11];
    if ((unint64_t)[v12 length] <= 2)
    {
      uint64_t v13 = [v7 stringByAppendingString:@"0"];

      id v7 = (void *)v13;
    }
    v14 = [v7 stringByReplacingOccurrencesOfString:@"." withString:&stru_1000A3938];

    v15 = [v14 substringToIndex:1];
    v16 = [v14 substringFromIndex:1];
    id v7 = +[NSString stringWithFormat:@"%@.%@", v15, v16];

    v8 = +[NSString stringWithFormat:@"%@%@", v7, v6];
  }

  return v8;
}

- (id)osBuildVersion
{
  if (qword_1000BB768 != -1) {
    dispatch_once(&qword_1000BB768, &stru_1000A2268);
  }
  v2 = (void *)qword_1000BB760;

  return v2;
}

- (id)longVersionString
{
  uint64_t v3 = [(FMFSystemInfo *)self appVersion];
  id v4 = [(FMFSystemInfo *)self buildVersion];
  v5 = +[NSString stringWithFormat:@"%@ (%@)", v3, v4];

  return v5;
}

- (id)deviceUDID
{
  return 0;
}

- (id)osName
{
  return 0;
}

- (id)osVersion
{
  return 0;
}

- (id)appName
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 infoDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"CFBundleName"];

  return v4;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  return 0;
}

- (BOOL)e928760c5fbc1719e59c427e2be01ce6
{
  return 1;
}

- (id)regionCode
{
  return 0;
}

- (BOOL)isLocked
{
  int v2 = MKBGetDeviceLockState();
  return v2 == 1 || v2 == 4;
}

- (unint64_t)unlockState
{
  int v3 = MKBDeviceUnlockedSinceBoot();
  if (v3 != 1 && (v3 & 0x80000000) == 0) {
    return 1;
  }
  if ([(FMFSystemInfo *)self isLocked]) {
    return 2;
  }
  return 3;
}

- (int)processId
{
  int v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)isInMultiUserMode
{
  return 0;
}

- (BOOL)isBuddyDone
{
  return 1;
}

- (id)iCloudAccountName
{
  int v2 = +[FMFAccountManager sharedInstance];
  int v3 = [v2 account];
  id v4 = [v3 iCloudId];

  return v4;
}

- (BOOL)isFMFAppRemoved
{
  return 0;
}

- (BOOL)isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

@end