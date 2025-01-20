@interface WFSystemActionConfigurationPrototypeSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation WFSystemActionConfigurationPrototypeSettingsDomain

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)domainName
{
  return @"Pencil Squeeze Configuration";
}

+ (id)domainGroupName
{
  return @"Shortcuts";
}

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFSystemActionConfigurationPrototypeSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

@end