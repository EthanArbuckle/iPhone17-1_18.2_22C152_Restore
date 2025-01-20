@interface WCMobileGestaltBridge
+ (BOOL)isIPad;
+ (id)_getStringAnswer:(__CFString *)a3;
+ (id)buildVersion;
+ (id)marketingProductName;
+ (id)productVersion;
@end

@implementation WCMobileGestaltBridge

+ (id)_getStringAnswer:(__CFString *)a3
{
  return (id)MEMORY[0x1F417CE38](a3, a2);
}

+ (id)productVersion
{
  return (id)[a1 _getStringAnswer:@"ProductVersion"];
}

+ (id)marketingProductName
{
  return (id)[a1 _getStringAnswer:@"j9Th5smJpdztHwc+i39zIg"];
}

+ (id)buildVersion
{
  return (id)[a1 _getStringAnswer:@"BuildVersion"];
}

+ (BOOL)isIPad
{
  return MGGetBoolAnswer();
}

@end