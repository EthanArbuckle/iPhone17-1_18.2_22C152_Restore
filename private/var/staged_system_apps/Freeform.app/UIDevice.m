@interface UIDevice
+ (BOOL)crl_iPadDevice;
+ (BOOL)crl_iPodTouchDevice;
+ (BOOL)crl_landscapePhoneUI;
+ (BOOL)crl_padUI;
+ (BOOL)crl_phoneDevice;
+ (BOOL)crl_phoneUI;
+ (id)crl_platformString;
@end

@implementation UIDevice

+ (id)crl_platformString
{
  if (qword_1016A9090 != -1) {
    dispatch_once(&qword_1016A9090, &stru_1014D5198);
  }
  v2 = (void *)qword_1016A9088;

  return v2;
}

+ (BOOL)crl_phoneUI
{
  if ((byte_1016A9098 & 1) == 0)
  {
    v2 = +[UIDevice currentDevice];
    qword_1016A90A0 = (uint64_t)[v2 userInterfaceIdiom];

    byte_1016A9098 = 1;
  }
  return qword_1016A90A0 == 0;
}

+ (BOOL)crl_padUI
{
  if ((byte_1016A9098 & 1) == 0)
  {
    v2 = +[UIDevice currentDevice];
    qword_1016A90A0 = (uint64_t)[v2 userInterfaceIdiom];

    byte_1016A9098 = 1;
  }
  return qword_1016A90A0 == 1;
}

+ (BOOL)crl_phoneDevice
{
  v2 = +[UIDevice currentDevice];
  v3 = [v2 model];
  unsigned __int8 v4 = [v3 hasPrefix:@"iPhone"];

  return v4;
}

+ (BOOL)crl_iPodTouchDevice
{
  v2 = +[UIDevice currentDevice];
  v3 = [v2 model];
  unsigned __int8 v4 = [v3 hasPrefix:@"iPod touch"];

  return v4;
}

+ (BOOL)crl_iPadDevice
{
  v2 = +[UIDevice currentDevice];
  v3 = [v2 model];
  unsigned __int8 v4 = [v3 hasPrefix:@"iPad"];

  return v4;
}

+ (BOOL)crl_landscapePhoneUI
{
  BOOL v2 = +[UIDevice crl_phoneUI];
  if (v2)
  {
    LOBYTE(v2) = +[UIScreen crl_deviceIsLandscape];
  }
  return v2;
}

@end