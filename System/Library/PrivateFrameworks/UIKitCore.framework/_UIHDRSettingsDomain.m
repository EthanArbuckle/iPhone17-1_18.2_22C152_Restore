@interface _UIHDRSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIHDRSettingsDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIHDRSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"UIKit";
}

+ (id)domainName
{
  return @"HDR";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end