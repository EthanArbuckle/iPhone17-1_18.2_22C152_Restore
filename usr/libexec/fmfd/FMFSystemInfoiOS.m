@interface FMFSystemInfoiOS
- (BOOL)e928760c5fbc1719e59c427e2be01ce6;
- (BOOL)isFMFAppRemoved;
- (BOOL)isInMultiUserMode;
- (id)_deviceInfoForKey:(__CFString *)a3;
- (id)appVersion;
- (id)deviceClass;
- (id)deviceModelName;
- (id)deviceName;
- (id)deviceUDID;
- (id)iCloudAccountName;
- (id)osName;
- (id)osVersion;
- (id)productType;
- (id)regionCode;
- (id)sourceVersion;
- (int64_t)bundleVersion;
@end

@implementation FMFSystemInfoiOS

- (id)_deviceInfoForKey:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswer();

  return v3;
}

- (id)productType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000144BC;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  if (qword_1000BB6D8 != -1) {
    dispatch_once(&qword_1000BB6D8, block);
  }
  return (id)qword_1000BB6D0;
}

- (id)deviceClass
{
  v2 = [(FMFSystemInfoiOS *)self _deviceInfoForKey:@"DeviceName"];
  v3 = v2;
  if (v2)
  {
    if ([(__CFString *)v2 isEqualToString:@"iPod"]) {
      v4 = @"iPod touch";
    }
    else {
      v4 = v3;
    }
  }
  else
  {
    v4 = @"Unknown";
  }
  v5 = v4;

  return v5;
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

- (id)sourceVersion
{
  if (qword_1000BB6E8 != -1) {
    dispatch_once(&qword_1000BB6E8, &stru_1000A1D88);
  }
  v2 = (void *)qword_1000BB6E0;

  return v2;
}

- (id)deviceUDID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014AB8;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  if (qword_1000BB6F8 != -1) {
    dispatch_once(&qword_1000BB6F8, block);
  }
  return (id)qword_1000BB6F0;
}

- (id)osName
{
  return @"iPhone OS";
}

- (id)osVersion
{
  v2 = [(FMFSystemInfoiOS *)self _deviceInfoForKey:@"ProductVersion"];
  v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  id v4 = v2;

  return v4;
}

- (id)deviceName
{
  v2 = [(FMFSystemInfoiOS *)self _deviceInfoForKey:@"UserAssignedDeviceName"];
  v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  id v4 = v2;

  return v4;
}

- (id)deviceModelName
{
  v2 = [(FMFSystemInfoiOS *)self _deviceInfoForKey:@"DeviceName"];
  v3 = v2;
  if (v2)
  {
    if ([(__CFString *)v2 isEqualToString:@"iPod"]) {
      id v4 = @"iPod touch";
    }
    else {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = @"Unknown";
  }
  v5 = v4;

  return v5;
}

- (BOOL)e928760c5fbc1719e59c427e2be01ce6
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isPasscodeSet];

  return v3;
}

- (id)regionCode
{
  return (id)_CPGetDeviceRegionCode(self, a2);
}

- (id)iCloudAccountName
{
  v2 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v3 = [v2 account];
  id v4 = [v3 iCloudId];

  return v4;
}

- (BOOL)isFMFAppRemoved
{
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.findmy"] ^ 1;

  return v3;
}

- (BOOL)isInMultiUserMode
{
  return 0;
}

@end