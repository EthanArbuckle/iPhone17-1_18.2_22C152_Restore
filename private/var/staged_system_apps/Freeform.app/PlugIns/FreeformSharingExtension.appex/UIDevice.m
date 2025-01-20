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
  if (qword_10007DBB8 != -1) {
    dispatch_once(&qword_10007DBB8, &stru_100071D58);
  }
  v2 = (void *)qword_10007DBB0;

  return v2;
}

+ (BOOL)crl_phoneUI
{
  if ((byte_10007DBC0 & 1) == 0)
  {
    v2 = +[UIDevice currentDevice];
    qword_10007DBC8 = (uint64_t)[v2 userInterfaceIdiom];

    byte_10007DBC0 = 1;
  }
  return qword_10007DBC8 == 0;
}

+ (BOOL)crl_padUI
{
  if ((byte_10007DBC0 & 1) == 0)
  {
    v2 = +[UIDevice currentDevice];
    qword_10007DBC8 = (uint64_t)[v2 userInterfaceIdiom];

    byte_10007DBC0 = 1;
  }
  return qword_10007DBC8 == 1;
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