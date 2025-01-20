@interface _UIBarSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIBarSettingsDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIBarSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)domainGroupName
{
  return @"UIKit";
}

+ (id)domainName
{
  return @"Bars";
}

@end