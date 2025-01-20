@interface _UIButtonSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIButtonSettingsDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIButtonSettingsDomain;
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
  return @"Buttons";
}

@end