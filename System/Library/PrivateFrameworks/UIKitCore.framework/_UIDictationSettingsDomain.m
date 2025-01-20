@interface _UIDictationSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIDictationSettingsDomain

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIDictationSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"UIKit";
}

+ (id)domainName
{
  return @"Dictation";
}

@end