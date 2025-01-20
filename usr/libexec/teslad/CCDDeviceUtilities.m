@interface CCDDeviceUtilities
+ (BOOL)isAppleTV;
+ (BOOL)isHomePod;
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningInDiagnosticsMode;
+ (BOOL)isRunningInRecovery;
+ (BOOL)isRunningInRootLaunchdContext;
+ (BOOL)isWatch;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (id)UDID;
+ (id)_systemInfo;
+ (id)deviceCapacity;
+ (id)deviceColor;
+ (id)deviceType;
+ (id)modelNumber;
+ (id)productBuildVersion;
+ (id)productName;
+ (id)productVersion;
+ (id)serialNumber;
@end

@implementation CCDDeviceUtilities

+ (id)deviceType
{
  v2 = (__CFString *)MGCopyAnswer();
  if (!v2) {
    v2 = @"iPhone";
  }

  return v2;
}

+ (BOOL)isiPad
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007224;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_1000255B8 != -1) {
    dispatch_once(&qword_1000255B8, block);
  }
  return byte_1000255B0;
}

+ (BOOL)isAppleTV
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007308;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_1000255C8 != -1) {
    dispatch_once(&qword_1000255C8, block);
  }
  return byte_1000255C0;
}

+ (BOOL)isWatch
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000073EC;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_1000255D8 != -1) {
    dispatch_once(&qword_1000255D8, block);
  }
  return byte_1000255D0;
}

+ (BOOL)isHomePod
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000074D0;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_1000255E8 != -1) {
    dispatch_once(&qword_1000255E8, block);
  }
  return byte_1000255E0;
}

+ (BOOL)isiPhone
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075B4;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_1000255F8 != -1) {
    dispatch_once(&qword_1000255F8, block);
  }
  return byte_1000255F0;
}

+ (BOOL)isRunningInRecovery
{
  return 0;
}

+ (BOOL)isRunningInRootLaunchdContext
{
  return 0;
}

+ (BOOL)isRunningInDiagnosticsMode
{
  if (qword_100025608 != -1) {
    dispatch_once(&qword_100025608, &stru_10001C918);
  }
  return byte_100025600;
}

+ (BOOL)isInternalBuild
{
  return +[CCDFeatures isAppleInternal];
}

+ (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (id)UDID
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (id)modelNumber
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (id)deviceCapacity
{
  v2 = (void *)MGCopyAnswer();
  v3 = [v2 objectForKey:kMGQDiskUsageTotalDataCapacity];

  return v3;
}

+ (id)deviceColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (id)_systemInfo
{
  if (qword_100025618 != -1) {
    dispatch_once(&qword_100025618, &stru_10001C938);
  }
  v2 = (void *)qword_100025610;

  return v2;
}

+ (id)productName
{
  v2 = [a1 _systemInfo];
  v3 = [v2 objectForKeyedSubscript:@"ProductName"];

  return v3;
}

+ (id)productVersion
{
  v2 = [a1 _systemInfo];
  v3 = [v2 objectForKeyedSubscript:@"ProductVersion"];

  return v3;
}

+ (id)productBuildVersion
{
  v2 = [a1 _systemInfo];
  v3 = [v2 objectForKeyedSubscript:@"ProductBuildVersion"];

  return v3;
}

@end